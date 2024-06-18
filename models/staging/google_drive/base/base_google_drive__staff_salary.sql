with 

source as (

    select * from {{ ref('staff_salary_snapshot') }}
    WHERE dbt_valid_to IS NULL
),

renamed as (

    select
        sn::varchar(256) as sn,
        staff_id::varchar(256) as id_staff,
        working_hours::varchar(256) as working_hours,
        job_level::varchar(256) as job_level,
        salary::float as salary,
        {{ convert_to_utc('_fivetran_synced')}} as utc_date_load,
        {{ convert_to_utc('dbt_valid_from')}} as utc_dbt_valid_from,
        {{ convert_to_utc('dbt_valid_to')}} as utc_dbt_valid_to

    from source

)

select * from renamed
