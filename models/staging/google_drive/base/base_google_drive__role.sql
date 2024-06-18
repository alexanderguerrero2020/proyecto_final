with 

source as (

    select * from {{ source('google_drive', 'role') }}

),

renamed as (

    select
        id::varchar(256) as id_role,
        name::varchar(256) as name_role,
        {{ convert_to_utc('_fivetran_synced')}} as utc_date_load

    from source

)

select * from renamed
