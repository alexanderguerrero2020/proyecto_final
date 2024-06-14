with 

source as (

    select * from {{ source('google_drive', 'city') }}

),

renamed as (

    select
        id::varchar(256) as id_city,
        name::varchar(256) as name_city,
        country_code::varchar(256) as country_code

    from source

)

select * from renamed
