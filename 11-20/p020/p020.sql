select 
row_number() over (order by amount desc) as rank
, customer_id
, amount,
from sql100.public.receipt
order by amount desc
limit 10
;