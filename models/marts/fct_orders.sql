{{ config(
    materialized='incremental',
    unique_key='order_sk'
) }}

with source as (

    select *
    from {{ ref('int_orders_enriched') }}

),

final as (

    select
        -- ✅ Surrogate key
        {{ dbt_utils.generate_surrogate_key(['order_key']) }} as order_sk,

        -- ✅ Business keys
        order_key,
        customer_key,

        -- ✅ Measures
        total_price,

        -- ✅ Dimensions
        order_status,
        order_priority,
        ship_priority,

        -- ✅ Dates
        order_date,
        order_year,
        order_quarter,

        -- ✅ Customer + geography
        nation_key,
        nation_name,
        region_name

    from source

)

select *
from final

{% if is_incremental() %}
-- ✅ Incremental logic: only load new orders
where order_date > (select max(order_date) from {{ this }})
{% endif %}