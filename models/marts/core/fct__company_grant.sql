with 

source as (

    select * from {{ ref('stg_google_drive__company_grant') }}

),

renamed as (

    select

        id_company,
        id_grant

    from source

)

select * from renamed
