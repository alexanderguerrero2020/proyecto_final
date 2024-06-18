with 

source as (

    select * from {{ ref('base_google_drive__grant_request') }}

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
        {{ dbt_utils.generate_surrogate_key(["status"]) }} as id_status,
        utc_date_load

    from source

)

select * from renamed