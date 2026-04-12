select
    customer_id
    , sum(amount) total_amt
    , ln(total_amt) ln_total_amt
from sql100.public.receipt
where customer_id not like 'Z%'
group by customer_id
limit 10