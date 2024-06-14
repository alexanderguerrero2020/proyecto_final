with 

source as (

    select * from {{ ref('stg_google_drive__grant_request_status') }}

),

renamed as (

    select
        
        id_status,
        status
        
    from source

)

select * from renamed