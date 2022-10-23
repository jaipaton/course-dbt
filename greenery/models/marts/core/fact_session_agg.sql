{{
  config(
    materialized='table'
  )
}}



WITH init_sel as (
    SELECT *
    FROM {{ ref('int_session_events_agg') }} 
)

select * from init_sel