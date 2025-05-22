# Telco Customer Churn Analysis #

**Table of Contents**

1. Business Context 

2. Dataset Overview

3. Data Cleaning Summary

4. SQL Queries and Results

5. Key Insights


## 1. Business Context ##

The goal of this analysis is to identify factors that contribute to customer churn and uncover patterns that can help retain high-value customers.

## 2.Dataset Overview ##

Source : [Telco Customer Churn](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)

Size: 7,043 rows(customers),
      21 columns(features)

## 3.Data Cleaning Summary ##

Removed irrevelant columns. 

Dropped columns with too many missing or irrelevant values. 

Removed empty strings from TotalCharges. 

Casted TotalCharges to numeric.




## 4.SQL Queries and Results ##

### 4.1 Churn Rate By Contract Type ###


```sql
SELECT Contract,
       COUNT(*) AS total_users,
       SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
       ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY contract
ORDER BY churn_rate DESC
```

![churnrate](https://github.com/user-attachments/assets/4d513d50-c4ec-4c47-9f24-5a2619f88ac0)

As the duration of the contract increases, the churn rate decreases significantly.

### 4.2 Churn Rate By Tenure Segments ###


```sql
SELECT CASE WHEN tenure <= 6 THEN '0-6 months'
            WHEN tenure <= 12 THEN '6-12 months'
            WHEN tenure <= 24 THEN '1-2 years'
            ELSE '2+ years' END AS tenure_group,
       COUNT(*) AS total_users,
       SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
       ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY tenure_group
ORDER BY churn_rate DESC;
```
![tenure_groups](https://github.com/user-attachments/assets/92d8e62c-44c7-46a0-823c-7011b37aa3e1)

Long-term users have lower churn rates even after the maximum contract period of 2 years.

### 4.3 Churn Rate of Online Security Service Users ###

```sql
SELECT onlinesecurity,
       COUNT(*) AS onlinesecurity_users,
       SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) as churned,
       ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)* 100 / COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY onlinesecurity
ORDER BY churn_rate DESC;
```
![onlinesecurity_service](https://github.com/user-attachments/assets/f564f06c-072b-453f-ab06-58cb83dfdbba)

The churn rate of Onlne Security Service users is significantly lower than churn rate of non-users.

### 4.4 Churn Rate of Customers Who Have Received Technical Support  ###

```sql
SELECT techsupport,
       COUNT(*) AS techsupport_users,
       SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) as churned,
       ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)* 100 / COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY techsupport
ORDER BY churn_rate DESC;
```
![tech_support](https://github.com/user-attachments/assets/d6dd9910-770f-4e96-bdcc-fcc850a92913)

Churn Rate of Customers who have received technical support is significantly lower. But most of the users didnt receive technical support.

### 4.5 Churn Rate of TV Streaming Service Users ###

```sql
SELECT streamingtv,
       COUNT(*) AS streamingtv_users,
       SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) as churned,
       ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)* 100 / COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY streamingtv
ORDER BY churn_rate;
```
![streaming_tv](https://github.com/user-attachments/assets/48bc5af4-e9a9-4a14-8c17-30cc2f4ed213)

Churn rate of TV Streaming Service users is slightly lower then non users. 

Use of TV Streaming Service has little effect in reducing churn rate.

### 4.6 Churn Rate of Movie Streaming Service Users ###

```sql
SELECT streamingmovies,
       COUNT(*) AS streamingmovies_users,
       SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) as churned,
       ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)* 100 / COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY streamingmovies
ORDER BY churn_rate;
```
![streaming_movies](https://github.com/user-attachments/assets/eba29fbb-e25a-4d26-8624-8e91f1678c58)

Churn rate of Movie Streaming Service users is slightly lower then non users.

Use of Movie Streaming Service has little effect in reducing churn rate.


## 5.Key Insights ##


- Monthly subscribers are less committed. Retention strategies like discounts for upgrading to annual plans can be beneficial.

- Customers using TV Streaming Service and Movie Streaming Service are more likely to churn. The reason for this situation must be investigated.

- Technical support reduces churn rate significantly. But most of the users didn't receive technical support. Efforts should be made to provide technical support to more people.

- Churn rate sharply drops for customers who stay beyond the first 12 months. Smiliarly the lowest churn rate group is users with 2+ years tenure. Therefore onboarding and early customer experience is critical. When considered together with tech support data, providing technical support service as early as possinle is important to keep new costumers for longer time.

- Customers in their first 6 months are at the highest risk of churning. There should be focus on improving early engagement to reduce early churn.

- Online Security Service is the least used service but its reducing churn rate of its users significantly. More promotion of this service would be beneficial.

  

