with 

src_orders as (

    select * from {{ ref('stg_google_drive__employee') }}
),

renamed as (
    select
        id_employee,
        first_name,
        middle_name,
        last_name,
        id_gender,
        date_of_birth,
        id_company,
        id_name_role,
        date_started,
        email_address

    from src_orders
    
)

select * from renamed