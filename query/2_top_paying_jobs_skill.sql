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