-- models/purchase_margin_calculation.sql

WITH sales AS (
    SELECT
        orders_id,
        products_id,
        quantity,
        revenue, 
        date_date
    FROM {{ ref('stg_gz_raw_data__raw_gz_sales') }}  -- Reference to the sales staging model
),

products AS (
    SELECT
        products_id,
        purchase_price
    FROM {{ ref('stg_gz_raw_data__raw_gz_product') }}  -- Reference to the product staging model
)

SELECT
    s.orders_id,
    s.products_id,
    s.quantity,
    s.revenue,
    s.date_date,
    p.purchase_price,
    (p.purchase_price * s.quantity) AS purchase_cost,  -- Calculate purchase cost
    (s.revenue - (p.purchase_price * s.quantity)) AS margin  -- Calculate margin
FROM sales s
JOIN products p ON s.products_id = p.products_id 