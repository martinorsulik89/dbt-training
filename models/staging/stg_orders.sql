select
-- from raw orders
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit,
o.ordercostprice,
o.ordersellingprice,
-- from raw customer
c.customername,
c.customerid,
c.segment,
c.country,
--from raw product
p.category,
p.productname,
p.productid,
p.subcategory,
{{ markup('ordersellingprice', 'ordercostprice') }} as markup, -- tohle je markup první způsob
{{ markup_v2() }} as markup_v2 -- tohle je makro ze souboru markup_v2.sql druhý způsob
from {{ ref('raw_orders') }} as o -- dbt jinja funkce reference
left join {{ ref('raw_customer') }} as c on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p on o.productid = p.productid

{{limit_data_in_dev('orderdate')}} -- nastavení limitu v tomto scriptu, to je column_name z macra