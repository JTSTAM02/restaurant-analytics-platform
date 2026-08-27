{{ config(materialized='table') }}

SELECT
    o.order_id,
    o.customer_id,
    r.restaurant_id,
    c.cuisine_id,
    o.order_cost,
    o.day_of_week,
    o.rating,
    o.prep_time,
    o.delivery_time
FROM {{ ref('stg_food_orders') }} o
JOIN {{ ref('dim_restaurant') }} r
    ON r.restaurant_name = o.restaurant_name
JOIN {{ ref('dim_cuisine') }} c
    ON c.cuisine_type = o.cuisine_type
