SELECT "name", SUM("H") as "total hits"
FROM "performances" 
JOIN "teams" ON "performances"."team_id" = "teams"."id"
where "performances"."year" = 2001
GROUP BY "team_id"
--HAVING "year" = 2001 --ambiguous column name: year , 2 columns with the name "year"
--HAVING "performances"."year" = 2001 --NO OUTPUT?????
ORDER BY "total hits" desc
LIMIT 5
;