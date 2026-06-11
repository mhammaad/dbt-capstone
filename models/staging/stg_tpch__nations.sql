{{ config(materialized='view') }}

with source as (

    select *
    from {{ ref('nations') }}

),

renamed as (

    select
        nation_id     as nation_key,
        nation_name   as nation_name,
        region_key    as region_key,
        region_name   as region_name,
        comment       as comment

    from source

)

select *
from renamed