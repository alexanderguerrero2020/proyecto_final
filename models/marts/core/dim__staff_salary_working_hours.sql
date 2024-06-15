with 

source as (

    select * from {{ ref('stg_google_drive__staff_salary_working_hours') }}

),

renamed as (

    select

        id_working_hours,
        working_hours

    from source

)

select * from renamed
