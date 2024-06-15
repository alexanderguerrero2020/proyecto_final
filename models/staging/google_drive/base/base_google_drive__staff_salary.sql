with 

source as (

    select * from {{ source('google_drive', 'staff_salary') }}

),

renamed as (

    select
        sn::varchar(256) as sn,
        staff_id::varchar(256) as id_staff,
        working_hours::varchar(256) as working_hours,
        job_level::varchar(256) as job_level,
        salary::float as salary

    from source

)

select * from renamed
