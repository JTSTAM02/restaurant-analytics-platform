{{ config(materialized='table') }}

SELECT
    r.restaurant_id,
    r.restaurant_name
FROM {{ ref('restaurant_key_map') }} r
