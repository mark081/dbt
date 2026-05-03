WITH common_table_exp AS (
    SELECT
        TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
        DATE(TO_TIMESTAMP(STARTED_AT) ) AS DATE_STARTED_AT,
        HOUR(TO_TIMESTAMP(STARTED_AT) ) AS HOUR_STARTED_AT,

    {{datetype('STARTED_AT')}} AS DATE_TYPE,

    {{season('STARTED_AT')}} AS STATION_OF_YEAR

from {{ ref('stage_bike') }}
)

SELECT * from common_table_exp