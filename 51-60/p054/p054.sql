select
address
,case 
    when contains(address, '埼玉県') then 11 
    when contains(address, '千葉県') then 12 
    when contains(address, '東京都') then 13 
    when contains(address, '神奈川県') then 14 
    end address_flg
from sql100.public.customer
limit 10
;