-- stg_raw__product.sql
WITH

    source AS (
        SELECT * 
        FROM {{ source("gz_raw_data", "raw_gz_product") }}
    ),

    renamed AS (
        SELECT 
            products_id, 
            CAST(purchase_price AS FLOAT64) AS purchase_price  -- Casting to FLOAT64
        FROM source
    )

SELECT *
FROM renamed;
