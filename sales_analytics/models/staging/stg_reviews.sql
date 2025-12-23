with source as (

    select * 
    from {{ source('raw', 'REVIEWS') }}

),

cleaned as (

    select
        review_id,
        order_id,
        review_score,
        cast(review_creation_date as date) as review_date
    from source

)

select * from cleaned
