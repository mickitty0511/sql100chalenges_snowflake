with var_amt_table as (
    select
        store_cd
        , variance(amount) var_amt
    from sql100.public.receipt
    group by store_cd
)
select
    row_number() over (order by var_amt desc) "rank"
    , store_cd
    , var_amt
from var_amt_table
limit 5
;