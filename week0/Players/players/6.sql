    SELECT "first_name", "last_name", "debut" FROM players WHERE "birth_city" = "Pittsburgh" AND "birth_state" = "PA" ORDER BY "debut" DESC, "first_name" ASC,  "last_name" ASC;
    --:( 6.sql produces correct result
    --    expected: "...e\n1871-05-..."
    --    actual:   "...e\n1874-05-..."