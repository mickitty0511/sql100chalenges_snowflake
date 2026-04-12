select
    customer_id
    , ifnull(sum(amount),0) total_amt
    , ifnull(sum(iff(
        left(sales_ymd, 4)='2019'
        , amount
        , 0)
    ),0) sales_2019
    , iff(total_amt = 0, 0, sales_2019 / total_amt) p_2019_of_total
from sql100.public.customer
left join sql100.public.receipt
using (customer_id)
group by customer_id
having p_2019_of_total > 0
limit 10