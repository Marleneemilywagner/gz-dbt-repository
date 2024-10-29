WITH sales AS (
    SELECT
        *
    FROM {{ ref('int_sales_margin') }}  -- Reference to the sales staging model
)

SELECT
    *,
    '2021-09-30' AS fixed_date  -- Adding a new column with the fixed date
FROm sales