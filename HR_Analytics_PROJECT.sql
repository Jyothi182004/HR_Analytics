create database HR_Analytics;
use HR_analytics;

SHOW PROCESSLIST;
#1.KPI AVG attrition Rate each deparment

select * From hr_1;
SELECT Department, 
       AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 AS Avg_Attrition_Rate
FROM hr_1
GROUP BY Department;

LOCK TABLES hr_1 READ;

UNLOCK TABLES;
#KPI2 Avg of hourly Rate of male research Scintist
LOCK TABLES hr_1 READ;

SELECT AVG(HourlyRate) AS Avg_Hourly_Rate
FROM hr_1
WHERE Gender = 'Male' AND JobRole = 'Research Scientist';

SHOW TABLES LIKE 'hr_1';

#KPI3 Attrition rate Vs monthly income statistics
SELECT 
    AVG(CASE WHEN a.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 AS Attrition_Rate,
    AVG(b.MonthlyIncome) AS Avg_Monthly_Income,
    MIN(b.MonthlyIncome) AS Min_Monthly_Income,
    MAX(b.MonthlyIncome) AS Max_Monthly_Income
FROM 
    hr_1 a
JOIN 
    hr_2 b ON a.EmployeeNumber = b.`ï»¿Employee ID`;

#KPI4 Avg working years per each deparment
SELECT h1.Department, 
       AVG(h2.TotalWorkingYears) AS Avg_Working_Years
FROM hr_1 h1
JOIN hr_2 h2 ON h1.EmployeeNumber = h2.`ï»¿Employee ID` 
GROUP BY h1.Department;

#5 KPI Job ROle vs Worklife Balance

SELECT h1.JobRole, 
       AVG(h2.WorkLifeBalance) AS Avg_Work_Life_Balance
FROM hr_1 h1
JOIN Hr_2 h2 ON h1.EmployeeNumber = h2.`ï»¿Employee ID`
GROUP BY h1.JobRole
LIMIT 0, 50000;

#6 KPI attrition rate vs yearssincelastpromotion 
SELECT AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 AS Attrition_Rate, 
       AVG(YearsSinceLastPromotion) AS Avg_Years_Since_Promotion
FROM hr_data;
SELECT h2.YearsSinceLastPromotion, 
       AVG(CASE WHEN h1.Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 AS Attrition_Rate
FROM hr_1 h1
JOIN hr_2 h2 ON h1.EmployeeNumber= h2.`ï»¿Employee ID`
GROUP BY h2.YearsSinceLastPromotion
ORDER BY h2.YearsSinceLastPromotion;

#AVG job Satisfaction per each department
SELECT Department, AVG(JobSatisfaction) AS AvgJobSatisfaction
FROM `merge hr_analytics`
GROUP BY Department;

FLUSH TABLES;

#impact of travel frequecny on attrition 
SELECT BusinessTravel, 
       COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
       COUNT(*) AS TotalEmployees,
       (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS AttritionRate
FROM `merge hr_analytics`
GROUP BY BusinessTravel;

#work life balance by each department
SELECT Department, AVG(WorkLifeBalance) AS AvgWorkLifeBalance
FROM `merge hr_analytics`
GROUP BY Department;

#Emplloyee age distribution by deartment
SELECT Department, ï»¿Age, COUNT(*) AS EmployeeCount
FROM `merge hr_analytics`
GROUP BY Department, ï»¿Age
ORDER BY Department,ï»¿Age;

#AVG monthly income per each department
SELECT JobRole, AVG(MonthlyIncome) AS AvgMonthlyIncome
FROM `merge hr_analytics`
GROUP BY JobRole;

#attrition distance from home
SELECT DistanceFromHome, 
       COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
       COUNT(*) AS TotalEmployees,
       (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS AttritionRate
FROM `merge hr_analytics`
GROUP BY DistanceFromHome
ORDER BY DistanceFromHome;

#attrition by job level
SELECT JobLevel, 
       COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
       COUNT(*) AS TotalEmployees,
       (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS AttritionRate
FROM `merge hr_analytics`
GROUP BY JobLevel
ORDER BY JobLevel;

USE hr_analytics;

SHOW TABLES;

flush tables;


#attrition rate wise education level
SELECT Education, 
       COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) AS AttritionCount,
       COUNT(*) AS TotalEmployees,
       (COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*)) AS AttritionRate
FROM `merge hr_analytics`
GROUP BY Education;

#yearssincelastyear promotion
SELECT Department, AVG(YearsSinceLastPromotion) AS AvgYearsSinceLastPromotion
FROM `merge hr_analytics`
GROUP BY Department;













