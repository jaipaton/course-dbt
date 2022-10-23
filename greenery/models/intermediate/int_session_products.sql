{{
    config(
        MATERIALIZED = 'table'
    )
}}

with initial_select as (
    SELECT
    events.event_session_guid as event_session_guid,
    events.order_guid,
    products.product_guid as product_guid,
    products.name as product_name-- ,

    FROM {{ ref('stg_greenery_events') }} as events
    LEFT JOIN {{ref('stg_greenery_products')}} as products on events.product_guid = products.product_guid

    GROUP BY 1,2,3,4
)

SELECT * FROM initial_select
