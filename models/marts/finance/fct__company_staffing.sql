with 

source as (

    select * from {{ ref('int__company_staff') }}

),

renamed as (

    select
    
        id_company,
        total_staff,
        total_salary,
        average_salary    

    from source

)

select * from renamed