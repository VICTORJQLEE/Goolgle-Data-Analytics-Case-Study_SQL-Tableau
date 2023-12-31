# Introduction

Welcome to my case study for Google’s Data Analytics Professional Certificate program. 

In this case study, I’ll be working for a fictional company called Cyclistic to perform some real-world tasks as a junior data analyst. In order to answer the key business questions, I will follow the steps of the data analysis process which I have learned from the Google Data Analytics Program: Ask, Prepare, Process, Analyze, Share, and Act.

# Background: a brief summary of the case

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system at any time.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign targeting all-new customers, Moreno believes there is a good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.

Moreno (The director of marketing) has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends. Moreno wants our team to answer: **How do annual members and casual riders use Cyclistic bikes differently?**

# Excutive Summary

Cyclistic had total 13174525,590,846 rides in the past three years, 58.44% Members and 41.56% Casual Users. About Ride Time, there were 260,556,991 ride minutes,  39.92% for Members and 60.08% for Casual Users. The average ride minute was 19.78, 13.51 for Members, and 28.59 for Casual Users. It means that Casual Users tend to take longer rides than Members. If Cyclistic charges fees based on ride time, they have to consider this phenomenon. 

Both Members and Casual prefer to ride bikes during May and September. This is expected that these months are suitable for riding bikes. The rides during May and September account for 68.33% of total rides, 76.44% of total casual rides, and 62.56 of total member rides.

Members prefer to ride during weekdays. There are slightly more rides from Tuesday to Thursday but in general, all days of the week have a similar demand with an average of 1099k, and having Sunday the lowest ride demand with 918k. The case of Casual User has a ride preference for weekends with 40.20% of total casual rides on Sunday and Saturday. The ride time average even increases to 45% on weekends.

Members have peak hours at 8 hitting 468k and at 17 hitting 827k,  while Casual hit its peak ride hour at 17 with 531k rides. Both users have the same range of hours with more rides, from 14 to 19, hitting almost 50% of all members and casual rides and ride time.

Regarding Stations there’s just one with an essential difference vs the other, Streeter Dr & Grand Ave with 156K rides by Casuals, but that is not too representative.

Out of 1587 Stations, the Top 25, represent 15.5% of total member rides and 15.7% of total ride hours while casuals are 21.4% of rides and 26.6% of ride time.

# Phase 1: Defining the Business Question

The business question assigned to me is pretty clear: **"How do annual members and casual riders use Cyclistic bikes differently?"** Cyclistic Company seeks to understand the main differences between these two user groups - casual riders (who pay for each ride) and annual members (who pay for a yearly subscription) - through data analysis. To address this question, I will examine Cyclistic's Rides data to gain insights into the distinct usage patterns of members and casual riders. Additionally, if there is sufficient data available, I will explore the factors that motivate casual riders to purchase Cyclistic annual memberships and consider how digital media can be utilized to influence them to become members. If data is insufficient, I will prioritize addressing these questions in subsequent analyses by collecting additional relevant data.

To approach this business question effectively, I will consider both the background information highlighting the higher profitability of annual members compared to casual riders and the dataset provided, which includes valuable information such as bike types, total number of rides, ride months, ride days, ride hours, latitude and longitude of stations, and member-causal type. Based on this information, I will formulate several hypotheses to guide my analysis:

H1: Members use bikes more often than casuals.

H2: Members' total ride time is higher than casuals'.

H3: Members' average ride duration is higher than casuals'.

H4: Member and casuals are significantly different in bike type choice. 

H5: Due to the weather in Chicago, both members and casuals prefer to use bikes in summer than winter. 

H6: Members' total rides per month are higher than casuals.

H7: Members' total ride duration per month is higher than casuals.

H8: Members are more active on weekdays rather than weekends, casual riders are highly active on weekends. 

H9: Members' total ride duration is higher than casuals on weekdays while lower than casuals on weekends.

H10: Members' average ride duration is higher than casuals on weekdays while lower than casuals on weekends.

