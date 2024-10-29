-- stg_raw__ship.sql
WITH

    source AS (
        SELECT * 
        FROM {{ source("gz_raw_data", "raw_gz_ship") }}
    ),

    renamed AS (
        SELECT 
            orders_id,
            shipping_fee,
            logCost,
            CAST(ship_cost AS INT) AS ship_cost  -- Cast ship_cost to FLOAT64
        FROM source
        WHERE shipping_fee <> shipping_fee_1  -- Keep only records where shipping_fee differs from shipping_fee_1
    )

SELECT *
FROM renamed;
