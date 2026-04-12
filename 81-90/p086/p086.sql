with 
geo_by_customer as (
    select
        c.customer_id
        , g.postal_cd
        , c.application_store_cd
        , c.address
        , g.latitude
        , g.longitude
    from sql100.public.customer c
    inner join sql100.public.geocode g
    using (postal_cd)
)
,
customer_geo as (
    select 
        customer_id
        , postal_cd
        , address
        , application_store_cd
        , avg(latitude) avg_lat
        , avg(longitude) avg_long
    from geo_by_customer
    group by customer_id, postal_cd, address, application_store_cd
    order by postal_cd
)
select 
    c.customer_id
    , c.address
    , s.address
    , 6371 * acos(sin(avg_lat)*sin(s.latitude)+cos(avg_lat)*cos(s.latitude)*cos(s.longitude - avg_long)) distance
from customer_geo c
inner join sql100.public.store s
on c.application_store_cd = s.store_cd
limit 10