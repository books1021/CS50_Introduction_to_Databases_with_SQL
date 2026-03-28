-- need fix expected: "#a6a799\n#8..."
SELECT AVG(hex(ltrim(average_color, '#'))) FROM "views" WHERE "english_title" LIKE "%river%";
-- CHANGE type from text to numeric
--AVG()
--ltrim()