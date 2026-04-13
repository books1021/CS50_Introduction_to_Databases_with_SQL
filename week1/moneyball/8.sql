SELECT "salary"
FROM "salaries"
    JOIN "performances" ON "performances"."player_id" = "salaries"."player_id"
    and "performances"."year" = "salaries"."year"
WHERE "performances"."year" = 2001
order by "HR" DESC
limit 1;
