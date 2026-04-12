with 
"07_cat_product" as (
    select
    * 
    from sql100.public.product
    where category_major_cd = '07'
)
,
"07_cat_sales_by_customer" as (
    select
        r.customer_id
        , sum(r.amount) target_amt
    from sql100.public.receipt r
    inner join "07_cat_product" p
    using (product_cd)
    group by customer_id
)
,
"07_cat_buyer" as (
    select
        distinct r.customer_id
    from sql100.public.receipt r
    inner join "07_cat_product" p
    using (product_cd)
    group by customer_id
)
,
"total_sales_by_07_cat_buyer" as (
    select
        customer_id
        , sum(amount) total_amt
    from sql100.public.receipt r
    inner join "07_cat_buyer" b
    using (customer_id)
    group by customer_id
)
select
    c.customer_id
    , c.target_amt target_amt
    , t.total_amt total_amt
    , target_amt / total_amt p_of_target_amt
from "07_cat_sales_by_customer" c
inner join "total_sales_by_07_cat_buyer" t
using (customer_id)
limit 10