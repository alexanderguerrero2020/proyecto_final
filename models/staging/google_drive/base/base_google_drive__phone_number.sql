with 

source as (

    select * from {{ source('google_drive', 'phone_number') }}

),

renamed as (

    select
        id::varchar(256) as id_phone_number,
        employee_id::varchar(256) as id_employee,
        phone::varchar(256) as phone,
        description::varchar(256) as description,
        {{ convert_to_utc('_fivetran_synced')}} as utc_date_load

    from source

)

select * from renamed
