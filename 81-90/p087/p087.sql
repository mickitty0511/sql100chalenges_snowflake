drop table if exists sql100.public.unique_customer;
create table sql100.public.unique_customer as (
    with 
    sales_amt as (
        select
            c.customer_id
            , c.customer_name
            , c.postal_cd
            , coalesce(sum(r.amount), 0) as total_amt
        from sql100.public.customer c
        left join sql100.public.receipt r
        using (customer_id)
        group by c.customer_id, c.customer_name, c.postal_cd
    )
    ,
    sales_rank as (
        select
            *
            , row_number() over (
                partition by customer_name, postal_cd order by total_amt desc, customer_id asc
            ) ranking
        from sales_amt
    )
    select c.*
    from sql100.public.customer c
    inner join sales_rank s
    on 
        c.customer_id = s.customer_id
        and s.ranking = 1
);

select 
total_cnt
, unique_cnt
, total_cnt - unique_cnt duplicates_cnt
from (select count(1) total_cnt from sql100.public.customer) customer
cross join (select count(1) unique_cnt from sql100.public.unique_customer) unique_customer
;