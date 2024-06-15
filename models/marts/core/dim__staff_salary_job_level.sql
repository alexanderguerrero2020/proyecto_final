with 

source as (

    select * from {{ ref('stg_google_drive__staff_salary_job_level') }}

),

renamed as (

    select

        id_job_level,
        job_level

    from source

)

select * from renamed
