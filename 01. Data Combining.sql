CREATE TABLE IF NOT EXISTS
  `cyclistic-case-study-17738.case_study.trip_data` AS (
  SELECT
    DISTINCT ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    CAST(start_station_id AS STRING) AS start_station_id,
    end_station_name,
    CAST(end_station_id AS STRING) AS end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual
  FROM
    `cyclistic-case-study-17738.case_study.divvy-tripdata-20200*`
  UNION ALL
  SELECT
    DISTINCT ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    CAST(start_station_id AS STRING) AS start_station_id,
    end_station_name,
    CAST(end_station_id AS STRING) AS end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual
  FROM
    `cyclistic-case-study-17738.case_study.divvy-tripdata-202110`
  UNION ALL
  SELECT
    DISTINCT ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    CAST(start_station_id AS STRING) AS start_station_id,
    end_station_name,
    CAST(end_station_id AS STRING) AS end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual
  FROM
    `cyclistic-case-study-17738.case_study.divvy-tripdata-202011`
  UNION ALL
  SELECT
    DISTINCT ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    start_station_id AS start_station_id,
    end_station_name,
    end_station_id AS end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual
  FROM
    `cyclistic-case-study-17738.case_study.divvy-tripdata-202012`
  UNION ALL
  SELECT
    DISTINCT ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    start_station_id AS start_station_id,
    end_station_name,
    end_station_id AS end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual
  FROM
    `cyclistic-case-study-17738.case_study.divvy-tripdata-2021*`
  UNION ALL
  SELECT
    DISTINCT ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    start_station_id AS start_station_id,
    end_station_name,
    end_station_id AS end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual
  FROM
    `cyclistic-case-study-17738.case_study.divvy-tripdata-2022*`
  UNION ALL
  SELECT
    DISTINCT ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    start_station_id AS start_station_id,
    end_station_name,
    end_station_id AS end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual
  FROM
    `cyclistic-case-study-17738.case_study.divvy-tripdata-2023*` )
ORDER BY
  started_at;