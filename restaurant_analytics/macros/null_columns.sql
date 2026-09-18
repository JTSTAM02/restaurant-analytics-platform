{% macro null_count(columns) %}

{% for column in columns %}

    SUM(CASE
        WHEN {{ column }} IS NULL THEN 1
        ELSE 0
    END) AS {{ column }}_nulls{% if not loop.last %},{% endif %}

{% endfor %}

{% endmacro %}
