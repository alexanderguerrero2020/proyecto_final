with 

source as (

    select * from {{ ref('company_snapshot') }}
    WHERE dbt_valid_to IS NULL
),

renamed as (

    select
        id::varchar(256) as id_company,
        name::varchar(256) as name_company,
        address::varchar(256) as address_company,
        zip_code::varchar(256) as code_zip,
        city_id::varchar(256) as id_city,
        country_code::varchar(256) as code_country,
        kind_of_organization_id::varchar(256) as id_kind_of_organization,
        total_asset::float as total_asset,
        total_liability::float as total_liability,
        registration_body_id::varchar(256) as id_registration_body,
        registration_date::date as date_registration,
        {{ convert_to_utc('_fivetran_synced')}} as utc_date_load,
        {{ convert_to_utc('dbt_valid_from')}} as utc_dbt_valid_from,
        {{ convert_to_utc('dbt_valid_to')}} as utc_dbt_valid_to

    from source

)

select * from renamed
