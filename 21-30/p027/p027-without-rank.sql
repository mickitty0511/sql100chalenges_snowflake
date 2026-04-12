select
    store_cd
    , avg(amount) avg_amt
from sql100.public.receipt
group by store_cd
order by avg_amt desc
limit 5
;