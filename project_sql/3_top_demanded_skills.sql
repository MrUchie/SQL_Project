/*
Question 3 : most in demand skills required for Data Analysts?
- Join job postings to inner join table
- Find the top 5 in demand skills for Data Analysts
- Look through all job postings
- Why? It finds the most in demand skills in the job market

*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact  
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = True
GROUP BY 
    skills
ORDER BY
    demand_count DESC
LIMIT 5