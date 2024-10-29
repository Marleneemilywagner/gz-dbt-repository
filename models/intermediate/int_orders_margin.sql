WITH sales AS (
    SELECT
        *
    FROM {{ ref('int_sales_margin') }}  -- Reference to the sales staging model
)

SELECT *
FROM sales
WHERE date_date = '2021-09-30'