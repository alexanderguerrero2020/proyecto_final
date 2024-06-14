with 

source as (

    select * from {{ ref('stg_google_drive__crew') }}

),

renamed as (

    select
    
        id_crew,
        id_role

    from source

)

select * from renamed
