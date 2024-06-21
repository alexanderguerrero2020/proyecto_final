{{
    config(
        materialized='incremental',
        unique_key=['id_company', 'id_shareholder'],
        on_schema_change='fail'
    )
}}

with 

source as (

    select * from {{ source('google_drive', 'company_shareholder') }}
),

renamed as (

    select
        {{ dbt_utils.generate_surrogate_key(["company_id", "shareholder_id"]) }} as id_company_shareholder,
        company_id::varchar(256) as id_company,
        shareholder_id::varchar(256) as id_shareholder,
        {{ convert_to_utc('_fivetran_synced')}} as utc_date_load

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