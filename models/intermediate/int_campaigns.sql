 -- int_campaigns.sql

 SELECT *
 FROM {{ref('stg_gz_raw_data__raw_gz_adwords')}}
 UNION ALL
 SELECT *
 FROM {{ref('stg_gz_raw_data__raw_gz_facebook')}}
 UNION ALL
 SELECT *
 FROM {{ref('stg_gz_raw_data__raw_gz_criteo')}}
 UNION ALL
 SELECT *
 FROM {{ref('stg_gz_raw_data__raw_gz_bing')}}
 ORDER by date_date