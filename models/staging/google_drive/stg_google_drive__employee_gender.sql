with 

src_employee as (

    select distinct(gender) from {{ ref('base_google_drive__employee') }}
),

renamed as (
    select
    
        {{ dbt_utils.generate_surrogate_key(["gender"]) }} as id_gender,
        gender

    from src_employee
    
)

select * from renamed