select
    *
from sql100.public.product
where 
PRODUCT_CD is not null
and
CATEGORY_MAJOR_CD is not null
and
CATEGORY_MEDIUM_CD is not null
and
CATEGORY_SMALL_CD is not null
and
UNIT_PRICE is not null
and
UNIT_COST is not null