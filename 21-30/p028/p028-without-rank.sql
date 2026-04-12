select
    store_cd
    , median(amount) med_amt
from sql100.public.receipt
group by store_cd
order by med_amt desc
limit 5
;