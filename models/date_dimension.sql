WITH common_table_exp AS (
    SELECT
        TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
        DATE(TO_TIMESTAMP(STARTED_AT) ) AS DATE_STARTED_AT,
        HOUR(TO_TIMESTAMP(STARTED_AT) ) AS HOUR_STARTED_AT,

        CASE 
            WHEN DAYNAME(TO_TIMESTAMP(STARTED_AT)) IN ('sat','sun')
                THEN
                    'WEEKEND'
                ELSE
                    'BUSINESS'
        END AS DATE_TYPE,

    {{season('STARTED_AT')}}

    FROM ({{ source('demo', 'bike') }})
)

SELECT * from common_table_exp