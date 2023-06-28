select 
    order_date,
    count(distinct order_id),
    count(distinct customer_id),
    sum(payment_amount) as amount
from {{ref("fact_order_payments")}}
where order_status in ('completed','placed') 
and payment_status = 'fail'
group by 1
