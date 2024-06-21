{{
    config(
        materialized='incremental',
        unique_key='id_grant_request',
        on_schema_change='fail'
    )
}}

with 

source as (

    select * from {{ ref('stg_google_drive__grant_request') }}

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
        id_status,
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

    select * from renamed

{% if is_incremental() %}
    WHERE utc_date_load > (SELECT max_load FROM max_utc_date_load)
{% endif %}