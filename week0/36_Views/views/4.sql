-- EXPECT 9
SELECT COUNT("english_title") FROM "views" WHERE "english_title" LIKE "%Eastern Capital%" AND "artist" = "Hiroshige";