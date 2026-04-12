select
    customer_id
    , sum(amount) total_amt
    , log(10, total_amt) log10
from sql100.public.receipt
where customer_id not like 'Z%'
group by customer_id
limit 10