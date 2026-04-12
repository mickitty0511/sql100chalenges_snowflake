with 
store_tb as (
    select 
    1 key
    from sql100.public.store
)
,
product_tb as (
    select
    1 key
    from sql100.public.product
)
select
count(*)
from store_tb s
inner join product_tb p
on s.key = p.key