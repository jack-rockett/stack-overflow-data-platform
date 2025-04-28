WITH generated_dates AS (

    SELECT
        day AS date_day,
        EXTRACT(YEAR FROM day) AS year,
        EXTRACT(MONTH FROM day) AS month,
        EXTRACT(DAY FROM day) AS day_of_month,
        FORMAT_DATE('%A', day) AS day_name,
        FORMAT_DATE('%B', day) AS month_name,
        EXTRACT(WEEK FROM day) AS week_of_year,
        EXTRACT(DAYOFWEEK FROM day) AS day_of_week_iso,  -- 1 (Sunday) to 7 (Saturday)
        EXTRACT(QUARTER FROM day) AS quarter,
        CASE 
            WHEN EXTRACT(DAYOFWEEK FROM day) IN (1, 7) THEN TRUE 
            ELSE FALSE 
        END AS is_weekend
    FROM
        UNNEST(GENERATE_DATE_ARRAY('2015-01-01', '2030-12-31', INTERVAL 1 DAY)) AS day

)

SELECT * 
FROM generated_dates