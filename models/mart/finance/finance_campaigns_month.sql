SELECT
SUM(revenue) AS revenue,
SUM(purchase_cost) AS purchase_cost,
SUM(margin) AS margin,
SUM(shipping_fee) AS shipping_fee,
SUM(logcost) AS logcost,
SUM(ship_cost) AS ship_cost,
SUM(quantity) AS quantity,
SUM(ads_margin) AS ads_margin,
SUM(average_basket) AS average_basket,
SUM(operational_margin) AS operational_margin,
SUM(ads_cost) AS ads_cost,
SUM(ads_impression) as ads_impression,
SUM(ads_clicks) as ads_clicks,
DATE_TRUNC(date_date,MONTH) AS datemonth,
FROM {{ ref('finance_campaigns_day') }}
GROUP by datemonth