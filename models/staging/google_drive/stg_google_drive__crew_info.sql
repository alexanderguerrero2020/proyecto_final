with 

source as (

    select * from {{ source('google_drive', 'crew_info') }}

),

renamed as (

    select
        crew_id::varchar(256) as id_crew,
        movie_code::varchar(256) as code_movie,
        role_id::varchar(256) as id_role,
        IFF(hourly_rate='NULL', '0', hourly_rate)::float as rate_hourly,
        IFF(daily_bonus='NULL', '0', daily_bonus)::float as bonus_daily,
        IFF(scene_bonus='NULL', '0', scene_bonus)::float as bonus_scene,
        IFF(completion_bonus='NULL', '0', completion_bonus)::float as bonus_completion,
        IFF(contractual_incentive='NULL', '0', contractual_incentive)::float as contractual_incentive,
        {{ convert_to_utc('_fivetran_synced')}} as utc_date_load

    from source

)

select * from renamed
