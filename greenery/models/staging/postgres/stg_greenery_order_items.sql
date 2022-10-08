{{
  config(
    materialized='table'
  )
}}

with order_items_source as (
  select * FROM {{ source('postgres', 'order_items') }}
),

renamed_cast as (

SELECT 
*
    -- order_id,
    -- product_id,
    -- quantity
    -- # missing primary key value? What named?

)

select * from renamed_cast