# Introduction

Welcome to my case study for Google’s Data Analytics Professional Certificate program. 

In this case study, I’ll be working for a fictional company called Cyclistic to perform some real-world tasks as a junior data analyst. In order to answer the key business questions, I will follow the steps of the data analysis process which I have learned from the Google Data Analytics Program: Ask, Prepare, Process, Analyze, Share, and Act.

# Background: a brief summary of the case

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system at any time.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign targeting all-new customers, Moreno believes there is a good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs.

Moreno (The director of marketing) has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends. Moreno wants our team to answer: **How do annual members and casual riders use Cyclistic bikes differently?**

In order to answer this business question, combining the background of which annual members are much more profitable than casual riders and the dataset I get which includes bike types, the total number of rides, ride's month, ride's day, ride's hour, the latitude and longitude of stations, and also the member-causal type, I will break the business question down into several hypotheses:

H1: Mebmers use bikes more often than casuals.
H2: Members' total ride time is higher than casuals'.
H3: Members' average ride time is higher than casuals'.
H4: Due to the weather in Chicago, both members and casuals prefer to use bikes in summer than winter. 
H5: Members' total rides per month are higher than casuals.
H6: Members' average ride duration per month is higher than casuals.
H7: Members are more active on weekdays rather than weekends, casual riders are highly active on weekends. 
H8: Members' total rides per day of the week are higher than casuals.
H9: Members' average ride duration per day of the week is higher than casuals.
H11: Members have a ride peak at 8 mornings and at 17 afternoons during weekdays while casual users tend to ride more in the afternoon during weekends.
H11: Members' total rides per hour of the day are higher than casuals.
H12：Members' average ride duration per hour of the day is higher than casuals.
H13: Members' starting and ending locations are clustered in the downtown area, while casual customers' locations are more dispersed and along the beach. 

# Phase 1: Defining the Business Question

