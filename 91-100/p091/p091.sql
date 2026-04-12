with has_sales as (
    select distinct customer_id
    from sql100.public.receipt
)
, customers_with_flag as (
    select
        c.*
        , case when s.customer_id is not null then 1 else 0 end as has_sales_flag
    from sql100.public.customer c
    left join has_sales s
    on c.customer_id = s.customer_id
)
, positive as (
    select * from customers_with_flag where has_sales_flag = 1
)
, positive_count as (
    select count(*) as cnt from positive
)
, negative_ranked as (
    select
        n.*
        , row_number() over (order by random()) as rn
    from customers_with_flag n
    where n.has_sales_flag = 0
)
, negative_sampled as (
    select *
    from negative_ranked
    where rn <= (select cnt from positive_count)
)
select * exclude (rn) from negative_sampled
union all
select * from positive;