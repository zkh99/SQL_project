/*
Question 5:
    - What are the skills that are both demanded and with high salary?
*/

SELECT
    skill.skills,
    COUNT(jobs.job_id) AS num_demand,
    ROUND(AVG(jobs.salary_year_avg)) AS avg_pay
FROM job_postings_fact AS jobs
INNER JOIN skills_job_dim AS dim ON dim.job_id = jobs.job_id
INNER JOIN skills_dim AS skill ON skill.skill_id = dim.skill_id
WHERE
    jobs.job_title_short = 'Machine Learning Engineer' AND
    jobs.salary_year_avg IS NOT NULL
GROUP BY 
    skill.skills
HAVING
    COUNT(jobs.job_id) >= 15
ORDER BY
    avg_pay DESC,
    num_demand DESC
LIMIT 35


/*
"skills","num_demand","avg_pay"
"excel","24","159622"
"scala","40","157451"
"airflow","54","144821"
"bigquery","16","143461"
"c","19","142345"
*/