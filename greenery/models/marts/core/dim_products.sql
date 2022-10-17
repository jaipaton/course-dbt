{{
  config(
    materialized='table'
  )
}}

SELECT 
    product_guid,
    name,
    price,
    inventory
FROM {{ ref('stg_greenery_products') }} prod
