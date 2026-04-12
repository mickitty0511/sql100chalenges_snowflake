select
store_cd
, avg(amount) avg_amt
from sql100.public.receipt
group by store_cd
having avg_amt >= 330
order by avg_amt desc
;