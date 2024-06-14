with 

source as (

    select * from {{ ref('stg_google_drive__phone_number') }}

),

renamed as (

    select
    
        id_phone_number,
        id_employee,
        phone,
        id_description

    from source

)

select * from renamed