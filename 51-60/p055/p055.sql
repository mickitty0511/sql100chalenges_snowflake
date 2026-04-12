
with 
total_amt_by_customer as (
    select
        customer_id
        ,sum(amount) total_amt
    from sql100.public.receipt
    group by customer_id
)
,
quartiles as (
    select
    percentile_cont(0.25) within group (order by total_amt) as q1
    ,percentile_cont(0.50) within group (order by total_amt) as q2
    ,percentile_cont(0.75) within group (order by total_amt) as q3
    from total_amt_by_customer
)
select
    t.customer_id
    , case
        when t.total_amt >= q.q3 then 4
        when t.total_amt >= q.q2 then 3
        when t.total_amt >= q.q1 then 2
        else 1
    end amt_cat 
    , t.total_amt
from total_amt_by_customer t
cross join quartiles q
limit 10