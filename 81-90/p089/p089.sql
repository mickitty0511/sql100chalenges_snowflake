with customers_with_sales as (
    select distinct c.*
    from sql100.public.customer c
    inner join sql100.public.receipt r
    on c.customer_id = r.customer_id
)
, randomized as (
    select
        *
        , uniform(0::float, 1::float, random()) as rand_val
    from customers_with_sales
)
select
    case when rand_val <= 0.8 then 'train' else 'test' end as data_split
    , count(*) as cnt
from randomized
group by data_split