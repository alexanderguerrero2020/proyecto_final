with 

source as (

    select * from {{ ref('snapshot_employee')}}
    WHERE dbt_valid_to IS NULL
),

renamed as (

    select
        id::varchar(256) as id_employee,
        first_name::varchar(256) as first_name,
        middle_name::varchar(256) as middle_name,
        last_name::varchar(256) as last_name,
        gender::varchar(256) as gender,
        date_of_birth::date as date_of_birth,
        company_id::varchar(256) as id_company,
        employee_role::varchar(256) as name_role,
        date_started::date as date_started,
        email_address::varchar(256) as email_address,
        {{ convert_to_utc('_fivetran_synced')}} as utc_date_load,
        {{ convert_to_utc('dbt_valid_from')}} as utc_dbt_valid_from,
        {{ convert_to_utc('dbt_valid_to')}} as utc_dbt_valid_to

    from source

)

select * from renamed
