Create database project2;
use project2;


select * from cleaned_heart_data;

#SQL for subgroup analysis (e.g., AVG cholesterol by age/gender)
#1. Average Cholesterol by Age and Gender
SELECT 
    age,
    gender,
    ROUND(AVG(cholesterol), 2) AS avg_cholesterol
FROM cleaned_heart_data
GROUP BY age, gender
ORDER BY age, gender;

 #2. Heart Disease Rate by Chest Pain Type and Gender
 SELECT 
    chest_pain_type,
    gender,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN heart_disease = 'Disease' THEN 1 ELSE 0 END) AS disease_cases,
    ROUND(SUM(CASE WHEN heart_disease = 'Disease' THEN 1 ELSE 0 END)*100.0 / COUNT(*), 2) AS disease_rate_percent
FROM cleaned_heart_data
GROUP BY chest_pain_type, gender;

#3. Heart Disease Prevalence by Fasting Blood Sugar Level
SELECT 
    fasting_blood_sugar,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN heart_disease = 'Disease' THEN 1 ELSE 0 END) AS disease_cases,
    ROUND(SUM(CASE WHEN heart_disease = 'Disease' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS disease_rate_percent
FROM cleaned_heart_data
GROUP BY fasting_blood_sugar;

#4. Heart Disease Rate by Exercise Angina
SELECT 
    exercise_angina,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN heart_disease = 'Disease' THEN 1 ELSE 0 END) AS disease_cases,
    ROUND(SUM(CASE WHEN heart_disease = 'Disease' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS disease_rate_percent
FROM cleaned_heart_data
GROUP BY exercise_angina;




-- Key Insights from Subgroup Analyses:

-- 1. Average Cholesterol by Age and Gender:- 
-- Cholesterol levels vary across age and gender.
-- No consistent trend by age is observed, but:
-- In some age groups, males show slightly higher average cholesterol than females.
-- For example, at age 35.
-- There may be a slight gender difference in cholesterol levels at certain ages,
-- with males sometimes having higher cholesterol.

-- 2. Heart Disease Rate by Chest Pain Type and Gender
-- Asymptomatic chest pain is highly associated with heart disease, especially in males (79.41%).
-- Females with Non-anginal or Typical Angina have the lowest disease rates. 

-- 3. Heart Disease Prevalence by Fasting Blood Sugar Level
-- The disease rate is nearly equal for both categories.
-- Fasting blood sugar > 120 mg/dL does not significantly increase heart disease risk in this dataset.

-- 4. Heart Disease Rate by Exercise-Induced Angina
-- Individuals with exercise-induced angina have a much higher heart disease rate (76.29%).
-- This suggests a strong correlation between exercise intolerance and heart disease.

 -- Summary Insight:
-- Males with asymptomatic chest pain and individuals with exercise-induced angina are the most at-risk groups.
-- Fasting blood sugar alone is not a strong predictor of heart disease in this data.



 
 
 
 
 