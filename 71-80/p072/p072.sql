select
    r.customer_id
    , to_date(c.application_date, 'YYYYMMDD') d_application_date
    , to_date(to_char(r.sales_ymd), 'YYYYMMDD') d_sales_ymd
    , datediff('year', d_application_date, d_sales_ymd) diff
from sql100.public.receipt r
inner join sql100.public.customer c
using (customer_id)
limit 10