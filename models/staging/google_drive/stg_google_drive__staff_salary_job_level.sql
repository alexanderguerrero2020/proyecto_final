with 

source as (

    select distinct(job_level) from {{ ref('base_google_drive__staff_salary') }}

),

renamed as (

    select

        {{ dbt_utils.generate_surrogate_key(["job_level"]) }} as id_job_level,
        job_level

    from source

)

select * from renamed