H11: Members have a ride peak at 8 mornings and at 17 afternoons during weekdays while casual users tend to ride more in the afternoon during weekends.

H12: Members' total rides per hour of the day are higher than casuals.

H13：Members' average ride duration per hour of the day is higher than casuals.

H14: Members' starting and ending locations are clustered in the downtown area, while casual customers' locations are more dispersed and along the beach. 

The goal of this project is to get insights that could support the marketing director's strategy. My stakeholder in this project is the marketing director and I will report to her directly.

# Phase 2: Preparing Data

## Data Source and Organization 

The dataset provided for this case study project includes 39 ‘.csv’ files representing each month from April 2020 to June 2023 and is located on the company’s cloud storage (Amazon Web Services: <https://divvy-tripdata.s3.amazonaws.com/index.html>).

Data is stored monthly on .csv format files, it is structured on rows and columns. I proceed to open one file in a spreadsheet to understand what information comes in the data.

<img width="1155" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/15aa06da-912d-4e5b-bb75-b57caaee2d40">

As we can see, the table uses 13 columns ("ride_id", "rideable_type", "started_at", "ended_at",       "start_station_name", "start_station_id", "end_station_name", "end_station_id", "start_lat", "start_lng", "end_lat",     "end_lng", "member_casual") to record each month's rides.

As this data is about the full registration of all stations for all rides, we can say that the data is unbiased. And we download this data from original source, which can ensure that the data is Reliable, Original, Comprehensive, Current, and Cited. It means that the data is ROCCC.

## Process

I will use BigQuery to combine the various datasets into one dataset and clean it. As there are over 10 million rows for all of the datasets. Google spreadsheets or Excel are unable to manage large amounts of data like this. It is essential to use a platform like BigQuery that supports huge volumes of data.

## Data Combining

Further inspection of the files showed that there are multiple null values across tables, also columns have inconsistent naming and formatting that causes duplicates and the inability to merge tables without additional formatting.

Thus, to prepare data for cleaning, we need to change the type of two columns (start_station_id, end_station_id) of the first 8 months to match the most recent data. 

01. Data Combining.sql: https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/blob/18894401c9b96148cd37acfd57670994fff3728f/01.%20Data%20Combining.sql

<img width="1339" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/ee4c49d1-b21e-4c8d-b80a-2aa11eca6cdc">


Now that we have all the data in one place saved as a new virtual table, we can start to clean the data of possible inconsistencies and/or errors. We will also add new columns based on existing data calculations to get more in-depth insights into user behavior.

# PHASE 2: Data Exploration

Before cleaning the data, I explore the data to find the inconsistencies and verify data integrity.

## Checking Data Types

First I proceed to check if all columns have the correct Data Type. As there is an invalid project ID error, I check the data type through the data preview pane in Bigquery.

<img width="416" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/857bc6a9-94d1-4724-8de0-71f7a6e42afe">

The result above shows all columns have appropriate data types. I successfully changed the staion_id data types for the first 8 months. The ride_id column could be the primary key.

## Checking Nulls

After checking the data type, I use the COUNTIF function to check the null fields in the table.

<img width="1267" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/e1dd5d20-0d19-4e8a-9fd6-928754106c9e">

The result shows that start_station_name, start_station_id, end_station_name, end_station_id columns, and end_lat and end_lng have null cells. I also note that there are the same number of missing in the end_lat and end_lng. This may be due to missing information in the same row i.e. station's name and id for the same station and latitude and longitude for the same ending station.

So, should we remove these null values or not or what can I do to correct these nulls?

I apply filters by using the where function in Bigquery to closely examine the null value rows. I found that only the data involved electric bikes with no station name values but they did include start and end geographical points. However, the data without start_station_id involved three bike types. And the data without end_station_name also involved three bike types. And the most of missing start_station_name are companioned with missing start_station_id. So it is impossible to create and reference a temp or permanent unique table which includes the unique station id and station name to replace the null values. So I am not sure what reasons caused the missing values in the fields of start_station_name, start_station_id, end_station_name, and end_station_id. For the purpose of my analysis of this task, I will remove those rows as the left is enough to represent the whole population to draw stable conclusions. 

## Checking ride_id Type errors with the length function

I use the LENGTH function to check if there are any type errors with the ride_id column. 

<img width="461" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/ef5548cc-2029-4575-86ef-1d94c0dcb355">


The result shows that there are no type errors of ride_id.

## Deleting possible spaces in all columns

I use the TRIM function to remove any possible spaces in all columns. 

<img width="541" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/2b6d174d-bbba-4d60-9674-c6219d30448f">



## Checking Duplicates.

As ride_id is the primary key and has no null values, I will use it to check for duplicates. Then, I choose COUNT, GROUP BY, and HAVING functions to check duplicates. 

<img width="937" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/e38d8586-07e0-4cc5-8512-80b2830373ea">


I use COUNT and COUNT DISTINCT to check the duplicate rows number again. 

<img width="458" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/64a26ca8-9278-48bf-a107-1d1cc82c187d">


## Checking Rideable Types

There are three types of bikes: docked bike, electric bike, and classic bike. Each one has a number of trips of 2859565, 6871602, and 7279441 respectively.  

<img width="628" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/08144ffd-9f57-48d9-92fc-2301db130003">


## Checking Datetime Type

The started_at and ended_at show the start and end time of the trip in YYYY-MM-DD hh:mm:ss UTC format

<img width="453" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/e78e2527-bf06-4644-bd47-946152855da7">

## Checking whether there are errors which started date  > ended date

There are 8855 rows where started date > ended date. We should remove these rows for our final analysis. 

<img width="955" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/f4684ff4-8e6d-4a3a-bfb1-ac8e5c291a18">


## Checking Member-Casual Types

There are two types of riders: member and casual. Each one has a number of trips 5552587 and 7848532 respectively.

<img width="525" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/e46d9a90-310b-4cfb-bb51-091029368234">


# Phase 3: Data Cleaning and Transforming

## Removing Nulls, Duplicates, Outliers

1. As said above, I delete all of the missing value rows. 
2. Based on the requirement of this case study, I calculate 4 more columns: ride_duration, started_on_day, started_on_month, and started_on_year.
3. I think that the ride_duration which is less one minute and longer than a day are outliers. So I delete all of these outliers. 


# Phase 4: Analyzing Data

Our business task is to answer the question: **How do annual members and casual riders use Cyclistic bikes differently?** Based on the question, I proposed three hypotheses: First, members and casual customers are fundamentally different. Second, their purposes for using Cyclistic are fundamentally different. Third, it can be very difficult, if not possible, to convert casual customers to members.
To examine my hypotheses, I will look at the behavior patterns of both casual riders and members, try to find similarities and differences in how they use the service, and based on our findings come up with possible proposals on how we can convert casual riders into members. For this analysis, I will use functions like COUNT, SUM, AVG, MAX, MIN, ROUND, WHERE, GROUP BY, and ORDER BY


## Descriptive Analysis

First of all, member and casual riders are compared through descriptive analysis to demonstrate some general traits of different users.

<img width="677" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/5667e6d8-abab-4273-b76f-53f9a34f32cd">


<img width="354" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/034ed3b4-1a66-40c6-961e-91317faa3137">

<img width="731" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/f3ae5cbe-9714-45b1-820b-1cce4d7c9d3a">

Here we can see, members have more rides (7,699,182) than casuals (5,475,343). Through the Chi-square test, the difference in rides between members and casuals is significant. My first hypothesis: "Mebmers use bikes more often than casuals" is true. Members use Cyclistic's service more frequently than casuals. 

However, casuals have longer total ride time (156,539,490.22) than members (104,017,510.52). On average, casuals have a ride duration that is more than double that of members (28.59 minutes vs. 13.51 minutes). The max and min for the two groups keep the same as we delete the data for less than one minute and longer than a day. 
H2: Members' total ride duration is higher than casuals' and H3: Members' average ride duration is higher than casuals', are not supported by data. 

If Cyclistic charges service fees per ride, it would be beneficial to encourage casual riders to become members since members use the service more frequently than casuals. However, if Cyclistic charges fees based on usage time, they may need to focus on strategies that promote casual usage, as casual riders use bikes for about twice as long as members each time. To reach any useful conclusions, we need more data, like price, financial analysis reports, etc. 


## Bike Types Comparision

Now let's check which is the preferred Rideable Type for each user type.

Firstly, we notice that Cyclistic may decrease the docked-type bikes intentionally. 

<img width="564" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/cda92585-6cb7-4530-a2fc-4e4d3823c585">

In 2020, docked-type bikes accounted for 87.66%, it only accounted for 2.38 in 2023. If possible, it's better to figure out why Cyclistic decided to reduce the number of docked-type bikes. 

I created the following table below through Bigquery includes the total ride duration and average ride duration. 
<img width="823" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/8f4310a4-08ac-42e2-b0b5-c868ba5bbac1">



Total Rides

<img width="533" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/b9cffb40-4814-4af1-a1e0-7a07fff98d3d">


Total Ride Duration

<img width="516" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/d30e8e49-3d64-4ae3-874f-737b119ae289">


Average Ride Duration

<img width="520" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/144f124a-9a6d-4e37-9baa-fc59eecdbbd7">

T-test for Average Ride Duration to compare the means between members and casuals

<img width="636" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/b27f8a13-a561-40ad-903b-571787c7fb89">


As shown above, the difference between members and casuals is significant in bike type choice. 

For the classic bike total rides, members' total hit 4,413,557, accounting for 64.43%, which is significantly higher than casual users who hit 2,436,475 rides, accounting for 35.57%.

For the docked bike total rides, members' total rides hit 1,257,433, accounting for 45.15%, which is significantly lower than casual users who hit 1,527,582, accounting for 54.85%.

For the electric bike total rides, members' total rides hit 2,028,192, accounting for 57.30%, which is significantly higher than casual users who hit 1,511,286, accounting for 42.57%. 

For the total ride duration, members are significantly lower than casuals in all three types of bikes. 
For the classic bike, members' total ride time hit 59,397,721 minutes, accounting for 48.78%, which is significantly lower than casual users who hit 62,379,518, accounting for 51.22%.

For the docked bike, members' total ride time hit 21,197,695 minutes, accounting for 24.04%, which is significantly lower than casual users who hit 66,978,388, accounting for 75.96%.

For the electric bike, members' total ride time hit 23,422,095 minutes, accounting for 46.29%, which is significantly lower than casual users who hit 27,181,584, accounting for 53.71%.

In terms of average ride duration, members are significantly lower than casuals in all three types of bikes. 

For the classic bike, members' average ride duration hit 9.68 minutes, which is significantly lower than casual users who hit 15.45.
 
For the docked bike, members' average ride duration hit 12.92 minutes, which is significantly lower than casual users who hit 25.47.

For the electric bike, members' average ride duration hit 8.65 minutes, which is significantly lower than casual users who hit 11.90.

As members and casuals are significantly different in 
there was evidence that at the 5% level, hypothesis H4 was verified that members and casuals are different bike type choices. 

Based on these findings, if Cyclistic wants to transfer casuals into members, they should increase the number of classic bikes. In 2021 and 2022, they actually conducted this strategy, increasing classic bikes, and decreasing docked-type bikes. However, in 2023, they started to increase the proportion of electric bikes. It is not aligned with their strategy. They may need to adjust their operations. 


## Monthly Comparision

The following table shows the number of trips distributed by month. 

<img width="611" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/49aa4cfa-797e-4718-8178-b68122d26818">

Here we see that June, July, August, and September are the top months for both. Both casual and members exhibit comparable behavior, with more trips in the summer and fewer in the winter. 
The following visual shows the same trend.

We also compared years' trends, it has the same trends. The patterns over the years are similar with more trips in the summer and fewer in the winter. 

<img width="1086" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/988d6300-326e-455e-a753-326094f1213e">

As we found similar patterns, our hypothesis H5, both members and casuals prefer to use bikes in summer than winter was verified. 

<img width="817" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/62fa9aa8-a5c0-4784-97b0-67eeffc334f1">


Through the chart above, we can see that the proportion of members is higher than casuals, except in July where both sides are almost equal (49.48 vs 50.52). Especially in the winter, the proportion of members' total rides hit 70%+. This may be the reason why the finance team concluded that annual members are much more profitable than casual riders.

So we can say that our hypothesis H6: Members' total rides per month are higher than casuals, is partially supported.

My seven hypothesis H7 is "Members' total ride duration per month is higher than casuals." However, through the chart below, it is not true. Members' total ride duration in January, February, March, November, and December. In the rest of the seven months, it is lower than casuals. So, the hypothesis is not supported. 

<img width="804" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/f914c294-2704-4def-aef2-1f95ce614d7c">

I also compared the average ride duration per month. It shows that members' average ride duration is lower than casuals in all of the months. 

<img width="801" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/0d31668d-4c6e-486d-bacd-2eb44d86786e">


## Day of Week Comparision

The table below shows which day of the week has the highest demand by different users.

<img width="753" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/d94dc66f-355f-436c-ace9-4ed0b162bb47">

It turns out that Saturdays, Sundays, and Fridays are best for casual customers, while the numbers of rides from members are more or less stable throughout the week and the top ride days are Wednesday, Thursday, and Tuesday. Sundays are the slowest days for members. The average ride of casuals is around 30 minutes. On the other hand, the average ride of members is around 13 minutes increasing a little bit on weekends to 15 minutes. This observation is almost the total opposite of that of casual customers. This can be because casual customers are tourists from other cities or even countries who visit Chicago on weekends when they have free time. On the other hand, members are local who regularly rides to and from their work, and they don't ride as much on weekends, especially on Sundays, as on weekdays.


### Day of Week Total Rides

<img width="782" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/880c0a1a-cfb7-4cdc-be0d-4dd548ca60b4">

Through the chart above, it is clear that casuals' total rides on weekends are higher than members while members' are higher on weekdays. 
MY hypothesis "H8: Members are more active on weekdays rather than weekends, and casual riders are highly active on weekends" is supported.  


### Day of Week Total Ride Duration

<img width="807" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/49df6e8f-6046-4802-8885-697c7635ff4c">

The chart above shows that casuals' day-of-week total ride duration is higher than members' except Wednesday. My hypothesis H9: Members' total ride duration is higher than casuals on weekdays while lower than casuals on weekends, is not supported. Casuals seem like to use bikes more regard to ride duration.


### Day of Week Average Ride Duration

<img width="700" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/deee3487-fdc4-420f-a9f4-2a4126b90937">

For the average ride duration, casuals are higher than members on all of the days. It means that casuals always use bikes for a longer time than members on all days of the week. My hypothesis H10: Members' average ride duration is higher than casuals on weekdays while lower than casuals on weekends, is not supported. 

## Hourly Comparision

Based on the previous day-level analysis, the following table summarizes the total number of rides, average ride duration in each hour of every day:

<img width="685" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/d628f3a0-93c2-4fb0-bcdb-f3ad1a2334ef">

From the chart above, members have peak times from 7–9 am and 5–7 pm — 'the rush hour'. The peaks observed from the members' group are clear signatures that they are locals and use cyclistic's bikes in their daily routines. No pronounced peaks show up in the casual customers' group. Casual users tend to ride more at afternoon. Top ride hours for both members and casual users goes from 15 to 19.


### Hourly Total Rides

<img width="1022" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/1cbc4d5d-95cf-4bfa-b41f-fb5e97379db6">

Through the chart above, From 4 am to 9 pm, members' total rides are higher than casuals'.  From 10 pm to 3 am, casuals' total rides are higher than members'. 

From the chart below, members' ride peak times appear at 7 am to 8 am and 16 pm to 18 pm. Casuals' ride peak times appear at 15 to 18. 
MY hypothesis H11: Members have a ride peak at 8 mornings and at 17 afternoons during weekdays while casual users tend to ride more in the afternoon during weekends, is supported. 

<img width="807" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/9c6f2b4a-f56a-43d2-bcd0-a03b18827f31">


### Hourly Total Ride Duration

<img width="1049" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/4a289bbe-4001-4105-8be1-5515b50404cf">

The above chart shows that, from 5 am to 8 am, the members' proportion of ride duration is higher than casuals. For the rest hours, casuals' proportion is higher than members'. My hypothesis H12: Members' total rides per hour of the day are higher than casuals, is not supported. 


### Hourly Average Ride Duration

<img width="1045" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/d99227ec-4187-4869-be35-a26bb5150235">

For the average ride duration, casuals are higher than members on all of the hours. It means that casuals always use bikes for a longer time than members at all hours of the day. My hypothesis H13: Members' average ride duration per hour of the day is higher than casuals, is not supported. 
I got the opposite result.

## Stations Distribution

The locations of starting and ending stations are analyzed to further understand the differences between casual and member riders.

For started stations, there is one with a big difference of rides (Streeter Dr & Gran Ave.) 157k rides. In fact, first three stations with more rides are for casual users hitting 300k rides. The next three stations with 200k rides are for members. The top 10 stations are hitting more than 724k rides. It's about 5.5% of total rides. 

<img width="813" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/728913f4-4c69-4aa4-9f8b-f4bc238f915e">

For ended stations, Streeter Dr & Gran Avethere is also the one with a big difference of rides: 166k rides. The first three stations with more rides are also for casual users hitting 325k rides. The next three stations with 198k rides are for members. The top 10 stations hit more than 745k rides. It's about 5.7% of total rides. 

<img width="795" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/60a4f849-4238-4f35-87d8-aacdd0d52349">

Through the charts below, we can clearly see that for casual riders the areas of their interest are located around the city center and along the beach where the most cultural & leisure points are. 

In contrast, members’ bike usage during the week is less dense in tourist areas but instead, it’s quite heavy around Chicago's downtown area which could also prove our hypothesis that most of the annual members commute daily to work. 

For the starting stations, Casual riders often started from aquariums, the vicinity of museums, parks, beaches, and harbor points. In contrast, members often started from stations close to universities, residential areas, restaurants, hospitals, grocery stores, etc.

<img width="887" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/e4569964-c18d-4e4a-9d4c-62da36dea464">

For the ended stations, we have similar findings. Casual riders tend to end their trip near museums and other attraction sites while members often end their journey close to universities, and residential and commercial areas. 

<img width="891" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/3984050f-add9-484b-9cf8-a7f9165e8ad0">

## Long and Short Rides

As the average ride's duration for members and casuals are 13.51 and 28.59 and their standard deviations are 18.99 and 51.2 respectively, I would define long rides as longer than 131 mins which equals 28.59 + 2*51.2 and short rides are less than 131 minutes.

<img width="691" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/629bcfc7-42a2-4ecb-9823-38036b108295">

As shown in the following table, there are more than 116k long rides for casual and only 10k long rides for members. 

<img width="666" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/95db38ca-50f6-4292-91de-f7646e66f096">


## Finding Summary

Through the data analysis, we can confidently say that members and casuals are two different customer groups.

Firstly, it's important to recognize that members and casual customers utilize Cyclistic bikes for distinct purposes. Members use the bikes for their daily commutes, whereas casual customers use them primarily for sightseeing around Chicago. Consequently, members exhibit higher bike usage frequency, with ride durations roughly half that of casual riders.

Furthermore, there are notable differences in the start and end locations of their journeys. Members typically initiate and conclude their trips in proximity to universities, residential areas, and commercial districts. On the other hand, casual customers tend to start and finish their rides near parks, museums, and coastal areas.

These variations in bike usage patterns, trip durations, and preferred locations should be taken into account while devising strategies to target and engage both member and casual customer segments effectively. It seems that converting casual customers to members will prove to be the most challenging task as both groups have totally different preferences. Although Cyclistic can attempt to develop a campaign to convert casual customers into members, the likelihood of achieving success seems rather low.


# Phase 5: Sharing

## Use Frequency

Based on the analysis, it is evident that casual riders predominantly use bike-sharing for leisure and tourism, with heightened activity during weekends. On the other hand, members primarily use bike-sharing for their daily work commute, showing increased activity on weekdays. Considering these findings, Cyclistic should explore offering new membership options tailored to weekend riders, family memberships (as families often spend weekends together), or partnerships with museums, theaters, and other popular locations frequently visited by casual riders.

## Usage Time

The data indicates that casual riders take significantly longer trips compared to members. To capitalize on this insight, Cyclistic can consider introducing bonuses or rewards for riders who take longer trips, encouraging extended usage.

## Seasonality

Bike usage peaks during June to August, coinciding with the summer season. With this in mind, Cyclistic should initiate marketing campaigns in spring, offering early-bird discounts for the new membership types. These campaigns should continue during the peak summer months to attract and retain customers.

# Phase 6: Acting

"Despite the challenges, all hope is not lost for Cyclistic, as the analysis results provide a foundation for several revenue-boosting actions. To address the initial questions more succinctly, we can rephrase them as, 'How can Cyclistic increase its revenue based on the available data?' Additionally, let's not forget the last original question: 'How can the marketing team leverage digital media to maximize the number of members?'

## Suggestion 1: Casual Users have longer ride durations.

Create targeted social media campaigns aimed at casual customers on weekends, for example, offering trial benefits to casual users with an average monthly ride duration of 25 minutes. Target users near the top 25 stations and run the campaign from mid-spring to mid-autumn, with special promotions for weekend trips and classic bike riders. Regarding digital media utilization, Cyclistic can craft more focused and effective campaigns, for instance, a 'Weekend Experience with Cyclistic' social media campaign could incentivize them to share their positive experiences for future discounts or lower membership fees. Encouraging resharing would expand reach and attract potential customers within a limited timeframe.

Furthermore, expansion opportunities could be explored by analyzing customers' home addresses, identifying tourist hotspots. By establishing branches in these areas, Cyclistic can attract both local residents and tourists as members, enhancing daily commute and sightseeing experiences.

A more flexible pricing structure tailored to weekend users could also entice more customers to become members. A membership plan accommodating weekend-only bike usage would appeal to those seeking occasional rides.

## Suggestion 2: Members use Cyclistic for commuting to work.

Cyclistic could offer promotions to casual users who use Cyclistic for work commutes or create a corporate package for companies near the top 25 stations, providing Cyclistic rides as an employee benefit. The campaign should run from mid-spring to mid-autumn, targeting users near the top 25 stations, with special promotions for weekdays and electric and classic bike riders.

## Suggestion3: Round Trips

Recognize that members often take round trips, and many casual users may exhibit similar behavior but have not yet become members. Develop a campaign for users who use the service twice a day, offering a special promotion for becoming members. Target users near the top 25 stations and run the campaign from mid-spring to mid-autumn, focusing on weekdays and classic bike riders.

By implementing these strategies, Cyclistic can leverage the data insights to attract more members, enhance customer engagement, and ultimately increase revenue. Additionally, providing stakeholders with additional information such as user IDs, age, gender, and price could further refine the analysis and lead to even more targeted marketing efforts.


In conclusion, the Cyclistic case study demonstrates that casual customers and members constitute distinct customer groups, making conversion challenging. However, leveraging the available data, Cyclistic can implement targeted actions to maximize revenue and cater to both segments effectively.

Working on this capstone project has been an enriching experience, providing valuable insights into real-world data analysis, including data preparation and cleaning. Ensuring data reliability and integrity emerged as vital aspects before conducting the analysis. Additionally, visualizing diverse data metrics led to fascinating discoveries, informing sound business decisions.

Ultimately, the fulfillment lies in using data to guide decisions that enhance people's lives. I look forward to future opportunities to delve into further analytical pursuits. Until then, happy analyzing!"
