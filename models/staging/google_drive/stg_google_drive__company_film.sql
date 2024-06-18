with 

source as (

    select * from {{ source('google_drive', 'company_film') }}

),

renamed as (

    select
        company_id::varchar(256) as id_company,
        film_movie_code::varchar(256) as code_film_movie,
        {{ convert_to_utc('_fivetran_synced')}} as utc_date_load

    from source

)

select * from renamed
