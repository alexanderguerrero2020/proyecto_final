with 

source as (

    select * from {{ source('google_drive', 'company_shareholder') }}

),

renamed as (

    select
        company_id::varchar(256) as id_company,
        shareholder_id::varchar(256) as id_shareholder

    from source

)

select * from renamed
