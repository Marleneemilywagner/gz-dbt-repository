{{ config(materialized = "view") }}

SELECT 
    f.date_date, 
    f.average_basket,
    f.operational_margin, 
    i.ads_cost,
    i.impression, 
    i.click, 
    f.quantity,
    f.revenue, 
    f.purchase_cost, 
    f.margin,
    f.shipping_fee,
    f.logcost,
    f.ship_cost,
    ROUND(f.operational_margin - i.ads_cost, 2) AS ads_margin
FROM {{ ref('finance_days') }} f
LEFT JOIN {{ ref('int_campaigns_day') }} i
USING (date_date)