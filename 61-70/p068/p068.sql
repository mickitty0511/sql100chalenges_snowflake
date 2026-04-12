select
    product_cd
    , truncate(unit_price * 1.1) taxed_price
from sql100.public.product
limit 10