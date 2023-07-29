-- Data Exploration

--Verifying Data Integrity
-- checking the data types of all columns
-- First I proceed to check if all columns have the correct Data Type.
-- As there is an invalid project ID error, I check the data type through data preview pane. 
SELECT column_name, data_type
FROM `cyclistic-case-study-17738.case_study.trip_data`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = `cyclistic-case-study-17738.case_study.trip_data`;


-- checking for number of null values in all columns

SELECT COUNTIF(ride_id is NULL) as null_ride_id,
       COUNTIF(rideable_type is NULL) as null_rideable_type,
       COUNTIF(started_at is NULL) as null_started_at,
       COUNTIF(ended_at is NULL) as null_ended_at,
       COUNTIF(start_station_name is NULL) as null_start_station_name,
       COUNTIF(start_station_id is NULL) as null_start_station_id,
       COUNTIF(end_station_name is NULL) as null_end_station_name,
       COUNTIF(end_station_id is NULL) as null_end_station_id,
       COUNTIF(start_lat is NULL) as null_start_lat,
       COUNTIF(start_lng is NULL) as null_start_lng,
       COUNTIF(end_lat is NULL) as null_end_lat,
       COUNTIF(end_lng is NULL) as null_end_lng,
       COUNTIF(member_casual is NULL) as null_member_casual
FROM `cyclistic-case-study-17738.case_study.trip_data`;

-- selecting data without null values in all columns
create table `cyclistic-case-study-17738.case_study.final_data`
as
SELECT * 
FROM `cyclistic-case-study-17738.case_study.trip_data`
WHERE  start_station_name is not null and
       start_station_id is not null and
       end_station_name is not null and
       end_station_id is not null and
       end_lat is not null and
       end_lng is not null


-- check if there is any type error with LENGTH function for ride_id
select *
from `cyclistic-case-study-17738.case_study.final_data`
where length(ride_id) !=16



-- delete possible spaces in all columns

update `cyclistic-case-study-17738.case_study.final_data`
set start_station_name = trim(start_station_name),
    start_station_id = trim(start_station_id),
    end_station_id = trim(end_station_id),
    end_station_name = trim(end_station_name),
    ride_id = trim(ride_id),
    rideable_type = trim(rideable_type)
where true


-- checking for duplicate rows

SELECT ride_id, COUNT(ride_id) as duplicate_rows, 
FROM `cyclistic-case-study-17738.case_study.final_data`
group by ride_id
having duplicate_rows >1;

-- rechecking duplicate use member-casual

select distinct member_casual
from `cyclistic-case-study-17738.case_study.final_data`;

-- checking duplicate rows number

select count(ride_id) - count(distinct ride_id)
from `cyclistic-case-study-17738.case_study.final_data`;

-- romving duplicates rows
create table `cyclistic-case-study-17738.case_study.final_data_dedup`
as
select distinct *
FROM `cyclistic-case-study-17738.case_study.final_data`

-- Or we can use the following code to remove duplicates rows
create table `cyclistic-case-study-17738.case_study.final_data_dedup2`
as
SELECT *
FROM (
  SELECT
      *,
      ROW_NUMBER()
          OVER (PARTITION BY ride_id)
          row_number
  FROM `cyclistic-case-study-17738.case_study.final_data_dedup`
)
WHERE row_number = 1

-- rideable_type - check 3 unique type of bikes

SELECT DISTINCT rideable_type, COUNT(rideable_type) AS no_of_trips
FROM `cyclistic-case-study-17738.case_study.final_data_dedup2`
GROUP BY rideable_type;

-- checking datatime type: TIMESTAMP - YYYY-MM-DD hh:mm:ss UTC

SELECT started_at, ended_at
FROM `cyclistic-case-study-17738.case_study.final_data_dedup2`
LIMIT 50;


-- checking member and casual riders

SELECT DISTINCT member_casual, COUNT(member_casual) AS no_of_trips
FROM `cyclistic-case-study-17738.case_study.final_data_dedup2`
GROUP BY member_casual;