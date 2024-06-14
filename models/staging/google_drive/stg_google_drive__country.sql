with 

source as (

    select * from {{ source('google_drive', 'country') }}

),

renamed as (

    select
        code::varchar(256) as code_country,
        name::varchar(256) as name_country,
        isd_code::varchar(256) as code_isd

    from source

)

select * from renamed
