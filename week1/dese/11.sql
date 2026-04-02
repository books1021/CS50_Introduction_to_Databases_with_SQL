-- 1st combine 3 tables
-- then sort by expenditure, then by name
SELECT "name", "per_pupil_expenditure", "graduated"
FROM 
    (SELECT * FROM "expenditures"
    JOIN 
    "schools" ON "schools"."district_id" = "expenditures"."district_id"
    JOIN 
    "graduation_Rates" ON "schools"."id" = "graduation_rates"."school_id"
    )
ORDER BY "per_pupil_expenditure" DESC, "name" ASC
;
