use [Porto 1]

/* 4.1 User Verification, Checked participants by counting number of distinct Ids in each dataset. */

SELECT COUNT (DISTINCT Id) AS Total_Ids 
FROM [dbo].[Daily activity]
SELECT COUNT (DISTINCT Id) AS Total_Ids 
FROM [dbo].[Hourly Calories]
SELECT COUNT (DISTINCT Id) AS Total_Ids 
FROM [dbo].[Hourly Steps]
SELECT COUNT (DISTINCT Id) AS Total_Ids 
FROM [dbo].[SleepDay]
SELECT COUNT (DISTINCT Id) AS Total_Ids 
FROM [dbo].[Weight Log]


/* 4.2 User insight, see how many times each of the users wore/used the FitBit tracker. */

SELECT Id,
COUNT(Id) AS Total_Id
FROM [dbo].[Daily activity]
GROUP BY Id

/* 4.3.	Breakdown the users by how much they wore their FitBit Fitness Tracker */

SELECT Id,
COUNT(Id) AS Total_Logged_Uses,
CASE
WHEN COUNT(Id) BETWEEN 25 AND 31 THEN 'Active User'
WHEN COUNT(Id) BETWEEN 15 and 24 THEN 'Moderate User'
WHEN COUNT(Id) BETWEEN 0 and 14 THEN 'Light User'
END Fitbit_Usage_Type
FROM [dbo].[Daily activity]
GROUP BY id


/* 4.4.	Look at the MIN, MAX, & AVG of total steps, total distance, calories and activity levels by Id. */

SELECT Id,
MAX(TotalSteps) AS Maximum_total_steps,
MIN(TotalSteps) AS Minimum_total_steps,
AVG(TotalSteps) AS Average_total_steps,
MAX(TotalDistance) AS maximum_total_distance,
MIN(TotalDistance) AS minimum_total_distance,
AVG(TotalDistance) AS average_total_distance,
MAX(Calories) AS maximum_calories,
MIN(Calories) AS minimum_calories,
AVG (Calories) AS Average_calories,
MAX(VeryActiveMinutes) AS max_active_minutes,
MIN(VeryActiveMinutes) AS min_active_minutes,
AVG(VeryActiveMinutes) AS average_active_minutes,
MAX(LightlyActiveMinutes) AS maximum_lightActive_minutes,
MIN(LightlyActiveMinutes) AS minimum_lightActiv_minutes,
AVG(LightlyActiveMinutes) AS average_active_minutes,
MAX(FairlyActiveMinutes) AS mximum_fairly_active_minutes,
MIN(FairlyActiveMinutes) AS minimum_fairly_active_minutes,
AVG(FairlyActiveMinutes) AS average_fairly_active_minutes,
MAX(SedentaryMinutes) AS maximum_sedentaryMinutes,
MIN(SedentaryMinutes) AS Minimum_SedentaryMinutes,
AVG(SedentaryMinutes) AS average_sedentaryMinutes
FROM [dbo].[Daily activity]
GROUP BY Id

/* 4.5 Narrow the results to just the averages of the different types of minutes by Id.*/

SELECT Id, 
avg(VeryActiveMinutes) AS Avg_Very_Active_Minutes,
avg(FairlyActiveMinutes) AS Avg_Fairly_Active_Minutes,
avg(LightlyActiveMinutes) AS Avg_Lightly_Active_Minutes,
avg(SedentaryMinutes) AS Avg_Sedentary_Minutes
FROM [dbo].[Daily activity]
GROUP BY Id

/* 4.6. Average active minutes by week day before moving on to user types */

SELECT FORMAT(CAST(ActivityDate AS DATE), 'ddd') AS Day_name,
ROUND (avg(VeryActiveMinutes), 2) AS Avg_Very_Active_Minutes,
ROUND (avg(FairlyActiveMinutes), 2) AS Avg_Fairly_Active_Minutes,
ROUND (avg(LightlyActiveMinutes), 2) AS Avg_Lightly_Active_Minutes,
ROUND (avg(SedentaryMinutes), 2) AS Avg_Sedentary_Minutes
FROM [dbo].[Daily activity]
GROUP BY FORMAT(CAST(ActivityDate AS DATE), 'ddd')
ORDER BY FORMAT(CAST(ActivityDate AS DATE), 'ddd')

/* 4.7. User Types by Activity Levels */

SELECT Id, 
avg(VeryActiveMinutes) + avg(FairlyActiveMinutes) AS Total_Avg_Active_Minutes
FROM [dbo].[Daily activity]
GROUP BY Id

SELECT Id, 
avg(VeryActiveMinutes) + avg(FairlyActiveMinutes) + avg(LightlyActiveMinutes) AS Total_Avg_Active_Minutes,
CASE 
WHEN avg(VeryActiveMinutes) + avg(FairlyActiveMinutes) + avg(LightlyActiveMinutes) >= 150 THEN 'Meets CDC Recommendation'
WHEN avg(VeryActiveMinutes) + avg(FairlyActiveMinutes) + avg(LightlyActiveMinutes) <150 THEN 'Does Not Meet CDC Recommendation'
END CDC_Recommendations
FROM [dbo].[Daily activity]
GROUP BY Id

/* 4.8. User Types by Total Steps */

SELECT Id,
avg(TotalSteps) AS Avg_Total_Steps,
CASE
WHEN avg(TotalSteps) < 5000 THEN 'Inactive'
WHEN avg(TotalSteps) BETWEEN 5000 AND 7499 THEN 'Low Active User'
WHEN avg(TotalSteps) BETWEEN 7500 AND 9999 THEN 'Average Active User'
WHEN avg(TotalSteps) BETWEEN 10000 AND 12499 THEN 'Active User'
WHEN avg(TotalSteps) >= 12500 THEN 'Very Active User'
END User_Type
FROM [dbo].[Daily activity]
GROUP BY Id

/* 4.9 Calories, Steps & Active Minutes by ID */

SELECT Id, 
Sum(TotalSteps) AS Sum_total_steps,
SUM(Calories) AS Sum_Calories, 
SUM(VeryActiveMinutes + FairlyActiveMinutes) AS Sum_Active_Minutes
FROM [dbo].[Daily activity]
GROUP BY Id


/*4.10 Total Steps by Day */

SELECT FORMAT(CAST(ActivityDate AS DATE), 'ddd'),
ROUND (avg(TotalSteps), 2) AS Average_Total_Steps
FROM [dbo].[Daily activity]
GROUP BY ActivityDate
ORDER BY Average_Total_Steps DESC 

/*4.11 Total Steps by Hour */

SELECT Active_time,
SUM(StepTotal) AS Total_steps_byHour
FROM [dbo].[Hourly Steps]
GROUP BY Active_time
ORDER BY Total_steps_byHour DESC

/* 4.12. Deeper Look Into Sleep */

SELECT SLEEP_DATE,
SUM(Total_Minutes_Asleep) AS total_minutes_asleep
FROM [dbo].[SleepDay]
WHERE SLEEP_DATE IS NOT NULL
GROUP BY SLEEP_DATE

SELECT dc.Id,
avg(dc.TotalSteps) AS AvgTotalSteps,
avg(dc.Calories) AS AvgCalories,
avg(sd.Total_Minutes_Asleep) AS AvgTotalMinutesAsleep
FROM [dbo].[Daily activity] AS dc
INNER JOIN [dbo].[SleepDay] AS sd
ON dc.Id=sd.Id
GROUP BY dc.Id