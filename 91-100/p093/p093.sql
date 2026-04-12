drop table if exists sql100.public.unnormalized_product;
create table sql100.public.unnormalized_product as (
    select 
        p.*
        , c.category_major_name
        , c.category_medium_name
        , c.category_small_name
    from sql100.public.product p
    inner join sql100.public.category c
    using (category_small_cd)
);

select * from sql100.public.unnormalized_product;