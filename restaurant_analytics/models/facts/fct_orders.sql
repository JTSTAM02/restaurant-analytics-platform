{{ config
	(materialized='incremental',
	unique_key='order_id',		
        incremental_strategy='merge',
        on_schema_change='append_new_columns'
) }}

SELECT
    o.order_id,
    o.customer_id,
    r.restaurant_id,
    c.cuisine_id,
    o.order_cost,
    o.day_of_week,
    o.rating,
    {{ rating_filter('rating') }} AS rating_category,
    o.prep_time,
    o.delivery_time, 
    o.order_created_at,
    o.order_updated_at
FROM {{ ref('int_orders') }} o
JOIN {{ ref('dim_restaurant') }} r
    ON r.restaurant_name = o.restaurant_name
JOIN {{ ref('dim_cuisine') }} c
    ON c.cuisine_type = o.cuisine_type

{% if is_incremental() %}

WHERE o.order_updated_at >= (
	SELECT MAX(order_updated_at)
	FROM {{ this }}
)

{% endif %}
