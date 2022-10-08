{{
  config(
    materialized='table'
  )
}}

with promos_source as (
  select *  FROM {{ source('postgres', 'promos') }}

),

renamed_cast as (
SELECT 
        promo_id as promo_guid,
        discount,
        status
from promos_source

)

select * from renamed_cast