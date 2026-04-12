select
    receipt_sub_no
    , date(to_timestamp(sales_epoch))
    , to_char(to_timestamp(sales_epoch), 'DD')
from sql100.public.receipt
limit 10