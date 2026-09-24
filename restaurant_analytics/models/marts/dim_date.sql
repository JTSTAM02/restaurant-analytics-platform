{{ config(materialized='table') }}

WITH date_spine AS (

    SELECT
        CAST(date_day AS DATE) AS date_day
    FROM generate_series(
        DATE '2026-05-01',
        DATE '2026-06-01',
        INTERVAL '1 day'
    ) AS t(date_day)

)

SELECT
    date_day,
    EXTRACT(YEAR FROM date_day) AS year,
    EXTRACT(MONTH FROM date_day) AS month,
    EXTRACT(DAY FROM date_day) AS day,
    EXTRACT(DOW FROM date_day) AS day_of_week,
    STRFTIME(date_day, '%A') AS day_name
FROM date_spine
