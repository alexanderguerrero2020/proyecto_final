with 

source as (

    select * from {{ source('google_drive', 'company') }}

),

renamed as (

    select
        id::varchar(256) as id_company,
        name::varchar(256) as name_company,
        address::varchar(256) as address,
        zip_code::varchar(256) as code_zip,
        city_id::varchar(256) as id_city,
        country_code::varchar(256) as code_country,
        kind_of_organization_id::varchar(256) as id_kind_of_organization,
        total_asset::float as total_asset,
        total_liability::float as total_liability,
        registration_body_id::varchar(256) as id_registration_body,
        registration_date::date as date_registration

    from source

)

select * from renamed
