with 

source as (

    select * from {{ source('google_drive', 'film') }}

),

renamed as (

    select
        movie_code::varchar(256) as code_movie,
        title::varchar(256) as title_film,
        {{ dbt_date.date_part("year", "first_released") }} as release_year,
        first_released::date as first_released,
        {{ convert_to_utc('_fivetran_synced')}} as utc_date_load

    from source

)

select * from renamed
