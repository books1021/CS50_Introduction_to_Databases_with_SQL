--find the least pupil district, convert id to name

SELECT "name" FROM 
    (SELECT * FROM "districts"
    JOIN 
    "expenditures" 
    ON "expenditures"."district_id" = "districts"."id")
ORDER BY "pupils" ASC 
LIMIT 1
;