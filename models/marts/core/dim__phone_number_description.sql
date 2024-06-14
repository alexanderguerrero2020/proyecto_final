with 

source as (

    select * from {{ ref('stg_google_drive__phone_number_description') }}

),

renamed as (

    select

        id_description,
        description
        

    from source

)

select * from renamed