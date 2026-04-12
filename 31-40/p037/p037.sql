select
prod.PRODUCT_CD
,prod.CATEGORY_MAJOR_CD
,prod.CATEGORY_MEDIUM_CD
,prod.CATEGORY_SMALL_CD
,prod.UNIT_PRICE
,prod.UNIT_COST
,cat.category_small_cd
from sql100.public.product prod
inner join sql100.public.category cat
on prod.category_small_cd = cat.category_small_cd
limit 10
;