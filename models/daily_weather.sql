with DAILY_WEATHER AS (
    SELECT
        date(TIME) AS DAILY_WEATHER,
        WEATHER,
        TEMP,
        PRESSURE,
        HUMIDITY,
        CLOUDS
     FROM
        {{ source('demo', 'weather') }}
),

DAILY_WEATHER_AGG AS (
-- Creates a KV of {(DAILY_WEATHER, WEATHER) : WEATHER_COUNT}
    SELECT 
        DAILY_WEATHER,
        WEATHER,
        round(avg(temp),2) AS AVG_TEMP,
        round(avg(pressure),2) AS AVG_PRESSURE,
        round(avg(HUMIDITY),2) AS AVG_HUMIDIDY,
        round(avg(clouds),2) AS AVG_CLOUDS
        -- COUNT(WEATHER),
        -- Allows you to break up your data into "mini tables"
        -- fow_number() over (partition by DAILY_WEATHER order by count(weather) desc) as row_number
    FROM DAILY_WEATHER
    GROUP BY DAILY_WEATHER, WEATHER
    QUALIFY row_number() over (partition by DAILY_WEATHER order by count(weather) desc) = 1
)

SELECT * FROM DAILY_WEATHER_AGG