with 

source as (

    select * from {{ ref('stg_google_drive__role') }}

),

renamed as (

    select

        id_role,
        id_name_role,
        name_role

    from source

)

select * from renamed