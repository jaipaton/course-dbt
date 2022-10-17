{{
  config(
    materialized='table'
  )
}}

SELECT 
    ORDER_GUID,
    USER_GUID,
    PROMO_DESC,
    ADDRESS_ID,
    CREATED_AT_UTC,
    ORDER_COST,
    SHIPPING_COST,
    ORDER_TOTAL_COST,
    TRACKING_ID,
    SHIPPING_SERVICE,
    ESTIMATED_DELIVERY_AT_UTC,
    DELIVERED_AT_UTC,
    ORDER_STATUS


FROM {{ ref('stg_greenery_orders') }} 

