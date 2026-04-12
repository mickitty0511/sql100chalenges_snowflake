with 
avg_prod_tb as (
    select
        round(avg(unit_price)) avg_unit_price
        , round(avg(unit_cost)) avg_unit_cost
    from sql100.public.product
)
,
null_catalog as (
    select
        product_cd
    from sql100.public.product
    where 
        unit_price is null
        or
        unit_cost is null
)
select
p.product_cd
, p.category_major_cd
, p.category_medium_cd
, p.category_small_cd
, iff(p.unit_price is not null, p.unit_price, a.avg_unit_price) unit_price
, iff(p.unit_cost is not null, p.unit_cost, a.avg_unit_cost) unit_cost
from sql100.public.product p
cross join avg_prod_tb a
inner join null_catalog n
using (product_cd)