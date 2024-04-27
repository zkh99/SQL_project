/*
Question 2:
    - What are the requierd skills for those top paying jobs?
*/

WITH top_paying_jobs AS(
    SELECT 
        jobs.job_id,
        jobs.job_title,
        company.name AS company,
        jobs.salary_year_avg
        
    FROM job_postings_fact AS jobs
    LEFT JOIN  company_dim AS company
        ON jobs.company_id = company.company_id
    WHERE 
        jobs.job_title_short = 'Machine Learning Engineer' AND
        jobs.job_location = 'Anywhere' AND
        jobs.salary_year_avg IS NOT NULL
    ORDER BY
        jobs.salary_year_avg DESC
    LIMIT 20
)   

SELECT 
    skills_dim.skills,
    COUNT(top_paying_jobs.job_id) AS count
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY
    skills_dim.skills
ORDER BY
    count DESC
/*
Python: This is the most essential skill, with 17 mentions.
AWS: Amazon Web Services (AWS) is a leading cloud computing platform, and knowledge of AWS services is valuable for deploying and managing machine learning models in the cloud. It's mentioned 9 times.
SQL: Structured Query Language (SQL) is essential for working with relational databases, which are often used to store and retrieve data for machine learning projects. It's mentioned 7 times.
*/
