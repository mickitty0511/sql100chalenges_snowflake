select 
*
from sql100.public.customer
where 
status_cd rlike '^[A-F].*'
limit 10
;