with 

source as (

    select * from {{ ref('stg_google_drive__staff') }}

),

renamed as (

    select

        id_staff,
        id_department

    from source

)

select * from renamed
