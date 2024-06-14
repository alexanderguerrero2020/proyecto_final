with 

source as (

    select * from {{ ref('stg_google_drive__shareholder') }}

),

renamed as (

    select
        id_shareholder,
        first_name,
        last_name,
        code_country,
        place_of_birth,
        mothers_maiden_name,
        fathers_first_name,
        personal_telephone,
        national_insurance_number,
        passport_number

    from source

)

select * from renamed
