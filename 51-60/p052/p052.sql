select
    customer_id
    ,sum(amount) total_amt
    ,iff(total_amt <= 2000, 0, 1) division
from sql100.public.receipt
where
customer_id not like 'Z%'
group by customer_id
limit 10