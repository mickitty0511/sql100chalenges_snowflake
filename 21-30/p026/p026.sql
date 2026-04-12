select
customer_id
, min(sales_ymd) min_sales_ymd
, max(sales_ymd) max_sales_ymd
from sql100.public.receipt
group by customer_id
having min_sales_ymd != max_sales_ymd
limit 10
;