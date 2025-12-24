with customers as (

    select
        customer_unique_id,
        customer_id,
        customer_city,
        customer_state,
        customer_zip_code_prefix
    from {{ ref('stg_customers') }}

),

ranked as (

    select
        *,
        row_number() over (
            partition by customer_unique_id
            order by customer_id
        ) as rn
    from customers

)

select
    customer_unique_id as customer_key,
    customer_id,
    customer_city,
    customer_state,
    customer_zip_code_prefix
from ranked
where rn = 1


-- Customer attributes can change over time, so instead of grouping, we used window functions to deterministically select a single representative record per business key.