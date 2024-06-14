with 

source as (

    select status from {{ ref('base_google_drive__grant_request') }}

),

renamed as (

    select
        distinct(status) as status,
        {{ dbt_utils.generate_surrogate_key(["status"]) }} as id_status

    from source

)

select * from renamed