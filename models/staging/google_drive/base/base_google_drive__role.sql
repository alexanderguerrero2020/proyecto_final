with 

source as (

    select * from {{ source('google_drive', 'role') }}

),

renamed as (

    select
        id::varchar(256) as id_role,
        name::varchar(256) as name_role

    from source

)

select * from renamed
