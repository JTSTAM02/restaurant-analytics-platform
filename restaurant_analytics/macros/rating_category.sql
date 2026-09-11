{% macro rating_filter(rating) %}

CASE
    WHEN TRY_CAST({{ rating }} AS INTEGER) >= 4 THEN 'Good'
    WHEN TRY_CAST({{ rating }} AS INTEGER) = 3 THEN 'Average'
    WHEN TRY_CAST({{ rating }} AS INTEGER) < 3 THEN 'Poor'
    ELSE 'Not Rated'
END

{% endmacro %}
