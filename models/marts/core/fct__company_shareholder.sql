with 

source as (

    select * from {{ ref('stg_google_drive__company_shareholder') }}

),

renamed as (

    select
        
        id_company,
        id_shareholder

    from source

)

select * from renamed
