{{
    config(
        materialized='incremental',
        unique_key=['id_company', 'id_shareholder'],
        on_schema_change='fail'
    )
}}

with 

source as (

    select * from {{ ref('stg_google_drive__company_shareholder') }}

),

renamed as (

    select
        id_company_shareholder,
        id_company,
        id_shareholder,
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