select
customer_id
, min(sales_ymd)
from sql100.public.receipt
group by customer_id
limit 10
;