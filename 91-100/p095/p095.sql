-- NOTE: SnowflakeのCOPY INTOはUTF-8出力のみ対応。
-- CP932への変換はダウンロード後にnkf/iconv等で行う。
-- 例: iconv -f UTF-8 -t CP932 p095_product_category.csv > p095_product_category_cp932.csv

COPY INTO @sql100.public.csv_stage/p095_product_category.csv
FROM (
    select
        p.product_cd
        , p.category_major_cd
        , c.category_major_name
        , p.category_medium_cd
        , c.category_medium_name
        , p.category_small_cd
        , c.category_small_name
        , p.unit_price
        , p.unit_cost
    from sql100.public.product p
    inner join sql100.public.category c
    on p.category_small_cd = c.category_small_cd
)
FILE_FORMAT = (
    TYPE = 'CSV'
    FIELD_OPTIONALLY_ENCLOSED_BY = '"'
    COMPRESSION = 'NONE'
)
HEADER = TRUE
OVERWRITE = TRUE
SINGLE = TRUE;
