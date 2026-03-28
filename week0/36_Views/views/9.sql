-- expected: "... Suwa, Hok"
SELECT "english_title", "artist" FROM "views" WHERE "brightness" = (select MAX(brightness) FROM "views");
-- subquery 
-- SELECT "english_title", "artist" FROM "views" ORDER BY "brightness" DESC LIMIT 1;
-- ORDER BY method