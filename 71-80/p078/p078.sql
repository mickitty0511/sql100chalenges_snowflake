with 
sales_by_customer as (
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
        percentile_cont(0.25) within group (order by total_amt) p1
        , percentile_cont(0.75) within group (order by total_amt) p3
        , p3 - p1 iqr
    from sales_by_customer
)
select 
    c.customer_id
    , c.total_amt
from sales_by_customer c
cross join stats s
where
    c.total_amt < s.p1-(1.5 * s.iqr)
    or
    c.total_amt > s.p3+(1.5 * s.iqr)
limit 10