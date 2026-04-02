--convert  district_id to district name
SELECT "name", "pupils" FROM 
    (SELECT * FROM "districts"
    JOIN 
    "expenditures" 
    ON "expenditures"."district_id" = "districts"."id")
;

--failed code

-- Parse error: near "SELECT": syntax error
SELECT "name" FROM "districts"
JOIN 
SELECT "pupils" FROM "expenditures" 
ON "expenditures"."district_id" = "districts"."id";

-- ERROR occurs :Parse error: ambiguous column name: id
SELECT "id", "name" FROM "districts"
JOIN 
"expenditures" 
ON "expenditures"."district_id" = "districts"."id";

-- what happened if 2 table have same column name (but different data)?
--also, how to join part of the dataset?
--also, when should I use ()