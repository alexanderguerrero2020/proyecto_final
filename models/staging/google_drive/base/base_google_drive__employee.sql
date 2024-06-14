with 

source as (

    select * from {{ source('google_drive', 'employee') }}

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
        email_address::varchar(256) as email_address

    from source

)

select * from renamed
