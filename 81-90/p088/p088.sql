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

drop table if exists sql100.public.federated_customer;
create table sql100.public.federated_customer as(
    select
        last_value(u.customer_id ignore nulls) over (
            partition by customer_name, postal_cd order by (u.customer_id is null)
        ) fed_customer_id
        , c.customer_name
        , c.gender_cd
        , c.gender
        , c.birth_day
        , c.age
        , c.postal_cd
        , c.address
        , c.application_store_cd
        , c.application_date
        , c.status_cd
    from sql100.public.customer c
    left join sql100.public.unique_customer u
    using (customer_id)
)
;

select 
    unique_cnt
    , total_cnt
from (select count(distinct fed_customer_id) unique_cnt from sql100.public.federated_customer) fed
cross join (select count(distinct customer_id) total_cnt from sql100.public.customer)
;