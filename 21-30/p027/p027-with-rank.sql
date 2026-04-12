with avg_table as (
    select
        store_cd
        , avg(amount) avg_amt
    from sql100.public.receipt
    group by store_cd
)
select
row_number() over (order by avg_amt desc) "rank"
, store_cd
, avg_amt
from avg_table
order by avg_amt desc
limit 5
;