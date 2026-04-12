with 
sales_by_customer as (
    select
        customer_id
        , sum(amount) total_amt
        , log(10, sum(amount)) log_amt
    from sql100.public.receipt
    group by customer_id
)
,
stats as (
    select
        avg(log_amt) avg_log
        , stddev(log_amt) stddev_log
    from sales_by_customer
)
select 
    c.customer_id
    , c.total_amt
from sales_by_customer c
cross join stats s
where abs(c.log_amt - s.avg_log) / s.stddev_log > 3
limit 10