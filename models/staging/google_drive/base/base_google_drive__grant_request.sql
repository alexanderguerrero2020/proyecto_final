{{
    config(
        materialized='incremental',
        unique_key='id',
        on_schema_change='fail'
    )
}}

with 

source as (

    select * from {{ source('google_drive', 'grant_request') }}

),

renamed as (

    select
        id::varchar(256) as id_grant_request,
        title::varchar(256) as title_grant_request,
        funding_organization::varchar(256) as funding_organization,
        maximum_monetary_value::float as maximum_monetary_value,
        desired_amount::float as desired_amount,
        application_date::date as date_application,
        deadline::date as deadline,
        status::varchar(256) as status,
        {{ convert_to_utc('_fivetran_synced')}} as utc_date_load

    from source

)

select * from renamed
