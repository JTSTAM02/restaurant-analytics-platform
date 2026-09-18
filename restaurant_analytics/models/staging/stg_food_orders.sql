{{ config(materialized='view') }}

SELECT
    CAST(order_id AS INTEGER) AS order_id,
    CAST(customer_id AS INTEGER) AS customer_id,
    restaurant_name,
    cuisine_type,
    CAST(cost_of_the_order AS DECIMAL(9, 2)) AS order_cost,
    day_of_the_week AS day_of_week,
    rating,
    TRY_CAST(rating AS INTEGER) AS rating_numeric,
    CAST(food_preparation_time AS INTEGER) AS prep_time,
    CAST(delivery_time AS INTEGER) AS delivery_time,
    CAST(order_created_at AS TIMESTAMP) AS order_created_at,
    CAST(order_updated_at AS TIMESTAMP) AS order_updated_at,
    CAST(order_ingested_at AS TIMESTAMP) AS order_ingested_at

FROM {{ ref('food_order') }}
