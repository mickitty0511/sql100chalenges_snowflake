select 
customer_id
, gender_cd
, iff(gender_cd = '0', 1, 0) male_flg
, iff(gender_cd = '1', 1, 0) female_flg
, iff(gender_cd = '9', 1, 0) unknown_flg
from sql100.public.customer