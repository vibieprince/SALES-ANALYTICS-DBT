with source as (

    select * 
    from {{ source('raw', 'ORDERS') }}

),

cleaned as (

    select
        order_id,
        customer_id,
        order_status,
        cast(order_purchase_timestamp as timestamp) as order_purchase_ts,
        cast(order_delivered_customer_date as timestamp) as delivered_ts,
        cast(order_estimated_delivery_date as timestamp) as estimated_delivery_ts
    from source

)

select * from cleaned
