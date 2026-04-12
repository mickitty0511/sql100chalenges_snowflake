select
    store_cd
    , variance(amount) var_amt
from sql100.public.receipt
group by store_cd
order by var_amt desc
limit 5
;