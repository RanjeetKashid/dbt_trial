with fact_cohort as (
select
customer_id,
min(order_date) as first_order_date,
max(order_date) as last_order_date,
count (distinct order_id) as total_orders,
sum(amount) as total_revenue,
round((max(order_date) - min(order_date))/count (distinct order_id)) as average_days_between_orders,
CURRENT_TIMESTAMP as CreatedAt
from {{ref("fct_orders")}}
group by customer_id
order by customer_id asc)

select * from fact_cohort