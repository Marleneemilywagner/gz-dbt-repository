{% macro margin_percent(revenue, purchase_cost, round_int=2) %}
    ROUND(SAFE_DIVIDE(revenue-purchase_cost, revenue), 2)
{% endmacro %}