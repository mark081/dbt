{% macro season(ds)%}
        CASE
            WHEN MONTH(TO_TIMESTAMP({{ds}})) IN (11,12,1)
                THEN
                    'WINTER'
            WHEN MONTH(TO_TIMESTAMP({{ds}})) IN (2,3,4)
                THEN
                    'SPRING'
            WHEN MONTH(TO_TIMESTAMP({{ds}})) IN (5,6,7)
                THEN
                    'SUMMER'
            ELSE 
                'FALL'
        END AS SEASON     
{% endmacro %}