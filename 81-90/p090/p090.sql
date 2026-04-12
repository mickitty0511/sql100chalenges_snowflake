with monthly_sales as (
    select
        to_char(to_date(sales_ymd::varchar, 'YYYYMMDD'), 'YYYY-MM') as sales_month
        , sum(amount) as amount
    from sql100.public.receipt
    group by sales_month
)
-- セット1: 学習 2017-01~2017-12, テスト 2018-01~2018-06
select *, 1 as set_no
    , case
        when sales_month between '2017-01' and '2017-12' then 'train'
        when sales_month between '2018-01' and '2018-06' then 'test'
      end as data_split
from monthly_sales
where sales_month between '2017-01' and '2018-06'

union all

-- セット2: 学習 2017-07~2018-06, テスト 2018-07~2018-12
select *, 2 as set_no
    , case
        when sales_month between '2017-07' and '2018-06' then 'train'
        when sales_month between '2018-07' and '2018-12' then 'test'
      end as data_split
from monthly_sales
where sales_month between '2017-07' and '2018-12'

union all

-- セット3: 学習 2018-01~2018-12, テスト 2019-01~2019-06
select *, 3 as set_no
    , case
        when sales_month between '2018-01' and '2018-12' then 'train'
        when sales_month between '2019-01' and '2019-06' then 'test'
      end as data_split
from monthly_sales
where sales_month between '2018-01' and '2019-06'

order by set_no, sales_month;
