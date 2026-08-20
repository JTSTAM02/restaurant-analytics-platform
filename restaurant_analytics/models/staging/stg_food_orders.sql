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
	CAST(delivery_time AS INTEGER) AS delivery_time 
FROM {{ ref('food_order') }}
