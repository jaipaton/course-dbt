
{% macro pivot_values(column_name, table_ref) %}
    set grouped_vals = dbt_utils.get_column_values(
        table = ref(table_ref)
        , column = column_name
        
    )

    select
    {%- for vals in column_name %}
    , sum(case when vals = '{{ vals }}' then 1 else 0 end) as {{vals}}s
    {%- endfor %}
from {{ ref(table_ref) }}
group by 1,2


{% endmacro %}

