with geo_by_customer as (
    select
        c.customer_id
        , g.postal_cd
        , g.latitude
        , g.longitude
    from sql100.public.customer c
    inner join sql100.public.geocode g
    using (postal_cd)
)
select 
    customer_id
    , postal_cd
    , avg(latitude) avg_lat
    , avg(longitude) avg_long
from geo_by_customer
group by customer_id, postal_cd
limit 10