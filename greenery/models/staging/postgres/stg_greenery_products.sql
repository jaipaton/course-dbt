{{
  config(
    materialized='table'
  )
}}

with products_source as (
  select * FROM {{ source('postgres', 'products') }}
),

renamed_cast as (

SELECT 
    product_id as product_guid,
    name,
    price,
    inventory
from products_source
)

select * from renamed_cast