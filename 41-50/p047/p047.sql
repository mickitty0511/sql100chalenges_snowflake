select
    receipt_no
    , receipt_sub_no
    , to_date(to_char(sales_ymd), 'YYYYMMDD') sales_date
from sql100.public.receipt
limit 10

