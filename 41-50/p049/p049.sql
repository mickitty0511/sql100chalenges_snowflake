select
    receipt_no
    , receipt_sub_no
    , to_char(to_timestamp(sales_epoch), 'yyyy') yeer_sales_date
from sql100.public.receipt
limit 10

