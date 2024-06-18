with 

source as (

    select * from {{ source('google_drive', 'shareholder') }}

),

renamed as (

    select
        id::varchar(256) as id_shareholder,
        first_name::varchar(256) as first_name,
        last_name::varchar(256) as last_name,
        country_code::varchar(256) as code_country,
        place_of_birth::varchar(256) as place_of_birth,
        mothers_maiden_name::varchar(256) as mothers_maiden_name,
        fathers_first_name::varchar(256) as fathers_first_name,
        personal_telephone::varchar(256) as personal_telephone,
        national_insurance_number::varchar(256) as national_insurance_number,
        passport_number::varchar(256) as passport_number,
        {{ convert_to_utc('_fivetran_synced')}} as utc_date_load

    from source

)

select * from renamed
