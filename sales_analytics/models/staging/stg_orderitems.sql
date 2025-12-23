with source as (

    select * 
    from {{ source('raw', 'ORDERITEMS') }}

),

cleaned as (

    select
        order_id,
        product_id,
        seller_id,
        order_item_id,
        price,
        freight_value
    from source

)

select * from cleaned
