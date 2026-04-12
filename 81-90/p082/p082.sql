with 
med_prod_tb as (
    select
        round(median(unit_price)) med_unit_price
        , round(median(unit_cost)) med_unit_cost
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
, iff(p.unit_price is not null, p.unit_price, m.med_unit_price) unit_price
, iff(p.unit_cost is not null, p.unit_cost, m.med_unit_cost) unit_cost
from sql100.public.product p
cross join med_prod_tb m
inner join null_catalog n
using (product_cd)