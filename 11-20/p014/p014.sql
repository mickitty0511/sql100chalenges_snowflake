select 
*
from sql100.public.customer
where 
status_cd rlike '.*[1-9]$'
limit 10
;