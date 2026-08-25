{{ config(materialized='table') }}

SELECT DISTINCT
    r.restaurant_id,
    r.restaurant_name
FROM {{ ref('restaurant_key_map') }} r
JOIN {{ ref('stg_food_orders') }} o
    ON r.restaurant_name = o.restaurant_name
