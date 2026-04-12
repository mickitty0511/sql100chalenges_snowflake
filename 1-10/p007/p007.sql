select 
sales_ymd
, customer_id
, product_cd
, amount
from sql100.public.receipt
where
customer_id = 'CS018205000001'
and
amount between 1000 and 2000
;