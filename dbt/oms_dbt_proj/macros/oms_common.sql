{% macro to_celcius(fahrenheit_column, decimal_places=1) %}
    ROUND(({{ fahrenheit_column }} - 32) * 5.0 / 9.0, {{ decimal_places }})
{% endmacro %}