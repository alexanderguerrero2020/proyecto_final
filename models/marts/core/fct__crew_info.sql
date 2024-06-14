with 

source as (

    select * from {{ ref('stg_google_drive__crew_info') }}

),

renamed as (

    select
    
        id_crew,
        code_movie,
        id_role,
        rate_hourly,
        bonus_daily,
        bonus_scene,
        bonus_completion,
        contractual_incentive

    from source

)

select * from renamed