So, the business question I was assigned to analyze is quite clear: **How do annual members and casual riders use Cyclistic bikes differently?** Cyclistic Company wants to know the main differences between the two types of users — casual riders (who pay for each ride, and annual members (who pay a yearly subscription) through analysis of their data. In order to answer the question, I need to analyze Cyclistic’s Rides data to identify all the possible insights about different usage by members and casual rides. And further, if there is enough data, I would try to figure out what factors motivate casual riders to buy Cyclistic annual memberships and how can Cyclistic use digital media to influence casual riders to become members. If there is not enough data, I will put these two questions for the next step of analysis and collect enough data to answer these two questions.  

The goal is to get insights that could support the marketing director's strategy. My stakeholder in this project is the marketing director and I will report to her directly.

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

I use the LENGTH function to check if there are any type errors with ride_id column. 

<img width="669" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/19268dfe-e90d-4626-850a-b03e0f536f4f">

The result shows that there is no type errors of ride_id.

## Deleting possible spaces in all columns

I use the TRIM function to remove any possible spaces in all columns. 

<img width="668" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/ed442b5c-b159-44ee-bacb-307724a82ef9">


## Checking Duplicates.

As ride_id is the primary key and has no null values, I will use it to check for duplicates. Then, I choose COUNT, GROUP BY, and HAVING functions to check duplicates. 

<img width="851" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/97fc0a2f-313b-4102-bb83-b0e4762308ba">

<img width="534" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/0d8fefa1-9a8b-468a-a127-765300248019">

I use COUNT and COUNT DISTINCT to check the duplicate rows number again. 

## Checking Rideable Types

There are three types of bikes: docked bike, electric bike, and classic bike. Each one has a number of trips of 2828774, 3623622, and 6948723 respectively. 

<img width="547" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/673babdd-5c23-4ce5-8b90-d477cbdc5c4c">

## Checking Datetime Type

The started_at and ended_at shows start and end time of the trip in YYYY-MM-DD hh:mm:ss UTC format

<img width="453" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/e78e2527-bf06-4644-bd47-946152855da7">

## Checking whether there are erros which started date  > ended date

There are 8855 rows where started date > ended date. We should remove these rows for our final analysis. 

<img width="610" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/baa10b17-b8da-413c-83c4-15ff5b9424a0">


## Checking Member-Casual Types

There are two types of riders: member and casual. Each one has a number of trips 5552587 and 7848532 respectively.

<img width="525" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/e46d9a90-310b-4cfb-bb51-091029368234">


# Phase 3: Data Cleaning and Transforming

## Removing Nulls, Duplicates, Outliers

1. As said above, I delete all of the missing value rows. 
2. Based on the requirement of this case study, I calculate 4 more columns: ride_duration, started_on_day, started_on_month, and started_on_year.
3. I think that the ride_duration which are less one minute and longer than a day are outliers. So I delete all of these outliers. 


# Phase 4: Analyzing Data

Our business task is to answer the question: **How do annual members and casual riders use Cyclistic bikes differently?** Based on the question, I proposed three hypotheses: First, members and casual customers are fundamentally different. Second, their purposes for using Cyclistic are fundamentally different. Third, it can be very difficult, if not possible, to convert casual customers to members.
To examine my hypotheses, I will look at the behaviour patterns of both casual riders and members, try to find similarities and differences in how they use the service, and based on our findings come up with possible proposals on how we can convert casual riders into members. For this analysis, I will use functions like COUNT, SUM, AVG, MAX, MIN, ROUND, WHERE, GROUP BY, and ORDER BY


## Descriptive Analysis

First of all, member and casual riders are compared through descriptive analysis to demonstrate some general traits of different users.

<img width="879" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/e5b4f123-2921-49e9-9458-6c82d71757ef">

Here we can see, members have more rides (7,699,182) than casuals (5,475,343). However, casuals have longer total ride time (156,539,490.22) than members (104,017,510.52). On average, casuals are more than double as long as members (28.59 vs 13.51). The max and min for the two groups keep the same as we delete the data for less than one minute and longer than a day. 

If Cyclistic charges service fees by rides, it would be a good idea to transfer casual into members. As members use this service more often than casuals. If Cyclistic charges service fees by using time, they should focus on strategies that promote customers to use their service casually because casuals use bikes about 2 times longer than members every time. 


## Bike Types Comparision

Now let's check which is the preferred Rideable Type for each user type.

<img width="823" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/8f4310a4-08ac-42e2-b0b5-c868ba5bbac1">

As shown above, members and casuals are different in bike types using. 

Members prefer to use classic the most, the total rides for classic is 4,413,557. The total ride minutes is 59,397,720.72, which is significantly higher than another two types. Their second favorite is the electric bike. The total rides and ride minutes are 2,028,192 and 23,422,094.82. The docked bike is their least favorite choice. Members are more likely inclined to utilize docked bikes for longer trips, given that they offer the longest average usage time.

classic and electric are used almost equally with 30% for classic and 29% for electric. For ride time (longer rides), members have a little preference for classic bike meaning 22% of all ride time.
Casuals have a marked preference for classic bikes hitting 2,436,475 rides. There is no difference on the electric and docked bike choices which have similar rides (1511286 vs 1527582). Casual users also show a preference for choosing docked bikes for longer trips, with nearly 44 minutes of them, on average, opting for docked bikes when they choose this mode of service.


## Monthly Comparision

The following table shows the number of trips distributed by month. 

<img width="611" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/49aa4cfa-797e-4718-8178-b68122d26818">

Here we see that June, July, August, and September are the top months for both. Both casual and members exhibit comparable behavior, with more trips in the summer and fewer in the winter. 


## Day of Week Comparision

The table below shows which day of week has the highest demand by different users.

<img width="753" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/d94dc66f-355f-436c-ace9-4ed0b162bb47">

It turns out that Saturdays, Sundays, and Fridays are best for casual customers, while the numbers of rides from members are more or less stable throughout the week and the top ride days are Wednesday, Thursday, and Tuesday. Sundays are the slowest days for members. The average ride of casuals is around 30 minutes. On the other hand, the average ride of members is around 13 minutes increasing a little bit on weekends to 15 minutes. This observation is almost the total opposite of that of casual customers. This can be because casual customers are tourists from other cities or even countries who visit Chicago on weekends when they have free time. On the other hand, members are local who regularly rides to and from their work, and they don't ride as much on weekends, especially on Sundays, as on weekdays.


## Hourly Comparision

Based on the previous day-level analysis, the following table summarizes the total number of rides, average ride duration in each hour of every day:

<img width="685" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/d628f3a0-93c2-4fb0-bcdb-f3ad1a2334ef">

From the chart above, members have peak times from 7–9 am and 5–7 pm — 'the rush hour'. The peaks observed from the members' group are clear signatures that they are locals and use cyclistic's bikes in their daily routines. No pronounced peaks show up in the casual customers' group. Casual users tend to ride more at afternoon. Top ride hours for both members and casual users goes from 15 to 19.



## Top Stations

I expect to find any stations preference by users.

For started stations, there is one with a big difference of rides (Streeter Dr & Gran Ave.) 157k rides. In fact first three stations with more rides are for casual users hitting 300k rides. The next three stations with 200k rides are for members. The top 10 stations are hitting more than 724k rides. It's about 5.5% of total rides. 

<img width="813" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/728913f4-4c69-4aa4-9f8b-f4bc238f915e">

For ended stations, Streeter Dr & Gran Avethere is also the one with a big difference of rides: 166k rides. The first three stations with more rides are also for casual users hitting 325k rides. The next three stations with 198k rides are for members. The top 10 stations hit more than 745k rides. It's about 5.7% of total rides. 

<img width="795" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/60a4f849-4238-4f35-87d8-aacdd0d52349">


## Long and Short Rides

As the average ride's duration for members and casuals are 13.51 and 28.59 and their standard deviations are 18.99 and 51.2 respectively, I would define long rides as longer than 131 mins which equals 28.59 + 2*51.2 and short rides are less than 131 minutes.

<img width="691" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/629bcfc7-42a2-4ecb-9823-38036b108295">


As shown in the following table, there are more than 116k long rides for casual and only 10k long rides for members. 

<img width="666" alt="image" src="https://github.com/VICTORJQLEE/Goolgle-Data-Analytics-Case-Study_sql-/assets/125883856/95db38ca-50f6-4292-91de-f7646e66f096">



# Summary Analysis

Last year 2022 Cyclistic had 5,590,846 rides, 40.1% Casual Users and 59.9% Members. About Ride Time, there were 1,836,571 ride hours, 61.41% for Casual Users and 38.59% for Members. Average ride minute was 21.21, 29.53 for Casual Users and 12.89 for Members. Here we can see an indicator that tell us Casual Users tend to take longer rides than Members.
Hottest months for both Members and Casual were from June to September which is expected given this is summer season, representing 29% for Members and 25% for Casuals of all rides and 62% of total casual rides.
The behavior on days of week show Members has slightly more rides from Tuesday to Thursday but in general all days of week has the same average ride around 400k rides, having Sunday the lower ride demand. In case of Casual User, has a ride’s preference for weekends with 37% of total casual rides vs 63% rides on weekdays. Ride Time average even increase on weekends meaning 42% of total casual ride hours.
Members has some peak hours at 8 and 17, reaching 100k rides at 7 mornings while Casual hit 100k rides at 11 and have its peak ride hour at 17 same as member.
Both users have the same range hours with more rides, from 14 to 19, hitting almost 50% of all members and casual rides and ride time, while average ride is 13 for members and 28 for casual users.
Regarding Stations there’s just one with an important difference vs other, Streeter Dr & Grand Ave with 57,525 rides by Casuals, but that is not too representative.
Out of 1673 Stations, Top 25, represent 13% of total member rides and 12% of total ride hours while for casuals are 18% rides and 24% ride time.
For complete the understanding of ride habits, Long Rides (Rides>24 hours) represent just 0.1% of all rides, but 16% of total ride time and casual user owner 87% of long rides, 94% of ride hours, representing 15% of all ride time.
For short rides difference is lower, 59% for members and 41% for casual riders, but average ride is just 12.57 for members and 22.14 for casual users.

# Phase 5: Sharing

Now we’re ready to use these insights to make recommendations for the marketing team.

Use cases
Casual riders mostly use bike-sharing for leisure and tourism purposes and are highly active on weekends;
Members use bike-sharing to commute to work during the week and are more active on weekdays rather than weekends.
Based on this finding, it’s worth considering to offer new types of membership focused on weekend rides, family membership (families tend to spend their weekends together), or offers created in collaboration with museums/theatres and other institutions to where casual riders travel the most.

2. Usage time

Casual riders use bikes for much longer trips than members.
Based on this insight, we can think about offering bonuses for longer rides.

3. Seasoning

The bike usage reaches its peak in June-August
Thus the campaign should start in spring offering early-bird discounts for these new types of memberships and continue during the Summer peak.
























































































































