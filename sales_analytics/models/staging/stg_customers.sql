with source as (

    select * 
    from {{ source('raw', 'CUSTOMERS') }}

),

renamed as (

    select
        customer_id,
        customer_unique_id,
        lower(customer_city)        as customer_city,
        upper(customer_state)       as customer_state,
        customer_zip_code_prefix
    from source

)

select * from renamed
