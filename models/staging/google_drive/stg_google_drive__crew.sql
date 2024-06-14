with 

source as (

    select * from {{ source('google_drive', 'crew') }}

),

renamed as (

    select
        sn::varchar(256)as sn,
        crew_id::varchar(256) as id_crew,
        role_id::varchar(256) as id_role

    from source

)

select * from renamed
