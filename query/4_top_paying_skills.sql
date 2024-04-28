/*
Question 4:
    - What are the skills that are demanded for high paying roles? 
*/


SELECT
    skill.skills,
    COUNT(jobs.job_id) AS num_jobs,
    ROUND(AVG(jobs.salary_year_avg)) AS avg_pay
FROM job_postings_fact AS jobs
INNER JOIN skills_job_dim AS skill_job
    ON skill_job.job_id = jobs.job_id
INNER JOIN skills_dim AS skill
    ON skill_job.skill_id = skill.skill_id
WHERE
    jobs.job_title_short = 'Machine Learning Engineer' AND
    jobs.salary_year_avg IS NOT NULL
GROUP BY skill.skills 
ORDER BY avg_pay DESC
LIMIT 25
