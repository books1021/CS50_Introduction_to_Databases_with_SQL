-- sql command to import csv to db, run inside sqlite
-- .import --csv meteorites.csv meteorites_temp

-- create temp table and final table, with constrain.
CREATE TABLE "meteorites_temp" (
    "id" INTEGER,
    "name" TEXT DEFAULT NULL,
    "class" TEXT DEFAULT NULL,
    "mass" REAL DEFAULT NULL,
    "discovery" TEXT DEFAULT NULL,
    "year" REAL DEFAULT NULL,
    "lat" REAL DEFAULT NULL,
    "long" REAL DEFAULT NULL,
);

CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT DEFAULT NULL,
    "class" TEXT DEFAULT NULL,
    "mass" REAL DEFAULT NULL,
    "discovery" TEXT DEFAULT NULL,
    "year" REAL DEFAULT NULL,
    "lat" REAL DEFAULT NULL,
    "long" REAL DEFAULT NULL,
);

.import --csv meteorites.csv meteorites_temp