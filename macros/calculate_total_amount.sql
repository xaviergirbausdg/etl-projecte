{% macro calculate_total_amount(price, discount, tax) %}

    TRUNC({{ calculate_net_amount( price, discount ) }} * (1 + {{ tax }} ), 2)

{% endmacro %}