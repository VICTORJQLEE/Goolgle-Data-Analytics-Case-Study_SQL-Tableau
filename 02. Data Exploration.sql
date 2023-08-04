  -- Data Exploration）
  -- Verifying Data Integrity
  -- checking the data types of all columns
  -- First I proceed to check if all columns have the correct Data Type.
  -- As there is an invalid project ID error, I check the data type through data preview pane.

SELECT
  column_name,
  data_type
FROM
  `cyclistic-case-study-17738.case_study.trip_data`.information_schema.columns
WHERE
  table_name = `cyclistic-case-study-17738.case_study.trip_data`;



  -- checking for number of null values in all columns

SELECT
  COUNTIF(ride_id IS NULL) AS null_ride_id,
  COUNTIF(rideable_type IS NULL) AS null_rideable_type,
  COUNTIF(started_at IS NULL) AS null_started_at,
  COUNTIF(ended_at IS NULL) AS null_ended_at,
  COUNTIF(start_station_name IS NULL) AS null_start_station_name,
  COUNTIF(start_station_id IS NULL) AS null_start_station_id,
  COUNTIF(end_station_name IS NULL) AS null_end_station_name,
  COUNTIF(end_station_id IS NULL) AS null_end_station_id,
  COUNTIF(start_lat IS NULL) AS null_start_lat,
  COUNTIF(start_lng IS NULL) AS null_start_lng,
  COUNTIF(end_lat IS NULL) AS null_end_lat,
  COUNTIF(end_lng IS NULL) AS null_end_lng,
  COUNTIF(member_casual IS NULL) AS null_member_casual
FROM
  `cyclistic-case-study-17738.case_study.trip_data`;



  -- check if there is any type error with LENGTH function for ride_id

SELECT
  *
FROM
  `cyclistic-case-study-17738.case_study.trip_data`
WHERE
  LENGTH(ride_id) !=16;



  -- delete possible spaces in all columns

UPDATE
  `cyclistic-case-study-17738.case_study.trip_data`
SET
  start_station_name = TRIM(start_station_name),
  start_station_id = TRIM(start_station_id),
  end_station_id = TRIM(end_station_id),
  end_station_name = TRIM(end_station_name),
  ride_id = TRIM(ride_id),
  rideable_type = TRIM(rideable_type)
WHERE
  TRUE;



  -- checking for duplicate rows

SELECT
  ride_id,
  COUNT(ride_id) AS duplicate_rows,
FROM
  `cyclistic-case-study-17738.case_study.trip_data`
GROUP BY
  ride_id
HAVING
  duplicate_rows >1;



  -- rechecking duplicate use member-casual

SELECT
  DISTINCT member_casual
FROM
  `cyclistic-case-study-17738.case_study.trip_data`;



  -- checking duplicate rows number

SELECT
  COUNT(ride_id) - COUNT(DISTINCT ride_id)
FROM
  `cyclistic-case-study-17738.case_study.trip_data`;



  -- rideable_type - check 3 unique type of bikes

SELECT
  DISTINCT rideable_type,
  COUNT(rideable_type) AS no_of_trips
FROM
  `cyclistic-case-study-17738.case_study.trip_data2`
GROUP BY
  rideable_type;



  -- checking datatime type: TIMESTAMP - YYYY-MM-DD hh:mm:ss UTC

SELECT
  started_at,
  ended_at
FROM
  `cyclistic-case-study-17738.case_study.trip_data`
LIMIT
  50;




  -- checking whether there are erros which started date  > ended date

SELECT
  started_at,
  ended_at
FROM
  `cyclistic-case-study-17738.case_study.trip_data`
WHERE
  started_at > ended_at;



  -- checking if there are any durations which is longer than a day

SELECT
  COUNT(*) AS longer_than_a_day
FROM
  `cyclistic-case-study-17738.case_study.trip_data`
WHERE
  ( EXTRACT(hour
    FROM (ended_at - started_at)) + EXTRACT(minute
    FROM (ended_at - started_at))/60 + EXTRACT(second
    FROM (ended_at - started_at))/3600 >=24 );



  -- there are 14299 rows where the ride duration is longer than a day
  -- checking member and casual riders
  
SELECT
  DISTINCT member_casual,
  COUNT(member_casual) AS no_of_trips
FROM
  `cyclistic-case-study-17738.case_study.trip_data`
GROUP BY
  member_casual;