with 

source as (

    select * from {{ ref('stg_google_drive__department') }}

),

renamed as (

    select
        id_department,
        name_department

    from source

)

select * from renamed
