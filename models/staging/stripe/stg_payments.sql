select
    id as payment_id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,

    -- amount is stored in cents, convert it to dollars
    amount / 100 as amount,
    created as created_at,
    status = 'success' as is_payment_sucess

from {{ source('stripe', 'payment') }} 