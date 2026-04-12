with customer_tb as (
    select
        customer_id
        , postal_cd
        , iff(
            postal_cd regexp '^(1[0-9]{2}|20[0-9]).*'
            , 1
            , 0
        ) postal_div
    from sql100.public.customer
)
select 
    c.postal_div postal_div
    , count(distinct c.customer_id) cnt
from customer_tb c
inner join (
    select distinct customer_id 
    from sql100.public.receipt
) r
using (customer_id)
group by postal_div