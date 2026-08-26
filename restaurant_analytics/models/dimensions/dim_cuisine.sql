{{ config(materialized='table') }}

SELECT DISTINCT
    c.cuisine_id,
    c.cuisine_type
FROM {{ ref('cuisine_key_map') }} c
JOIN {{ ref('stg_food_orders') }} o
    ON c.cuisine_type = o.cuisine_type
