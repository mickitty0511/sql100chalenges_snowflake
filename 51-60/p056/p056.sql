select
    customer_id
    , birth_day
    , gender_cd
    , age
    , iff(age >=60, 60, floor(age/10) * 10) generation
    from sql100.public.customer
limit 10