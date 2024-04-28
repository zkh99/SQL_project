/*
Question 2:
    - What are the most in-demand skills for Machine Learning Engineer role
*/


SELECT
    skill.skills,
    COUNT(jobs.job_id) AS num_jobs
FROM job_postings_fact AS jobs
INNER JOIN skills_job_dim AS skill_job
    ON skill_job.job_id = jobs.job_id
INNER JOIN skills_dim AS skill
    ON skill_job.skill_id = skill.skill_id
WHERE
    jobs.job_title_short = 'Machine Learning Engineer'
GROUP BY skill.skills
ORDER BY num_jobs DESC


/*
for machine learning engineer these are top demanded skills in order:
python:	9685
pytorch:	4389
tensorflow:	4307
aws:	3780
sql:	3497
*/