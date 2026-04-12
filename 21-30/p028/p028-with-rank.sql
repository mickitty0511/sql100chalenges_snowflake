with med_amt_table as (
    select
        store_cd
        , median(amount) med_amt
    from sql100.public.receipt
    group by store_cd
)
select
    row_number() over (order by med_amt desc) "rank"
    , store_cd
    , med_amt
from med_amt_table
order by med_amt desc
limit 5
;