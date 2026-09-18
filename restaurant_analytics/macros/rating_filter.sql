{% macro rating_filter(rating_column) %}

CASE
    WHEN {{ rating_column }} >= 4 THEN 'Positive'
    WHEN {{ rating_column }} = 3 THEN 'Neutral'
    WHEN {{ rating_column }} <= 2 THEN 'Negative'
    ELSE 'Not Rated'
END

{% endmacro %}
