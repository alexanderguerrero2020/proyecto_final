with 

source as (

    select * from {{ ref('stg_google_drive__country') }}

),

renamed as (

    select
        code_country,
        name_country,
        code_isd

    from source

)

select * from renamed