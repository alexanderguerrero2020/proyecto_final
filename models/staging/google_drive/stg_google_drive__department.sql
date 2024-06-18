with 

source as (

    select * from {{ source('google_drive', 'department') }}

),

renamed as (

    select
        id::varchar(256) as id_department,
        name::varchar(256) as name_department,
        {{ convert_to_utc('_fivetran_synced')}} as utc_date_load

    from source

)

select * from renamed
