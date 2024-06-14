with 

src_employee as (

    select * from {{ ref('stg_google_drive__employee_gender') }}
),

renamed as (
    select
    
        id_gender,
        gender

    from src_employee
    
)

select * from renamed