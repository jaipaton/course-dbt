{{
  config(
    materialized='table'
  )
}}

with user_source as (
  select * from {{source('postgres', 'users')}}

),
renamed_cast as (

SELECT 
    user_id as user_guid,
    first_name,
    last_name,
    email,
    phone_number,
    created_at as created_at_utc,
    updated_at as updated_at_utc,
    address_id
FROM user_source
)

select * from renamed_cast