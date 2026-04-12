select 
sales_ymd
, customer_id
, product_cd
, amount
from sql100.public.receipt
where
customer_id = 'CS018205000001'
and
product_cd != 'P071401019'
;