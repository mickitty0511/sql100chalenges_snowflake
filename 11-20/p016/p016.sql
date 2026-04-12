select 
*
from sql100.public.store
where 
tel_no rlike '[0-9]{3}-[0-9]{3}-[0-9]{4}'
limit 10
;