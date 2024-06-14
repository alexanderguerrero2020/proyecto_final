with 

source as (

    select * from {{ ref('stg_google_drive__film') }}

),

renamed as (

    select
        code_movie,
        title_film,
        release_year,
        first_released

    from source

)

select * from renamed
