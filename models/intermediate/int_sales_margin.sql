  -- int_sales_margin.sql
WITH join_sq AS (
    SELECT
    *,
    ROUND((quantity * purchase_price), 2) as purchase_cost
    FROM
    {{ref("stg_gz_raw_data__raw_gz_sales")}}
    LEFT JOIN
    {{ref("stg_gz_raw_data__raw_gz_product")}}
    USING (products_id)
)
SELECT
    *,
    ROUND((revenue - purchase_cost), 2) as margin,
    {{margin_percent('revenue', 'purchase_cost')}} as margin_percent
FROM join_sq
 
