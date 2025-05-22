/*ALTER TABLE churn_data
ALTER COLUMN "totalcharges" TYPE NUMERIC
USING "totalcharges"::NUMERIC; 

SELECT Contract,
       COUNT(*) AS total_users,
	   SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
	   ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY contract; 

SELECT CASE WHEN tenure <= 6 THEN '0-6 months'
            WHEN tenure <= 12 THEN '6-12 months'
			WHEN tenure <= 24 THEN '1-2 years'
			ELSE '2+ years' END AS tenure_group,
		COUNT(*) AS total_users,
		SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
	    ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)*100/COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY tenure_group; 

SELECT onlinesecurity,
       COUNT(*) AS onlinesecurity_users,
       SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) as churned,
	   ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)* 100 / COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY onlinesecurity; 

SELECT techsupport,
       COUNT(*) AS techsupport_users,
       SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) as churned,
	   ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)* 100 / COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY techsupport; 

SELECT streamingtv,
       COUNT(*) AS streamingtv_users,
       SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) as churned,
	   ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)* 100 / COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY streamingtv; */

SELECT streamingmovies,
       COUNT(*) AS streamingmovies_users,
       SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) as churned,
	   ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END)* 100 / COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY streamingmovies;



