with 

src_employee as (

    select gender from {{ ref('base_google_drive__employee') }}
),

renamed as (
    select
    
        distinct(gender) as gender,
        {{ dbt_utils.generate_surrogate_key(["gender"]) }} as id_gender

    from src_employee
    
)

select * from renamed