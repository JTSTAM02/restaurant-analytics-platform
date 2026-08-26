{{ config(materialized='table') }}

SELECT DISTINCT
    r.restaurant_id,
    r.restaurant_name,
	c.cuisine_id
FROM {{ ref('restaurant_key_map') }} r
JOIN {{ ref('stg_food_orders') }} o
    ON r.restaurant_name = o.restaurant_name
JOIN {{ ref('cuisine_key_map') }} c 
	ON c.cuisine_type  = o.cuisine_type
