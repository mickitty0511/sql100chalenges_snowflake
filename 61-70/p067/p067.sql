with new_price_tb as (
    select
        product_cd
        , unit_price
        , unit_cost
        , ceil(unit_cost / 0.7) new_price
    from sql100.public.product
)
select
    *
    , (new_price - unit_cost) / new_price p_of_new_price
from new_price_tb
limit 10