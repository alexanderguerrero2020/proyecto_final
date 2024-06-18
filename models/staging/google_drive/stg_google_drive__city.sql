with 

source as (

    select * from {{ source('google_drive', 'city') }}

),

renamed as (

    select
        id::varchar(256) as id_city,
        name::varchar(256) as name_city,
        country_code::varchar(256) as code_country,
        {{ convert_to_utc('_fivetran_synced')}} as utc_date_load

    from source

)

select * from renamed
