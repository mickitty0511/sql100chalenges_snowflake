with stddev_amt_table as (
    select 
        store_cd
        , stddev(amount) stddev_amt
    from sql100.public.receipt
    group by store_cd
)
select
    row_number() over (order by stddev_amt desc) rank
    , store_cd
    , stddev_amt
from stddev_amt_table
limit 5
;