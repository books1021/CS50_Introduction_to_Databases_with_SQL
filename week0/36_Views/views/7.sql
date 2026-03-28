-- expected: "The Sea of..."
SELECT "english_title" FROM "views" WHERE "artist" = "Hiroshige" ORDER BY "brightness" DESC LIMIT 5;