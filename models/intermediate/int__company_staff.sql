with 

src_staff_salary_department as (

    select 
        A.id_staff,
        B.id_department,
        A.salary
    from {{ ref('stg_google_drive__staff_salary') }} A
    join {{ ref('stg_google_drive__staff') }} B
    ON A.id_staff = B.id_staff

),

src_staff_salary_department_address as (

    select 
        A.id_department,
        A.id_staff,
        B.id_company,
        salary
    from src_staff_salary_department A
    join {{ ref('stg_google_drive__department_address') }} B
    ON A.id_department = B.id_department
),

src_staff_salary_company as (

    select 
        A.id_company,
        COUNT(id_staff) as total_staff,
        SUM(salary) as total_salary,
        AVG(salary) as average_salary
    from src_staff_salary_department_address A
    join {{ ref('stg_google_drive__company') }} B
    ON A.id_company = B.id_company
    group by A.id_company
),

renamed as (

    select
        
        id_company,
        total_staff,
        total_salary,
        average_salary

    from src_staff_salary_company

)

select * from renamed
