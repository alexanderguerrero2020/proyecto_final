{{
    config(
        materialized='incremental',
        unique_key='id_grant_request',
        on_schema_change='fail'
    )
}}

with 

source as (
    select * from {{ ref('base_google_drive__grant_request') }}
),

renamed as (
    select
        id_grant_request,
        title_grant_request,
        funding_organization,
        maximum_monetary_value,
        desired_amount,
        date_application,
        deadline,
        {{ dbt_utils.generate_surrogate_key(["status"]) }} as id_status,
        utc_date_load
    from source
)

{% if is_incremental() %}
,
max_utc_date_load as (
    select 
        MAX(utc_date_load) as max_load
    from {{ this }}
)
{% endif %}

select 
    id_grant_request,
    title_grant_request,
    funding_organization,
    maximum_monetary_value,
    desired_amount,
    date_application,
    deadline,
    id_status,
    utc_date_load
from renamed

{% if is_incremental() %}
where utc_date_load > (select max_load from max_utc_date_load)
{% endif %}
