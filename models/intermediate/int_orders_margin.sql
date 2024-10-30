WITH sales AS (
    SELECT
        orders_id, 
        purchase_cost, 
        margin
    FROM {{ ref('int_sales_margin') }}  -- Reference to the sales staging model
)

SELECT
    date_date,
    revenue,
    quantity,
    orders_id,
    margin
FROM {{ ref('stg_gz_raw_data__raw_gz_sales' )}} 