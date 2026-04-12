with
total_amt_by_customer as (
    select
        customer_id
        , sum(amount) total_amt
    from sql100.public.receipt
    where customer_id not like 'Z%'
    group by customer_id
)
,
stats as (
    select
        min(total_amt) min_total
        , max(total_amt) max_total
    from total_amt_by_customer
)
select
    t.customer_id
    , t.total_amt
    , (t.total_amt - s.min_total) / (s.max_total - s.min_total)
from total_amt_by_customer t
cross join stats s
limit 10