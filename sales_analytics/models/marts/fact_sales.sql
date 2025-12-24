with order_items as (

    select
        order_id,
        product_id,
        seller_id,
        price,
        freight_value
    from {{ ref('stg_orderitems') }}

),

orders as (

    select
        order_id,
        customer_id,
        cast(order_purchase_ts as date) as order_date
    from {{ ref('stg_orders') }}

),

customers as (

    select
        customer_key,
        customer_id
    from {{ ref('dim_customers') }}

)

select
    oi.order_id,
    c.customer_key,
    oi.product_id,
    oi.seller_id,
    o.order_date,

    sum(oi.price)           as revenue,
    sum(oi.freight_value)   as freight_cost,
    count(*)                as items_sold

from order_items oi
join orders o
  on oi.order_id = o.order_id

join customers c
  on o.customer_id = c.customer_id

group by
    oi.order_id,
    c.customer_key,
    oi.product_id,
    oi.seller_id,
    o.order_date
