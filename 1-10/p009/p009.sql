select 
store_cd
, prefecture_cd
, floor_area
from sql100.public.store
where
prefecture_cd != '13'
and
floor_area <= 900
;