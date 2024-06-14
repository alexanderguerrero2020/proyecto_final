with 

source as (

    select * from {{ source('google_drive', 'staff') }}

),

renamed as (

    select
        sn::varchar(256) as sn,
        staff_id::varchar(256) as id_staff,
        department_id::varchar(256) as id_department

    from source

)

select * from renamed
