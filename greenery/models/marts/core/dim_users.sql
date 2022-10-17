{{
  config(
    materialized='table'
  )
}}

SELECT 
  USER_GUID,
  FIRST_NAME,
  LAST_NAME,
  EMAIL,
  PHONE_NUMBER,
  CREATED_AT_UTC,
  UPDATED_AT_UTC,
  ADDRESS_ID


FROM {{ ref('stg_greenery_users') }} 

