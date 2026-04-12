select
    receipt_no
    , receipt_sub_no
    , to_date(to_timestamp(sales_epoch)) sales_date
from sql100.public.receipt
limit 10

