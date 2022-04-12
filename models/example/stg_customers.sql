with customers as (

    select
        id as customer_id,
        first_name,
        last_name

    from `holded-analytics-sb-jesus-01c3`.dbt_tutorial_general.customers
),

orders as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from `holded-analytics-sb-jesus-01c3`.dbt_tutorial_general.orders
),

customer_orders as (

    select
        customer_id,

        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders

    from orders
    group by customer_id
)

select * from customer_orders
