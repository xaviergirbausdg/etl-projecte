{% macro calculate_net_amount(price, discount) %}

    TRUNC({{ price }} * (1 - {{ discount }}), 2)

{% endmacro %}