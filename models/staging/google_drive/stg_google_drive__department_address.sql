with 

source as (

    select * from {{ source('google_drive', 'department_address') }}

),

renamed as (

    select
        department_id::varchar(256) as id_department,
        company_id::varchar(256) as id_company,
        building::varchar(256) as building,
        address::varchar(256) as address_department,
        {{ convert_to_utc('_fivetran_synced')}} as utc_date_load

    from source

)

select * from renamed
