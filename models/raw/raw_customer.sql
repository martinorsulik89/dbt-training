-- Tohle mi materializuje view, pomocí dbt funkce config
{{
    config(
        materialized='table'
    )
}}

select * from
    {{ source('globalmart', 'customer') }}

-- výše management zdroje, odkazuje se do yml filu src_globalmart, pokud se změní reference ve snowflake, musím změnit yml file