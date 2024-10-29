WITH sales AS (
    SELECT
        orders_id,
        margin
    FROM {{ ref('int_sales_margin') }} 
),

ship AS (
    SELECT
        orders_id,
        shipping_fee,
        logcost, 
        ship_cost
    FROM {{ ref('stg_gz_raw_data__raw_gz_ship') }} 
)

SELECT
    s.orders_id,
    (s.margin + sh.shipping_fee - sh.logcost - sh.ship_cost) AS operational_margin
FROM sales s
JOIN ship sh ON s.orders_id = sh.orders_id