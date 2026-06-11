{{ config(materialized='table') }}

with source as (

    select *
    from {{ ref('stg_tpch__customers') }}

),

final as (

    select
        -- ✅ Primary key
        customer_key,

        customer_name,
        nation_key,
        account_balance,
        market_segment,

        -- ✅ Business logic: customer tier
        case
            when account_balance >= 10000 then 'Platinum'
            when account_balance >= 5000 then 'Gold'
            when account_balance >= 1000 then 'Silver'
            else 'Bronze'
        end as customer_tier

    from source

)

select *
from final