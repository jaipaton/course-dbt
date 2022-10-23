{{
  config(
    materialized='table'
  )
}}

SELECT 
*

FROM {{ ref('int_session_products') }} 


