drop table if exists sql100.public.customer_std;
create table sql100.public.customer_std as (
    select
        CUSTOMER_ID
        ,CUSTOMER_NAME
        ,GENDER_CD
        ,BIRTH_DAY
        ,AGE
        ,POSTAL_CD
        ,ADDRESS
        ,APPLICATION_STORE_CD
        ,APPLICATION_DATE
        ,STATUS_CD
    from sql100.public.customer
);

drop table if exists sql100.public.gender;
create table sql100.public.gender as (
    select
        distinct GENDER_CD
        , GENDER
    from sql100.public.customer
);
select * from sql100.public.customer_std;
select * from sql100.public.gender;