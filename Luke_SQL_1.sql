Select * from job_postings_fact
Limit 10;

Select * 
FROM company_dim
Limit 10;

SELECT *
from job_postings_fact
where job_no_degree_mention = true
Limit 10;

Select * from company_dim Limit 10;

SELECT 
name as company_name,
company_id
FROM company_dim
Where company_id IN (
    SELECT
        company_id
    FROM 
        job_postings_fact
    WHERE 
        job_no_degree_mention = true
    Order by company_id ASC
);

Select *
From company_dim
Limit 10;

Select *
From job_postings_fact
-- where company_id=3
limit 100;

-- on veut les entreprises qui ont le + de job openings

WITH nb_poste AS 
(
    SELECT
company_id,
COUNT(*) as nb
from job_postings_fact
GROUP BY company_id
)
Select 
nb,
company_dim.name
from nb_poste
LEFT JOIN company_dim ON nb_poste.company_id = company_dim.company_id
ORDER BY nb DESC;

-- exo : trouver le nb de remote job postings per skill
-- on affichera le top 5 
-- on affichera : skillid, name, et le count de posts requis sur ce skill

Select 
COUNT(*) as nb_posts,
-- skills_job_dim.skill_id,
skills_dim.skills
From job_postings_fact
Inner JOIN skills_job_dim ON skills_job_dim.job_id =  job_postings_fact.job_id 
Inner JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
where job_work_from_home = TRUE
GROUP BY skills_dim.skills
ORDER BY nb_posts DESC
LIMIT 10;

Select 
skills_job_dim.skill_id,
skills_dim.skills,
skills_job_dim.job_id
From job_postings_fact
Inner JOIN skills_job_dim ON skills_job_dim.job_id =  job_postings_fact.job_id 
Inner JOIN skills_dim ON skills_dim.skill_id = skills_job_dim.skill_id
LIMIT 10;







