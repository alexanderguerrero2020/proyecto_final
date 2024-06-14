with 

source as (

    select * from {{ source('google_drive', 'phone_number') }}

),

renamed as (

    select
        id::varchar(256) as id_phone_number,
        employee_id::varchar(256) as id_employee,
        phone::varchar(256) as phone,
        description::varchar(256) as description

    from source

)

select * from renamed
