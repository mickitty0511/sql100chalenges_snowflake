select
    percentile_cont(0.25) within group (order by amount) as percentile_25,
    percentile_cont(0.50) within group (order by amount) as percentile_50,
    percentile_cont(0.75) within group (order by amount) as percentile_75,
    percentile_cont(1.00) within group (order by amount) as percentile_100
from sql100.public.receipt
;