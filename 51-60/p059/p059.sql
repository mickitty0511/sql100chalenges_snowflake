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
        avg(total_amt) avg_total
        , stddev(total_amt) stddev_total
    from total_amt_by_customer
)
select
    t.customer_id
    , t.total_amt
    , (t.total_amt - avg_total) / stddev_total
from total_amt_by_customer t
cross join stats s
limit 10