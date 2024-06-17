with 

source as (

    select * from {{ ref('stg_google_drive__staff_salary') }}

),

renamed as (

    select
        sn,
        id_staff,
        id_working_hours,
        id_job_level,
        salary

    from source

)

select * from renamed
