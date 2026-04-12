with stratified as (
    select
        *
        , row_number() over (partition by gender_cd order by random()) as rn
        , count(*) over (partition by gender_cd) as cnt
    from sql100.public.customer
)
select
    gender_cd
    , count(*) as customer_cnt
from stratified
where rn <= cnt * 0.1
group by gender_cd
order by gender_cd