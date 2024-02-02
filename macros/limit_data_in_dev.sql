{% macro limit_data_in_dev(column_name) %}
{%if target.name == 'development' %}
where {{column_name}} >= dataadd('day', -30, current_timestamp) -- tohle říká pokud mám development a nějaký column_name tak mi vem posledních 30 dní, protože to chci jenom testovat
{% endif %}
{% endmacro %}