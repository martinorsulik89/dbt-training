{% macro markup(sellingprice, costprice) %} -- start macro
({{sellingprice}} - {{costprice}})/{{costprice}}
{% endmacro %} -- end macro

