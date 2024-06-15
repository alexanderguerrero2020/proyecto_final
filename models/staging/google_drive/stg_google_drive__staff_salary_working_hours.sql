with 

source as (

    select distinct(working_hours) from {{ ref('base_google_drive__staff_salary') }}

),

renamed as (

    select

        {{ dbt_utils.generate_surrogate_key(["working_hours"]) }} as id_working_hours,
        working_hours

    from source

)

select * from renamed
