/*
Question 1:
    - What are the 10 most paying jobs for Machine Learning Engineer
    - Focus on jobs that has mentioned the salary (remove nulls)
    - Highliht the top paying job to find out why they are highly paid
*/

SELECT 
    jobs.job_id,
    jobs.job_title,
    company.name AS company,
    jobs.job_location,
    jobs.job_schedule_type,
    jobs.salary_year_avg,
    jobs.job_posted_date
    
FROM job_postings_fact AS jobs
LEFT JOIN  company_dim AS company
    ON jobs.company_id = company.company_id
WHERE 
    jobs.job_title_short = 'Machine Learning Engineer' AND
    jobs.salary_year_avg IS NOT NULL
ORDER BY
    jobs.salary_year_avg DESC
LIMIT 5