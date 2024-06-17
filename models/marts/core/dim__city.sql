with 

source as (

    select * from {{ ref('stg_google_drive__city') }}

),

renamed as (

    select
        id_city,
        name_city,
        code_country

    from source

)

select * from renamed