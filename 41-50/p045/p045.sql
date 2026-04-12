select
    customer_id
    , birth_day
    , to_char(birth_day, 'YYYYMMDD')
from sql100.public.customer

