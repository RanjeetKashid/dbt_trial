with raw_repeat_rate as (
select 
    b.customer_id,
    b.first_order_date,
    a.order_date,
    first_order_date <> order_date as is_repeat_order
from {{ref("fact_order_payments")}} as a
join {{ref("fact_cohort_analysis")}} as b
on a.customer_id = b.customer_id
where payment_status = 'success' 
and order_status = 'completed')
select
    customer_id,
    date_trunc(month,first_order_date) as first_order_month,
    date_trunc(month,order_date) as repeat_order_month,
    is_repeat_order
from raw_repeat_rate
-- where is_repeat_order -- filter for only 
group by 1,2,3,4