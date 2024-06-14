with 

source as (

    select * from {{ ref('base_google_drive__phone_number') }}

),

renamed as (

    select
        id_phone_number,
        id_employee,
        phone,
        {{ dbt_utils.generate_surrogate_key(["description"]) }} as id_description

    from source

)

select * from renamed