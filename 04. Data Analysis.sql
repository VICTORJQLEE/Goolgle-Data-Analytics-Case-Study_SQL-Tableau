  -- Data Analysis
  -- General metric of Members Vs Casual Users

SELECT
  member_casual,
  COUNT(ride_id) AS total_rides,
  ROUND(SUM(ride_duration),2) AS total_ride_mins,
  ROUND(AVG(ride_duration), 2) AS avg_ride_mins,
  ROUND(STDDEV(ride_duration), 2) AS std_dev
FROM
  `cyclistic-case-study-17738.case_study.transforming_data`
GROUP BY
  member_casual;



  -- bikes types used by riders
SELECT
  member_casual,
  rideable_type,
  COUNT(rideable_type) AS total_rides,
  ROUND(SUM(ride_duration),2) AS total_duration_mins,
  ROUND(AVG(ride_duration), 2) AS avg_duration_mins
FROM
  `cyclistic-case-study-17738.case_study.transforming_data`
GROUP BY
  member_casual,
  rideable_type
ORDER BY
  member_casual,
  total_rides;



  -- monthly comparison

SELECT
  started_month_num,
  started_on_month,
  member_casual,
  COUNT(ride_id) AS total_rides,
  ROUND(SUM(ride_duration), 2) AS total_ride_mins,
  ROUND(AVG(ride_duration), 2) AS avg_ride_mins
FROM
  `cyclistic-case-study-17738.case_study.transforming_data2`
GROUP BY
  started_month_num,
  started_on_month,
  member_casual
ORDER BY
  started_month_num,
  total_rides;



  -- day of week comparision

SELECT
  started_on_day,
  member_casual,
  COUNT(ride_id) AS total_rides,
  ROUND(SUM(ride_duration), 2) AS total_ride_mins,
  ROUND(AVG(ride_duration), 2) AS avg_ride_mins
FROM
  `cyclistic-case-study-17738.case_study.transforming_data`
GROUP BY
  started_on_day,
  member_casual
ORDER BY
  member_casual,
  total_rides DESC;



  -- hourly comparision

SELECT
  started_on_hour,
  member_casual,
  COUNT(ride_id) AS total_rides,
  ROUND(SUM(ride_duration), 2) AS total_ride_mins,
  ROUND(AVG(ride_duration), 2) AS avg_ride_mins
FROM
  `cyclistic-case-study-17738.case_study.transforming_data`
GROUP BY
  started_on_hour,
  member_casual
ORDER BY
  total_rides DESC;



  -- Top starting stations

SELECT
  start_station_name,
  member_casual,
  COUNT(ride_id) AS total_rides,
  ROUND(SUM(ride_duration), 2) AS total_ride_mins,
  ROUND(AVG(ride_duration), 2) AS avg_ride_mins
FROM
  `cyclistic-case-study-17738.case_study.transforming_data`
GROUP BY
  start_station_name,
  member_casual
ORDER BY
  total_rides DESC;



  -- Top ending stations

SELECT
  end_station_name,
  member_casual,
  COUNT(ride_id) AS total_rides,
  ROUND(SUM(ride_duration), 2) AS total_ride_mins,
  ROUND(AVG(ride_duration), 2) AS avg_ride_mins
FROM
  `cyclistic-case-study-17738.case_study.transforming_data`
GROUP BY
  end_station_name,
  member_casual
ORDER BY
  total_rides DESC;



  -- Long rides and short rides
  
SELECT
  CASE
    WHEN ride_duration >= 131 THEN "long_rides"
  ELSE
  "short_rides"
END
  AS ride_type,
  member_casual,
  COUNT(ride_id) AS total_rides,
  ROUND(SUM(ride_duration), 2) AS total_ride_mins
FROM
  `cyclistic-case-study-17738.case_study.transforming_data`
GROUP BY
  ride_type,
  member_casual
ORDER BY
  total_rides;