CREATE TABLE IF NOT EXISTS
  `cyclistic-case-study-17738.case_study.transforming_data2` AS
SELECT
  DISTINCT trip_data.ride_id,
  rideable_type,
  started_at,
  ended_at,
  ride_duration,
  EXTRACT (hour
  FROM
    started_at) AS started_on_hour,
  CASE EXTRACT(dayofweek
  FROM
    started_at)
    WHEN 1 THEN 'SUN'
    WHEN 2 THEN 'MON'
    WHEN 3 THEN 'TUES'
    WHEN 4 THEN 'WED'
    WHEN 5 THEN 'THURS'
    WHEN 6 THEN 'FRI'
    WHEN 7 THEN 'SAT'
END
  AS started_on_day,
  CASE EXTRACT(month
  FROM
    started_at)
    WHEN 1 THEN 'JAN'
    WHEN 2 THEN 'FEB'
    WHEN 3 THEN 'MAR'
    WHEN 4 THEN 'APR'
    WHEN 5 THEN 'MAY'
    WHEN 6 THEN 'JUN'
    WHEN 7 THEN 'JUL'
    WHEN 8 THEN 'AUG'
    WHEN 9 THEN 'SEP'
    WHEN 10 THEN 'OCT'
    WHEN 11 THEN 'NOV'
    WHEN 12 THEN 'DEC'
END
  AS started_on_month,
  EXTRACT(month
  FROM
    started_at) AS started_month_num,
  EXTRACT(year
  FROM
    started_at) AS started_on_year,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  CAST(start_lat as float64) as start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual
FROM
  `cyclistic-case-study-17738.case_study.trip_data` AS trip_data
JOIN (
  SELECT
    ride_id,
    ( EXTRACT(hour
      FROM (ended_at - started_at))*60 + EXTRACT(minute
      FROM (ended_at - started_at)) + EXTRACT(second
      FROM (ended_at - started_at))/60) AS ride_duration
  FROM
    `cyclistic-case-study-17738.case_study.trip_data` ) AS temp_data
ON
  trip_data.ride_id = temp_data.ride_id
WHERE
  start_station_name IS NOT NULL
  AND start_station_id IS NOT NULL
  AND end_station_name IS NOT NULL
  AND end_station_id IS NOT NULL
  AND end_lat IS NOT NULL
  AND end_lng IS NOT NULL
  AND ride_duration > 1
  AND ride_duration < 1440;