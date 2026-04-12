select
    rec.SALES_YMD
    ,rec.SALES_EPOCH
    ,rec.STORE_CD
    ,rec.RECEIPT_NO
    ,rec.RECEIPT_SUB_NO
    ,rec.CUSTOMER_ID
    ,rec.PRODUCT_CD
    ,rec.QUANTITY
    ,rec.AMOUNT
    ,store.store_name
from
    sql100.public.receipt rec
inner join 
    sql100.public.store store
on
    rec.store_cd = store.store_cd
limit 10
;