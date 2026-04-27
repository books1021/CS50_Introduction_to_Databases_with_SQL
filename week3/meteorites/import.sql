-- sql command to import csv to db, run inside sqlite
-- .import --csv meteorites.csv meteorites_temp
--reset codes
DROP TABLE IF EXISTS "meteorites_temp";
DROP TABLE IF EXISTS "meteorites";

-- create temp table and final table, with constrain.
CREATE TABLE "meteorites_temp" (
    "name" TEXT DEFAULT NULL,
    "id" INTEGER,
    "nametype" TEXT DEFAULT NULL,
    "class" TEXT DEFAULT NULL,
    "mass" REAL DEFAULT NULL,
    "discovery" TEXT DEFAULT NULL,
    "year" REAL DEFAULT NULL,
    "lat" REAL DEFAULT NULL,
    "long" REAL DEFAULT NULL,
    PRIMARY KEY ('id')
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
    PRIMARY KEY ('id')
);

.import --csv --skip 1 meteorites.csv meteorites_temp

--empty value to NULL
UPDATE "meteorites_temp" 
SET "mass" = NULL WHERE "mass" = '';

UPDATE "meteorites_temp"
    SET "year" = NULL
    WHERE "year" = '';

UPDATE "meteorites_temp"
    SET "lat" = NULL
    WHERE "lat" = '';

UPDATE "meteorites_temp"
    SET "long" = NULL
    WHERE "long" = '';

-- round to 0.01
UPDATE "meteorites_temp" 
SET "mass" = ROUND("mass",2);

UPDATE "meteorites_temp"
    SET "lat" = NULL
    WHERE "lat" = ROUND("lat",2);

UPDATE "meteorites_temp"
    SET "long" = NULL
    WHERE "long" = ROUND("long",2);
