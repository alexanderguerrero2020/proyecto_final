with 

source as (

    select * from {{ source('google_drive', 'country') }}

),

renamed as (

    select
        code::varchar(256) as code_country,
        name::varchar(256) as name_country,
        isd_code::varchar(256) as code_isd,
        {{ convert_to_utc('_fivetran_synced')}} as utc_date_load

    from source

)

select * from renamed
