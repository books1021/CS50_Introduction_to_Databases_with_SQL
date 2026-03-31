--1st select Cambridge district id
--then select all school with given district id 
SELECT "name" FROM "schools"
WHERE "district_id" = (
    SELECT "id" FROM "districts" WHERE "name" = "Cambridge")
;