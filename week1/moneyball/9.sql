SELECT "name",
    ROUND(AVG("salary"), 2) AS "average salary"
FROM "salaries"
    JOIN "teams" ON "teams"."id" = "salaries"."team_id"
GROUP BY "salaries"."team_id" -- order by not working????
ORDER BY (
        SELECT ROUND(AVG("salary"), 2)
        FROM "salaries"
        GROUP BY "salaries"."team_id"
    ) ASC;
-- new codes
select "teams"."name",
    ROUND(AVG(salary),2) AS "average salary"
from salaries
JOIN "teams" ON "teams"."id" = "salaries"."team_id"
WHERE "salaries"."year" = 2001
group by "salaries"."team_id"
order by AVG(salary)
limit 5;