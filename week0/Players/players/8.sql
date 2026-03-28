SELECT ROUND(AVG("height"), 2) AS "Average Height" , ROUND(AVG("weight"), 2) AS  "Average Weight" FROM "players" WHERE "debut" >= "2000-01-01" AND "weight" NOT NULL AND "height" NOT NULL;
--:( 8.sql produces correct result
--    expected: "217.6, 73...."
--    actual:   "176.0, 70...."