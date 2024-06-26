with 

source as (

    select * from {{ ref('stg_google_drive__company') }}

),

renamed as (

    select
        id_company,
        name_company,
        address_company,
        code_zip,
        id_city,
        code_country,
        id_kind_of_organization,
        total_asset,
        total_liability,
        id_registration_body,
        date_registration

    from source

)

select * from renamed
