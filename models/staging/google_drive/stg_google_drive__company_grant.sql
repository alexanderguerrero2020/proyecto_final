with 

source as (

    select * from {{ source('google_drive', 'company_grant') }}

),

renamed as (

    select
        company_id::varchar(256) as id_company,
        grant_id::varchar(256) as id_grant,
        {{ convert_to_utc('_fivetran_synced')}} as utc_date_load

    from source

)

select * from renamed
