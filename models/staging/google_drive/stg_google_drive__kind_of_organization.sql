with 

source as (

    select * from {{ source('google_drive', 'kind_of_organization') }}

),

renamed as (

    select
        id::varchar(256) as id_kind_of_organization,
        name::varchar(256) as name_kind_of_organization

    from source

)

select * from renamed
