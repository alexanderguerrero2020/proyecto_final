with 

source as (

    select * from {{ ref('stg_google_drive__company_film') }}

),

renamed as (

    select
    
        id_company,
        code_film_movie

    from source

)

select * from renamed
