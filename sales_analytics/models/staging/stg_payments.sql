with source as (

    select * 
    from {{ source('raw', 'ORDERPAYMENTS') }}

),

cleaned as (

    select
        order_id,
        payment_type,
        payment_installments,
        payment_value
    from source

)

select * from cleaned
