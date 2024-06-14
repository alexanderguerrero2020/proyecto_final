with 

source as (

    select * from {{ source('google_drive', 'company_grant') }}

),

renamed as (

    select
        company_id::varchar(256) as id_company,
        grant_id::varchar(256) as id_grant

    from source

)

select * from renamed
