# SQL Project
## Introduction
This project inspects job postings for various data-oriented roles, with an emphasis on the position of Machine Learning Engineer. Through this analysis, we aim to check the highest-paying roles and identify the most sought-after skills.

Check the codes: [Query folder](https://github.com/zkh99/sql_project/tree/main/query)

## Background
In this project, we're looking at five main questions using the dataset mentioned earlier:

- What jobs pay the most?
- What skills do you need for these high-paying jobs?
- What skills are most wanted by employers?
- Which skills get the highest salaries?
- What skills give a good balance of pay and reasonable demand?

## Tools I used
The primary tools utilized in this project include:
- **SQL:** This project extensively utilizes SQL queries to extract relevant insights from the dataset.

- **VS Code:** For writing and managing code, I employed VS Code, a user-friendly and efficient IDE.

- **Postgras:**  To organize and interact with my dataset, as well as to establish a connection with VS Code, I utilized Postgres, a powerful open-source relational database management system.
## The Analysis
Here are the answer I found for my questions:
### 1- top paying jobs
To identify the highest-paying jobs, I sorted the positions based on their average yearly salary. Specifically, I focused on roles with the abbreviated title **Machine Learning Engineering**. Below is the SQL code used for this analysis:

```sql
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
LIMIT 25
```
The results showed that among the top 25 highest-paying jobs meeting these criteria, salaries ranged from $225k to $325k per year. Notably, eight of these top-paying positions offered remote work opportunities, indicating significant earning potential in the field of machine learning, even in remote roles.

### 2- skills of top paying jobs
I checked out the top 100 jobs in Machine Learning Engineering and figured out what skills they all needed. Check out the chart below to see the most mentioned skills:
- Python
- AWS (Amazon Web Services)
- PyTorch
- SQL
- TensorFlow

These were the top five skills that kept popping up, showing how important they are for high-paying jobs in Machine Learning Engineering.

![Skills for top paying jobs](https://github.com/zkh99/sql_project/blob/main/assets/2-skills.png)

### 3- most in demand skills 
By analyzing the original data, I discovered that each job post listed the required skills. Using this information and joining the job posting tables with the skills table, I identified the most frequently mentioned skills for Machine Learning Engineering positions. Check out the chart below for the results:
![Most In-demand skills](https://github.com/zkh99/sql_project/blob/main/assets/3-most_demanded_skills.png)
*It should be mentioned that overall there were 14,106 jobs posted with short title of Machine Learning Engineer. Again Python is in the top at the list.

### 4- top paying skills
Similar to the question 1, in this part I checked the top paying skills for Machine Learning Engineer postion and the results have been showed in the table:

| Skill      | Number of jobs | Average salary |
|--------------|----------|---------|
| haskell      | 1        | 213000  |
| chef         | 2        | 207050  |
| sheets       | 1        | 195000  |
| spreadsheet  | 1        | 190000  |
| kotlin       | 2        | 184500  |
*It can be seen that although these jobs are high paying but the low number of demand makes them not sutable for investment and learning.*

### 5- optimal skills
As we found out in the previous part, those high paying jobs didn't have enough demand to be attractive enough, therefore in the last part I checked tha high paying skills with atleast 15 demands and the result are:
| Skill  | Number of jobs| Average salary |
|-------------|------------|---------|
| excel       | 24         | 159622  |
| scala       | 40         | 157451  |
| airflow     | 54         | 144821  |
| bigquery    | 16         | 143461  |
| c           | 19         | 142345  |
| hadoop      | 40         | 139614  |
| spark       | 113        | 138904  |
| snowflake   | 15         | 137981  |
| java        | 106        | 137184  |
| sql         | 112        | 136859  |

*Here we can see that skills like sql, spark or java  might be more attractive for people who want to start working in this field.*

## What I learned
Through this project, I gained valuable experience in executing basic SQL queries and had the chance to apply them to a sizable database, providing insights into various job postings within the data field. Moreover, I discovered that SQL, Python, and Excel are essential skills for individuals aspiring to enter the Machine Learning Engineering field.
