{{
  config(
    materialized='table'
  )
}}

with addresses_source as (

  select *  FROM {{ source('postgres', 'addresses') }}
),

renamed_casted as (

SELECT 
    address_id as address_guid,
    address,
    zipcode,
    state,
    country
from addresses_source
)

select * from renamed_casted