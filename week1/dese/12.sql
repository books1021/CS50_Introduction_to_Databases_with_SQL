SELECT "name", "per_pupil_expenditure", "exemplary"
FROM (
    SELECT * FROM "expenditures"
    INNER JOIN "districts" ON "expenditures"."district_id" = "districts"."id"
    INNER JOIN "staff_evaluations" ON "staff_evaluations"."district_id" = "districts"."id"
)
WHERE "per_pupil_expenditure" > (SELECT AVG("per_pupil_expenditure") FROM "expenditures")
AND "exemplary" > (SELECT AVG("exemplary") FROM "staff_evaluations")
AND "type" = "Public School District"
ORDER BY "exemplary" DESC, "per_pupil_expenditure" DESC
;