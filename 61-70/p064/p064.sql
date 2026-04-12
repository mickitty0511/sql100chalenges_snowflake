select 
    avg("p_of_profit") * 100 avg_p_of_profit
from (
    select
        product_cd
        , (unit_price - unit_cost) / unit_price "p_of_profit"
    from sql100.public.product
)