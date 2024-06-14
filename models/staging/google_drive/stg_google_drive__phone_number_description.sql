with 

source as (

    select description from {{ ref('base_google_drive__phone_number') }}

),

renamed as (

    select
        distinct(description) as description,
        {{ dbt_utils.generate_surrogate_key(["description"]) }} as id_description

    from source

)

select * from renamed