with 

source as (

    select distinct(description) from {{ ref('base_google_drive__phone_number') }}

),

renamed as (

    select

        {{ dbt_utils.generate_surrogate_key(["description"]) }} as id_description,
        description
        

    from source

)

select * from renamed