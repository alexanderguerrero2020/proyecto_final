with 

source as (

    select * from {{ ref('base_google_drive__staff_salary') }}

),

renamed as (

    select
        sn,
        id_staff,
        {{ dbt_utils.generate_surrogate_key(["working_hours"]) }} as id_working_hours,
        {{ dbt_utils.generate_surrogate_key(["job_level"]) }} as id_job_level,
        salary

    from source

)

select * from renamed
