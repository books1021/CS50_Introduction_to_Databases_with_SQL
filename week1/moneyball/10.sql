SELECT "first_name", "last_name", "salary", "performances"."year" AS "year" , "HR"
FROM "performances"
JOIN "players" ON "players"."id" = "performances"."player_id"
JOIN "salaries" ON "players"."id" = "salaries"."player_id"
WHERE "performances"."year" = "salaries"."year"
ORDER BY "players"."id" ASC, "year" DESC, "HR" DESC, "salary" DESC
;