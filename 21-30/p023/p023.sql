select
store_cd 
, sum(amount) total_amount
, sum(quantity) total_qnt
from sql100.public.receipt
group by store_cd