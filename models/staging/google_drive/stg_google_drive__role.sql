with 

source as (

    select * from {{ ref('base_google_drive__role') }}

),

renamed as (

    select
        id_role as id_role,
        {{ dbt_utils.generate_surrogate_key(["name_role"]) }} as id_name_role,
        name_role

    from source

)

select * from renamed