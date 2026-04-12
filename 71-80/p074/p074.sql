select
    r.customer_id
    , to_date(to_char(r.sales_ymd), 'YYYYMMDD') d_sales_ymd
    , date_trunc('week', d_sales_ymd) last_monday_date
    , datediff('day', last_monday_date, d_sales_ymd) diff
from sql100.public.receipt r
inner join sql100.public.customer c
using (customer_id)
limit 10