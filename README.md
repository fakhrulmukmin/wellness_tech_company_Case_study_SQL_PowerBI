# wellness_tech_company_Case_study_SQL_PowerBI

## 1.	Data Set Information

**1.1.	Company Background**

Bellabeat, a global wellness tech company founded in 2013 by Sandro Mur, Urška Sršen, and Lovepreet Singh, is headquartered in San Francisco with offices in London, Hong Kong, and Zagreb. Specializing in women's health and wellness, Bellabeat offers a range of wearable and non-wearable tech products that focus on smart insights, a women-centric approach, holistic well-being, and body positivity. Their emphasis is on leveraging data and tracking metrics related to a woman's menstrual cycle, enabling users to understand their bio-responses and align them with their hormonal cycle for improved self-awareness and well-being.

**1.2.	Business Task**

Analyze trends in smart device usage using Fitbit Fitness Tracker Data, gain insights into customer preferences and behaviors, and tailor products and marketing strategies to meet the evolving needs of Bellabeat's target audience.

## 2. Data Set Information

**2.1.	Data Summary**

The data source used for this case study is FitBit Fitness Tracker Data. This dataset was downloaded from Kaggle where it was uploaded by Möbius.

Möbius published the dataset on Kaggle.com under the CC0: Public Domain Creative Common License, granting permission for the dataset to be copied, modified, distributed, and performed without the need for an explicit permission. The dataset citation provided by Möbius acknowledges Zendo as the source, specifically crediting Furberg, Robert; Brinton, Julia; Keating, Michael; and Ortiz, Alexa. [Source Here](https://zenodo.org/record/53894#.YMoUpnVKiP9)

The dataset was available on Zenodo.org was generated through a distributed survey on Amazon Mechanical Turk, with responses collected from 03.12.2016 to 05.12.2016. It includes personal tracker data from thirty eligible Fitbit users, encompassing minute-level records for physical activity, heart rate, and sleep monitoring. The variation in output reflects the usage of various Fitbit tracker models and individual tracking behaviors and preferences.

**2.2.	Data Limitation**

The FitBit Fitness Tracker Data collected in 2016 is outdated for current trend analysis, and the available datasets were limited to a 31-day period (04-12-2016 to 05-12-2016) instead of the initially stated time range. The relatively small timeframe and the sample size of 30 (later revised to 33) could introduce sample bias and limit the generalizability of the findings. Furthermore, the absence of demographic information hinders the ability to make targeted recommendations and identify the appropriate marketing strategies for Bellabeat's intended audience, including considerations such as gender, location, age, and job status.

# 3.	Stage of Process

**3.1.	User Verification**, checked participants by counting number of distinct Ids in each dataset.

•	Daily activity	 	= 33

•	Sleep data 	 	= 24

•	Hourly calorie	 	= 33

•	Hourly Steps data 	= 33

•	Weight_Log	    	= 8

Weight Log datasets do not include enough data to move forward with analysis. This dataset will not be used.

**3.2.	User insight**, see how many times each of the users wore/used the FitBit tracker
![image](https://github.com/fakhrulmukmin/wellness_tech_company_Case_study_SQL_PowerBI/assets/104128728/3a263cae-25f2-434d-b801-f5418c6e50ba)

Out of the total user base, 64% diligently logged data throughout the entire duration of the study (04-12-2016 to 05-12-2016). Including those who missed only 1-3 days, the percentage of users who consistently tracked their data or wore their FitBit Tracker over the month-long period increases significantly to 82%.

**3.3.	Breakdown the users by how much they wore their FitBit Fitness Tracker. I created three user types:**

![image](https://github.com/fakhrulmukmin/wellness_tech_company_Case_study_SQL_PowerBI/assets/104128728/239e5d4f-4425-4bac-8ef7-76ca5425458a)

1.	Active User, wore their tracker for 25-31 days.
2.	Moderate User, wore their tracker for 15-24 days.
3.	Light User, wore their tracker for 0 to 14 days.

**3.4.	Look at the MIN, MAX, & AVG of total steps, total distance, calories, and activity levels by Id.**
**3.5.	Narrow the results to just the averages of the different types of minutes by Id.**

These results showed that the average minutes of the Sedentary activity level was the highest for each distinct Id.

**3.6.	Average active minutes by weekday before moving on to user types.**

![image](https://github.com/fakhrulmukmin/wellness_tech_company_Case_study_SQL_PowerBI/assets/104128728/385b72fa-26c6-40e4-b33a-9783f97e2a5b)

By capitalizing on users' consistent daily active minute output, Bellabeat can enhance engagement and motivation by setting higher activity goals that encourage users to strive for more active or fairly active minutes each day.

**3.7.	User Types by Activity Levels**

In their pursuit of promoting a healthy lifestyle, the CDC recommends that individuals engage in 150 minutes of physical activity per week. To assess compliance with these guidelines, an analysis of the sum of average minutes of Very Active and Fairly Active is conducted for each distinct Id, allowing for an evaluation of whether individuals are meeting the CDC's activity recommendations.
Source: https://www.cdc.gov/physicalactivity/basics/adults/index.htm

The analysis revealed that, on average, none of the users were meeting the recommended 150 minutes of physical activity per week, indicating a potential need for increased efforts to incorporate more active and fairly active activities into their routine
However, when the activity level of "lightly active" is taken into account alongside "very active" and "fairly active," it becomes evident that a majority of the users now have an average of 150 or more minutes of "active" activity, aligning with the CDC's recommended requirements. This suggests that incorporating activities across all three levels can help individuals meet the recommended physical activity guidelines.

The analysis revealed that, Out of the 33 users, 27 met CDC Activity Length Recommendations and 6 do not on average.

**3.8.	User Types by Total Steps**

In her 2019 article on Healthline.com, Sara Lindberg cites a study conducted by Tudor-Locke et al. in 2011 titled "How many steps/day are enough? for adults." The study suggests that aiming for 10,000 steps per day is a reasonable target for maintaining good health among adults. 
Lindberg further categorizes activity levels based on steps into three distinct categories, providing a breakdown for readers to understand and track their daily physical activity.

•	Inactive: less than 5,000 steps per day

•	Average (somewhat active): ranges from 7,500 to 9,999 steps per day

•	Very Active: more than 12,500 steps per daySources: Healthline Article | 2011 StudyI will be using the above activity categories to create user types for the distinct Ids within the Daily Activity dataset. I’m interested to see how these categories may be broken down.When creating my SQL query I realized that the above categories from the Healthline article left some gaps. So I created two other categories:
  
  o	Low Active User: 5,000 to 7,499 steps
  
  o	Active User: 10,000 to 12,499 steps

![image](https://github.com/fakhrulmukmin/wellness_tech_company_Case_study_SQL_PowerBI/assets/104128728/ea99f5af-6458-4c1a-abc1-083353d6e3db)

Here are the Results:
•	Inactive User		= 8 users

•	Low Active User	= 9 users

•	Average Active User	= 9 users

•	Active User	 	= 5 users

•	Very Active User	= 2 users

After analyzing the sample based on user types, it is interesting to note that the split between non/low active users and active users closely mirrors the earlier results obtained from examining active minutes. Out of the total users, 17 (52%) fell into the non/low active category, while 16 (48%) were considered active. This indicates a nearly 50/50 distribution between the two types of users. Building on this observation, further activity comparisons were conducted to gain additional insights into the data.

**3.9.	Calories, Steps & Active Minutes by ID**

Exploring the relationship between logged calories, steps, and active minutes can provide valuable insights into the users' physical activity levels. While data visualization may offer a clearer representation, conducting the analysis in SQL can still be a beneficial exercise for honing my skills and understanding the data from a different perspective.


**3.10.	Total step by day**

look at average steps by day to see if users were more active on certain days of the week.

![image](https://github.com/fakhrulmukmin/wellness_tech_company_Case_study_SQL_PowerBI/assets/104128728/e61af3c4-1d31-423e-ace8-77d7cfcfd712)

Upon analyzing the query results, it is observed that there is not a significant difference in average steps across each day. However, Thursday stands out with the highest average steps, along with the end of the weekday (Friday) Based on this observation, one could potentially infer that users tend to be more motivated to be active before weekend (as indicated by the lowest total steps on Sunday) and that Thursday provides more opportunities for leisure time and increased physical activity.

**3.11.	Total Steps by Hour**

![image](https://github.com/fakhrulmukmin/wellness_tech_company_Case_study_SQL_PowerBI/assets/104128728/24a576d1-3a92-4cf6-9033-2c50e8555ca0)

take a look at Total Steps taking by Hour to see what time of day our users were most active. The top 3 hours of steps recorded were:
•	18:00:00 (6pm) – 542,848 steps

•	19:00:00 (7pm) – 528,552 steps

•	12:00:00 (12pm) – 505,848 steps

**3.12.	Deeper Look Into Sleep**

 explore the Sleep habits of the users and how it compares to activity level. First, looked at which date had the most minutes of sleep from all the users. And looked at average minutes slept, total steps and calories by user Id.

Upon analyzing the graphs, it becomes evident that there is a correlation between users who obtained at least 5 hours of sleep and higher step counts. However, despite this relationship, it is notable that the majority of users were not averaging the recommended 10,000 steps per day mentioned in the Healthline article previously cited. This suggests that although sleep duration appears to impact step counts positively, additional efforts may be needed to encourage users to meet the recommended activity level.

![image](https://github.com/fakhrulmukmin/wellness_tech_company_Case_study_SQL_PowerBI/assets/104128728/f7b2e2e3-d75a-4c68-9efe-fd23ac0f90b1)


**4.	Recommendation for Fitbits**

Based on the analysis, here are some recommendations for Fitbits:

1.	Increase user engagement: Since about 7% of users were classified as 'low' or 'moderate' in wearing their software, it is crucial to encourage and motivate users to consistently wear their software during their workouts. This can be achieved through personalized notifications, reminders, challenges, or rewards.
2.	Encourage goal setting: Given that 52% of users are not reaching the recommended 10,000 steps a day, it would be beneficial to promote goal-setting features within the software. Users can set step targets and receive progress updates to motivate them to achieve higher activity levels.
3.	Capitalize on consistent active periods: As the data shows that the most steps were taken during lunch hours or the 5pm - 7pm time frame, focus on providing tailored workout suggestions or prompts during these periods. Encourage users to engage in activities such as walks or dedicated workout sessions during their consistent active periods.
4.	Emphasize the importance of sleep: Since users who averaged 5 hours of sleep or more had higher average step totals, it is essential to educate users about the positive correlation between sleep quality/duration and physical activity. Provide sleep tracking features, sleep hygiene tips, and emphasize the benefits of well-rested nights for achieving fitness goals.
5.	Provide diverse workout options: Offer a variety of workout options within the software, catering to different preferences and fitness levels. Include cardio exercises, strength training routines, flexibility workouts, and guided classes to cater to the varied needs and interests of users.
6.	Track and celebrate milestones: Implement features that track and celebrate user milestones, such as reaching a certain number of steps, achieving personal bests, or hitting specific fitness targets. This gamification aspect can motivate users to continue their fitness journey and stay consistent with their workouts.

**5.	Marketing Recommendation for Fitbits**

Based on the provided data, here are some marketing recommendations for the software workout:
1.	Highlight user engagement and loyalty: Emphasize the high level of user activity and consistency by showcasing the percentage of 'active users' (93.5%) who utilized the software consistently for 25-31 days. Use this statistic in marketing materials, social media campaigns, or testimonials to demonstrate the effectiveness and value of the software in helping users stay committed to their fitness goals.
2.	Showcase time-specific benefits: Capitalize on the consistent activity patterns observed during lunchtime and the 5pm - 7pm time frame. Highlight how the software workout can seamlessly fit into users' existing routines, allowing them to make the most of their time and maximize their activity levels during these periods. Create targeted messaging that emphasizes the convenience and efficiency of using the software during these peak activity times.
3.	Offer personalized workout plans: Leverage the data collected to provide personalized workout plans tailored to different time frames. Develop specific routines, exercises, or challenges that align with users' preferred activity times, whether it's during lunch breaks or after work. Emphasize how the software can optimize their workouts and help them achieve their fitness goals within their chosen time slots.
4.	Promote community and social features: Encourage users to share their workout achievements and experiences within the software. Incorporate social features that allow users to connect, share progress, and motivate each other. Foster a sense of community by organizing challenges, virtual events, or leaderboards based on activity during the popular time frames. Highlight the benefits of peer support and friendly competition in driving user engagement and adherence.
5.	Collaborate with workplace wellness programs: Recognize the trend of increased activity during lunchtime, which suggests that users may be incorporating workouts during their workday. Partner with companies or organizations to promote the software as a tool for workplace wellness initiatives. Offer special corporate packages, integrate with existing wellness programs, or provide resources to help employees prioritize physical activity during their breaks.
6.	Provide success stories and testimonials: Gather success stories and testimonials from users who have experienced positive results and improvements in their fitness journey using the software. Feature these stories in marketing campaigns to inspire and motivate potential users. Highlight how the software has helped individuals integrate fitness into their daily lives, particularly during lunch or after work, resulting in tangible benefits such as increased energy, improved productivity, or weight management














