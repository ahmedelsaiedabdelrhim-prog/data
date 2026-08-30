SELECT top_paying_jobs.job_id,
       top_paying_jobs.job_title,
       top_paying_jobs.salary_year_avg,
       top_paying_jobs.company_name,
       STRING_agg(skills, ' ,')as all_skills
FROM top_paying_jobs
INNER JOIN skills_job_dim on top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY
        top_paying_jobs.job_id,
        top_paying_jobs.job_title,
        top_paying_jobs.salary_year_avg,
        top_paying_jobs.company_name
ORDER BY salary_year_avg DESC