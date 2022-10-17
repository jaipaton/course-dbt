{{
  config(
    materialized='table'
  )
}}

SELECT 

EVENT_GUID,
USER_GUID,
PAGE_URL,
CREATED_AT_UTC,
EVENT_TYPE,
ORDER_GUID,
PRODUCT_GUID

FROM {{ ref('stg_greenery_events') }} 

WHERE 

EVENT_TYPE = 'page_view'