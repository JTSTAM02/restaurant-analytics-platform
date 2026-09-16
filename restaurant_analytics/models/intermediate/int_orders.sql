SELECT * 
FROM (
	SELECT *
		, ROW_NUMBER() OVER (
			PARTITION BY order_id
			ORDER BY order_updated_at DESC,
				order_ingested_at DESC
		) rn
	FROM {{ ref('stg_food_orders') }}
) x
WHERE rn = 1
