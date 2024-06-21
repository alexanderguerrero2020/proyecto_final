with 

src_int_staff_salary as (

    select 
        id_department,
        total_salary_paid,
        average_salary,
        number_of_employees,
        id_job_level,
        id_working_hours
    from {{ ref('int__staff_salary') }}
),

src_staff_salary_department_address as (

    select 
        B.id_company,
        SUM(A.total_salary_paid)  AS total_salary_company,
        SUM(A.number_of_employees) AS employees_per_company,
        id_job_level,
        id_working_hours
    FROM src_int_staff_salary A
    JOIN {{ ref('stg_google_drive__department_address') }} B
        ON A.id_department = B.id_department
    GROUP BY B.id_company, id_working_hours, id_job_level
    
    
),


renamed as (

    SELECT 
        id_company,
        total_salary_company,
        employees_per_company,
        id_working_hours,
        id_job_level
    FROM src_staff_salary_department_address

)

select * from renamed
