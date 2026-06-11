select *
from {{ ref('fct_orders') }}
where customer_key is null