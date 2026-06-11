{{ config(materialized='view') }}

with orders as (

    select *
    from {{ ref('stg_tpch__orders') }}

),

customers as (

    select *
    from {{ ref('stg_tpch__customers') }}

),

nations as (

    select *
    from {{ ref('stg_tpch__nations') }}

),

joined as (

    select
        -- ✅ Order fields
        o.order_key,
        o.order_date,
        o.order_status,
        o.total_price,
        o.order_priority,
        o.ship_priority,

        -- ✅ Customer fields
        o.customer_key,
        c.customer_name,
        c.market_segment,
        c.account_balance,

        -- ✅ Nation fields (from seed → staging)
        c.nation_key,
        n.nation_name,
        n.region_key,
        n.region_name,

        -- ✅ Derived fields
        extract(year from o.order_date)    as order_year,
        extract(quarter from o.order_date) as order_quarter

    from orders o

    left join customers c
        on o.customer_key = c.customer_key

    left join nations n
        on c.nation_key = n.nation_key

)

select *
from joined