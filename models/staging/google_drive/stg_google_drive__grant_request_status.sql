with 

source as (

    select distinct(status) from {{ ref('base_google_drive__grant_request') }}

),

renamed as (

    select
        
        {{ dbt_utils.generate_surrogate_key(["status"]) }} as id_status,
        status
        
    from source

)

select * from renamed