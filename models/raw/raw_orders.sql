-- Tohle mi materializuje view, pomocí dbt funkce config
{{
    config(
        materialized='table'
    )
}}

select *
from {{ source('globalmart', 'orders') }}