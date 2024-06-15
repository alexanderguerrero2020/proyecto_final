with 

source as (

    select * from {{ ref('int__staff_salary') }}

),

renamed as (

    select
        
        id_department,
        total_salary_paid,
        average_salary,
        number_of_employees,
        job_level,
        working_hours

    from source

)

select * from renamed