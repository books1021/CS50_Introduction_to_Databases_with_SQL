SELECT "name" FROM "players"
LEFT JOIN "performances" on "players"."id" = "performances"."player_id"
LEFT JOIN "teams" on "performances"."team_id" =  "teams"."id"
WHERE "first_name" = "Satchel" AND "last_name" = "Paige";