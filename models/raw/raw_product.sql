-- Tohle mi materializuje view, pomocí dbt funkce config
{{
    config(
        materialized='table'
    )
}}

select * from raw.globalmart.product