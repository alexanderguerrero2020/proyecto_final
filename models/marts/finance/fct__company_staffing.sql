with 

source as (

    select * from {{ ref('int__company_staff') }}

),

renamed as (

    select

        id_company,
        total_salary_company,
        employees_per_company,
        id_working_hours,
        id_job_level  
        
    from source

)

select * from renamed