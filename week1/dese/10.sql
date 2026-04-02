--find top 10 public school district with most per pupil expenditure

SELECT "name", "per_pupil_expenditure"
FROM (
    SELECT * FROM "districts"
    JOIN 
    "expenditures" 
    ON "expenditures"."district_id" = "districts"."id"
    WHERE "type" = "Public School District"
    )
ORDER BY "per_pupil_expenditure" DESC
LIMIT 10
;