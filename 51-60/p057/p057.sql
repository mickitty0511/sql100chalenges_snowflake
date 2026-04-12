select
    customer_id
    , birth_day
    , gender_cd
    , age
    , gender_cd || iff(age >=60, 60, floor(age/10) * 10) gender_generation
    from sql100.public.customer
limit 10