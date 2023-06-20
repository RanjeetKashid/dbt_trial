with order_details as (
select
*
from {{ref("stg_orders")}}),
payment_details as (
select
*
from {{ref("stg_payments")}}),
final as (
    select
    a.order_id,
    b.payment_id,
    a.customer_id,
    a.status as order_status,
    b.status as payment_status,
    b.payment_method,
    b.amount as payment_amount,
    a.order_date,
    b.created_at as payment_date,
    CURRENT_TIMESTAMP as CreatedAt
    from order_details as a
    left join payment_details as b
    on a.order_id = b.order_id
)

select * from final
