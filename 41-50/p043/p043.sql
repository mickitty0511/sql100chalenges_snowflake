with receipt_tb as (
    select
        customer_id
        , sum(amount) total_amt
    from sql100.public.receipt
    group by customer_id
)
,
customer_tb as (
    select
        customer_id
        , gender_cd
        , floor(age / 10) * 10 as generation
    from sql100.public.customer
)
,
union_tb as (
    select
        c.generation
        , c.gender_cd
        , r.total_amt
    from receipt_tb r
    inner join customer_tb c
    on r.customer_id = c.customer_id
)
select *
from (
    select generation, gender_cd, total_amt
    from union_tb
)
pivot (
    sum(total_amt) for gender_cd in ('0', '1', '9')
) as p (generation, male_amt, female_amt, unknown_amt)
order by generation

