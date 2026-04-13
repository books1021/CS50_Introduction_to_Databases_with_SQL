--intersect/IINER join method, best 10 hit intersect best 10 RBI
-- Best 10 Hit query
SELECT "first_name",
    "last_name"
FROM (
        SELECT "first_name",
            "last_name",
            "salary" / "H" AS "dollars per hit"
        FROM "players"
            JOIN "salaries" ON "players"."id" = "salaries"."player_id"
            JOIN "performances" ON "players"."id" = "performances"."player_id"
        WHERE "performances"."year" = "salaries"."year"
            AND "salaries"."year" = 2001
            AND "H" != 0
        ORDER BY "dollars per hit" ASC,
            "first_name" ASC,
            "last_name" ASC
        LIMIT 10
    )
INTERSECT
-- best 10 RBI query
SELECT "first_name",
    "last_name"
FROM (
        SELECT "first_name",
            "last_name",
            "salary" / "RBI" AS "dollars per RBI"
        FROM "players"
            JOIN "salaries" ON "players"."id" = "salaries"."player_id"
            JOIN "performances" ON "players"."id" = "performances"."player_id"
        WHERE "performances"."year" = "salaries"."year"
            AND "salaries"."year" = 2001
            AND "RBI" != 0
        ORDER BY "dollars per RBI" ASC,
            "first_name" ASC,
            "last_name" ASC
        LIMIT 10
    )
ORDER BY "last_name" ASC
;

-- CTE method
WITH "year_2001" AS (
    SELECT
        "p"."id",
        "p"."first_name",
        "p"."last_name",
        "s"."salary",
        "perf"."H",
        "perf"."RBI"
    FROM "players" AS "p"
    JOIN "salaries" AS "s"
      ON "p"."id" = "s"."player_id"
    JOIN "performances" AS "perf"
      ON "p"."id" = "perf"."player_id"
     AND "perf"."year" = "s"."year"
    WHERE "s"."year" = 2001
),
"top_hit" AS (
    SELECT "id"
    FROM "year_2001"
    WHERE "H" <> 0
    ORDER BY
        "salary" * 1.0 / "H" ASC,
        "first_name" ASC,
        "last_name" ASC,
        "id" ASC
    LIMIT 10
),
"top_rbi" AS (
    SELECT "id"
    FROM "year_2001"
    WHERE "RBI" <> 0
    ORDER BY
        "salary" * 1.0 / "RBI" ASC,
        "first_name" ASC,
        "last_name" ASC,
        "id" ASC
    LIMIT 10
),
"both_top10" AS (
    SELECT "id" FROM "top_hit"
    INTERSECT
    SELECT "id" FROM "top_rbi"
)
SELECT
    "p"."first_name",
    "p"."last_name"
FROM "players" AS "p"
JOIN "both_top10" AS "b"
  ON "p"."id" = "b"."id"
ORDER BY
    "p"."last_name" ASC,
    "p"."first_name" ASC,
    "p"."id" ASC;


--  query value of best 10th hit and best 10th RBI
-- then use it to query names
SELECT "first_name",
    "last_name" --,"salary"/"H" AS "dollars per hit"
FROM "players"
    JOIN "salaries" ON "players"."id" = "salaries"."player_id"
    JOIN "performances" ON "players"."id" = "performances"."player_id"
WHERE "performances"."year" = "salaries"."year"
    AND "salaries"."year" = 2001
    AND "H" != 0
    AND "salary" / "H" <= (
        SELECT MIN("salary" / "H")
        FROM "players"
            JOIN "salaries" ON "players"."id" = "salaries"."player_id"
            JOIN "performances" ON "players"."id" = "performances"."player_id"
        WHERE "performances"."year" = "salaries"."year"
            AND "salaries"."year" = 2001
            AND "H" != 0
        LIMIT 1 OFFSET 9
    )
    AND "salary" / "RBI" <= (
        SELECT min("salary" / "RBI")
        FROM "players"
            JOIN "salaries" ON "players"."id" = "salaries"."player_id"
            JOIN "performances" ON "players"."id" = "performances"."player_id"
        WHERE "performances"."year" = "salaries"."year"
            AND "salaries"."year" = 2001
            AND "RBI" != 0
        LIMIT 1 OFFSET 9
    )
ORDER BY "dollars per hit" ASC,
    "first_name" ASC,
    "last_name" ASC
LIMIT 10;
--query for best dollar per hit
SELECT "salary" / "H" AS "dollars per hit"
FROM "players"
    JOIN "salaries" ON "players"."id" = "salaries"."player_id"
    JOIN "performances" ON "players"."id" = "performances"."player_id"
WHERE "performances"."year" = "salaries"."year"
    AND "salaries"."year" = 2001
    AND "H" != 0
ORDER BY "dollars per hit" ASC,
    "first_name" ASC,
    "last_name" ASC
LIMIT 1 OFFSET 9;
--query for best RBI
SELECT "salary" / "RBI" AS "dollars per RBI"
FROM "players"
    JOIN "salaries" ON "players"."id" = "salaries"."player_id"
    JOIN "performances" ON "players"."id" = "performances"."player_id"
WHERE "performances"."year" = "salaries"."year"
    AND "salaries"."year" = 2001
    AND "RBI" != 0
ORDER BY "dollars per RBI" ASC,
    "first_name" ASC,
    "last_name" ASC
LIMIT 1 OFFSET 9;