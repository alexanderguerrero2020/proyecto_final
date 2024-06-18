with 

source as (

    select * from {{ source('google_drive', 'registration_body') }}

),

renamed as (

    select
        id::varchar(256) as id_registration_body,
        name::varchar(256) as name_registration_body,
        country_code::varchar(256) as code_country,
        price::float as price,
        {{ convert_to_utc('_fivetran_synced')}} as utc_date_load

    from source

)

select * from renamed
