{{ config(materialized='view') }}

SELECT
	CAST(order_id AS INTEGER) order_id,
	CAST(customer_id AS INTEGER) customer_id,
	restaurant_name,
	cuisine_type,
	CAST(cost_of_the_order AS DECIMAL(9, 2)) AS order_cost, 
	day_of_the_week AS day_of_week, 
	rating, 
	CAST(food_preparation_time AS INTEGER) AS prep_time, 
	CAST(delivery_time AS INTEGER) AS delivery_time, 
	CAST('2026-01-01' AS DATE) + (CAST(order_id AS INT) % 180) AS order_created_at,
	CAST('2026-07-02' AS DATE) + (CAST(order_id AS INT) % 180) AS order_updated_at,


FROM {{ ref('food_order') }}

UNION ALL

SELECT
    order_id,
    customer_id,
    restaurant_name,
    cuisine_type,
    cost_of_the_order AS order_cost,
    day_of_the_week AS day_of_week,
    rating,
    food_preparation_time AS prep_time,
    delivery_time,
    CAST('2026-07-01' AS DATE) AS order_created_at,
    CAST('2026-07-03' AS DATE) + (CAST(order_id AS INT) % 180) AS order_updated_at, 

FROM {{ ref('new_food_orders') }}
