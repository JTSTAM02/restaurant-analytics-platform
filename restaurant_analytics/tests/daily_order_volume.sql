WITH daily_counts AS (

    SELECT
        CAST(order_created_at AS DATE) AS order_date,
        COUNT(*) AS order_count
    FROM {{ ref('fct_orders') }}
    GROUP BY 1

),

today AS (

    SELECT order_count
    FROM daily_counts
    WHERE order_date = CURRENT_DATE

),

previous_7_days AS (

    SELECT AVG(order_count) AS avg_order_count
    FROM daily_counts
    WHERE order_date >= CURRENT_DATE - INTERVAL '7 days'
      AND order_date < CURRENT_DATE

)

SELECT
    today.order_count,
    previous_7_days.avg_order_count
FROM today
CROSS JOIN previous_7_days
WHERE today.order_count < previous_7_days.avg_order_count * 0.50
