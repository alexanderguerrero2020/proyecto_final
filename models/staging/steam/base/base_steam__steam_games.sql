with 

source as (

    select * from {{ source('steam', 'steam_games') }}

),

renamed as (

    select
        app_id::NUMBER(38,0) as app_id,
        title::varchar(256) as title,
        release_date::varchar(256) as release_date,
        genres::varchar(256) as genres,
        categories::varchar(256) as categories,
        developer::varchar(256) as developer,
        publisher::varchar(256) as publisher,
        TRIM(original_price, '₹ ' ) as original_price_rupias,
        TRIM(discount_percentage, '-% ' ) as discount_percentage,
        TRIM(discounted_price, '₹ ' ) as discounted_price,
        dlc_available::int as dlc_available,
        age_rating::int as age_rating,
        MAX(LEN(content_descriptor))::varchar(256) as content_descriptor,
        about_description::varchar(256) as about_description,
        win_support::boolean as win_support,
        mac_support::boolean as mac_support,
        linux_support::boolean as linux_support,
        awards::int as awards,
        overall_review::varchar(256) as overall_review,
        overall_review_porcent::int as overall_review_porcent,
        overall_review_count::int as overall_review_count,
        recent_review::varchar(256) as recent_review,
        recent_review_porcent::int as recent_review_porcent,
        recent_review_count::int as recent_review_count

    from source

)

select * from renamed
