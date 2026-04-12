with total_amt_by_ymd as (
    select
        sales_ymd
        , sum(amount) total_amt
    from sql100.public.receipt
    group by sales_ymd
)
select
    sales_ymd
    , total_amt
    , lag(total_amt, 1) over (order by sales_ymd asc) as lag_1
    , lag(total_amt, 2) over (order by sales_ymd asc) as lag_2
    , lag(total_amt, 3) over (order by sales_ymd asc) as lag_3
from total_amt_by_ymd
order by sales_ymd asc
limit 10

