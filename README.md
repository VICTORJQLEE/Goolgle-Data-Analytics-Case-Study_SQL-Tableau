# Introduction

In this case study, I’ll be working for a fictional company called Cyclistic to perform some real-world tasks as a junior data analyst. In order to answer the key business questions, I will follow the steps of the data analysis process which I have learned from the Google Data Analytics Program: Ask, Prepare, Process, Analyze, Share, and Act.

# Background: a brief summary of the case

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system at any time.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign targeting all-new customers, Moreno believes there is a good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.

Moreno (The director of marketing) has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends. Moreno wants our team to answer: How do annual members and casual riders use Cyclistic bikes differently?

# PHASE 1: Defining the Business Question

So, the business question I was assigned to analyze is quite clear: How do annual members and casual riders use Cyclistic bikes differently? Cyclistic Company wants to know the main differences between the two types of users — casual riders (who pay for each ride, and annual members (who pay a yearly subscription) through analysis of their data. In order to answer the question, I need to analyze Cyclistic’s Rides data to identify all the possible insights about different usage by members and casual rides. And further, if there is enough data, I would try to figure out what factors motivate casual riders to buy Cyclistic annual memberships and how can Cyclistic use digital media to influence casual riders to become members. If there is not enough data, I will put these two questions for the next step of analysis and collect enough data to answer these two questions.  

The goal is to get insights that could support the marketing director's strategy. My stakeholder in this project is the marketing director and I will report to her directly.

# PHASE 2: PREPARING DATA

## Data Source and Organization

The dataset provided for this case study project includes 39 ‘.csv’ files representing each month from April 2020 to June 2023 and is located on the company’s cloud storage (Amazon Web Services: <https://divvy-tripdata.s3.amazonaws.com/index.html>).

Each table uses 13 columns ("ride_id", "rideable_type", "started_at", "ended_at",       "start_station_name", "start_station_id", "end_station_name", "end_station_id", "start_lat", "start_lng", "end_lat",     "end_lng", "member_casual") to record each month's rides.

Data is stored monthly on .csv format files, it is structured on rows and columns. I proceed to open one file in a spreadsheet to understand what information comes in the data.

<img width="1155" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/15aa06da-912d-4e5b-bb75-b57caaee2d40">

Further inspection of the files showed that there are multiple null values across tables, also columns have inconsistent naming and formatting that causes duplicates and the inability to merge tables without additional formatting.

Thus, to prepare data for cleaning, we need to change the type of two columns (start_station_id, end_station_id) of the first 7 months to match the most recent data. 

Now that we have all the data in one place saved as a new virtual table, we can start to clean the data of possible inconsistencies and/or errors. We will also add new columns based on existing data calculations to get more in-depth insights into user behavior.

### Process

I will use BigQuery to combine the various datasets into one dataset and clean it. As there are over 10 million rows for all of the datasets. Google spreadsheets or Excel are unable to manage large amounts of data like this. It is essential to use a platform like BigQuery that supports huge volumes of data.
> 01. Data Combining.sql


<img width="416" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/857bc6a9-94d1-4724-8de0-71f7a6e42afe">

