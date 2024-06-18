with 

source as (

    select * from {{ source('google_drive', 'staff') }}

),

renamed as (

    select
        sn::varchar(256) as sn,
        staff_id::varchar(256) as id_staff,
        department_id::varchar(256) as id_department,
        {{ convert_to_utc('_fivetran_synced')}} as utc_date_load

    from source

)

select * from renamed
