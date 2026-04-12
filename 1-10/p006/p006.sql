select 
sales_ymd
, customer_id
, product_cd
, quantity
, amount
from sql100.public.receipt
where
customer_id = 'CS018205000001'
and (
    amount >= 1000 
    or
    quantity >= 5
)
;