select
    count(*) total_cnt
    , total_cnt - count(category_major_cd) cat_major_null_cnt
    , total_cnt - count(category_medium_cd) cat_med_null_cnt
    , total_cnt - count(category_small_cd) cat_small_null_cmt
    , total_cnt - count(product_cd) product_null_cnt
    , total_cnt - count(unit_price) unit_price_null_cnt
    , total_cnt - count(unit_cost) unit_cost_null_cnt
from sql100.public.product