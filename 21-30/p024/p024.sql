select
customer_id
, max(sales_ymd)
from sql100.public.receipt
group by customer_id
limit 10
;