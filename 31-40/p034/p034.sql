with total_amt_by_customer as (
    select
        customer_id
        , sum(amount) total_amt
    from sql100.public.receipt
    where 
        customer_id not like 'Z%'
    group by
        customer_id
)
select 
    avg(total_amt)
from total_amt_by_customer
;