with 
cus_table as (
    select
        customer_id
    from sql100.public.customer
    where 
        gender_cd = 1
        and
        customer_id not like 'Z%'
),
total_amt_by_customer_table as (
    select
        customer_id
        , sum(amount) total_amt
    from sql100.public.receipt
    group by customer_id
)
select
    cus.customer_id id
    , coalesce(rec.total_amt,0) total_amt
from cus_table cus
left outer join total_amt_by_customer_table rec
on rec.customer_id = cus.customer_id
limit 10
;