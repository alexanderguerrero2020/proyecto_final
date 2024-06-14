with 

source as (

    select * from {{ ref('stg_google_drive__registration_body') }}

),

renamed as (

    select

        id_registration_body,
        name_registration_body,
        code_country,
        price

    from source

)

select * from renamed
