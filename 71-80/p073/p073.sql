select
    r.customer_id
    , r.sales_ymd
    , c.application_date
    , datediff(
        'second',
        to_timestamp(c.application_date, 'YYYYMMDD'),
        to_timestamp(to_char(r.sales_ymd), 'YYYYMMDD')
      ) as elapsed_epoch_seconds
from sql100.public.receipt r
inner join sql100.public.customer c
using (customer_id)
limit 10