select
    product_cd
    , unit_price
    , unit_cost
    , unit_price - unit_cost
from sql100.public.product
limit 10