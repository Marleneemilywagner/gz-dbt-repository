{% macro create_margin_percent(revenue, purchase_cost) %}
    ROUND(SAFEDIVIDE((revenue - purchase_cost), revenue), 2) AS create_margin_percent
{% endmacro %}