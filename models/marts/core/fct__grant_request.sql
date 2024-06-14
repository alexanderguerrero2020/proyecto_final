with 

source as (

    select * from {{ ref('stg_google_drive__grant_request') }}

),

renamed as (

    select
    
        id_grant_request,
        title_grant_request,
        funding_organization,
        maximum_monetary_value,
        desired_amount,
        date_application,
        deadline,
        id_status

    from source

)

select * from renamed