{{ config(materialized = 'table') }}

SELECT 
         r.restaurant_id,
         r.restaurant_name, 
         c.cuisine_type, 
         COUNT(*) AS total_orders, 
         COUNT(CASE WHEN o.rating IS NOT NULL THEN 1 END) AS rated_orders,
         AVG(o.rating_numeric) AS avg_rating, 
         COUNT(CASE WHEN o.rating IS NOT NULL THEN 1 END) 
                 / 
                 NULLIF(COUNT(*), 0) * 100.0 
                 AS rating_percentage 
FROM {{ ref('dim_restaurant') }} r
LEFT JOIN {{ ref('fct_orders') }} o ON o.restaurant_id = 
         r.restaurant_id
LEFT JOIN {{ ref('dim_cuisine') }} c ON o.cuisine_id = c.cuisine_id
GROUP BY r.restaurant_id, r.restaurant_name, c.cuisine_type


