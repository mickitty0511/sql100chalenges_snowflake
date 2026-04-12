with
top_20_total_amt_customer as (
    select
        customer_id
        , sum(amount) total_amt
    from sql100.public.receipt
    where customer_id not like 'Z%'
    group by customer_id
    order by total_amt desc
    limit 20
)
, top_20_n_of_sales_customer as (
    select
        customer_id
        , count(distinct sales_ymd) n_of_sales
    from sql100.public.receipt
    where customer_id not like 'Z%'
    group by customer_id
    order by n_of_sales desc
    limit 20
)
select 
    *
from top_20_n_of_sales_customer nsc
full outer join top_20_total_amt_customer nac
on nsc.customer_id = nac.customer_id
;