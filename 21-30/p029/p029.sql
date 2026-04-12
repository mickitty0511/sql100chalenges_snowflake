select 
    store_cd
    , MODE(product_cd) mode_product_cd
from sql100.public.receipt
group by store_cd
limit 10
;