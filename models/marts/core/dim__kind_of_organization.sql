with 

source as (

    select * from {{ ref('stg_google_drive__kind_of_organization') }}

),

renamed as (

    select
    
        id_kind_of_organization,
        name_kind_of_organization

    from source

)

select * from renamed
