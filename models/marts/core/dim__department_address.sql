with 

source as (

    select * from {{ ref('stg_google_drive__department_address') }}

),

renamed as (

    select
        id_department,
        id_company,
        building,
        address_department

    from source

)

select * from renamed