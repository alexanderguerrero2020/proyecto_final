with 

src_orders as (

    select * from {{ ref('base_google_drive__employee') }}
    
),

renamed as (
    select
        id_employee,
        first_name,
        middle_name,
        last_name,
        {{ dbt_utils.generate_surrogate_key(["gender"]) }} as id_gender,
        date_of_birth,
        id_company,
        {{ dbt_utils.generate_surrogate_key(["name_role"]) }} as id_name_role,
        date_started,
        email_address,
        utc_date_load

    from src_orders
    
)

select * from renamed