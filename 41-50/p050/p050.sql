select
    receipt_no
    , receipt_sub_no
    , to_char(to_timestamp(sales_epoch), 'MM') month_sales_month
from sql100.public.receipt
limit 10

