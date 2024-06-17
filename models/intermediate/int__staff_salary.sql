with 

src_staff_salary_department as (

    select 
        A.id_staff,
        B.id_department,
        A.id_working_hours,
        A.id_job_level,
        A.salary
    from {{ ref('stg_google_drive__staff_salary') }} A
    join {{ ref('stg_google_drive__staff') }} B
    ON A.id_staff = B.id_staff

),

src_department_performance as (

    select 
        id_department,
        SUM(salary) as total_salary_paid,
        AVG(salary) as average_salary,
        Count(distinct(id_staff)) as number_of_employees,
        id_job_level,
        id_working_hours
    from src_staff_salary_department
    group by id_department, id_job_level, id_working_hours
),

renamed as (

    select
        
        id_department,
        total_salary_paid,
        average_salary,
        number_of_employees,
        id_job_level,
        id_working_hours

    from src_department_performance

)

select * from renamed
