{{ config(materialized='view') }}

with source as (

    select *
    from {{ source('tpch', 'customer') }}

),

renamed as (

    select
        C_CUSTKEY    as customer_key,
        C_NAME       as customer_name,
        C_ADDRESS    as address,
        C_NATIONKEY  as nation_key,
        C_PHONE      as phone,
        C_ACCTBAL    as account_balance,
        C_MKTSEGMENT as market_segment,
        C_COMMENT    as comment

    from source

)

select *
from renamed