with dates as (

    select distinct
        cast(order_purchase_ts as date) as date_day
    from {{ ref('stg_orders') }}

)

select
    date_day,
    extract(year  from date_day) as year,
    extract(month from date_day) as month,
    extract(day   from date_day) as day,
    extract(week  from date_day) as week,
    dayname(date_day) as day_name,
    monthname(date_day) as month_name
from dates
