select
    customer_id
    , application_date
    , to_date(application_date, 'YYYYMMDD')
from sql100.public.customer

