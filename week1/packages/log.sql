
-- *** The Lost Letter ***

-- find the package id by sender address, check the scan history for last drop of point, convert address_id to address

-- correct output by chance, issue : mulitple package from same address, need to find the letter one
-- has to be 2 query

-- finding packages id for letter, which is 384 
SELECT "addresses"."id", "addresses"."address", "packages"."id","packages"."contents", "scans"."address_id","scans"."action", "scans"."timestamp"
FROM "addresses"
    JOIN "packages" 
        ON "packages"."from_address_id" = "addresses"."id"
    JOIN "scans"
        ON "scans"."package_id" = "packages"."id" 
WHERE "address" = "900 Somerville Avenue"
ORDER BY "packages"."id" DESC
;


-- using packages id for letter, which is 384
SELECT "addresses"."address", "addresses"."type"
FROM "scans"
    JOIN "addresses" 
        ON "scans"."address_id" = "addresses"."id"
WHERE "scans"."package_id" = 384
AND "action" = "Drop"
ORDER BY "timestamp" DESC
LIMIT 1;

-- Old codes
-- SELECT "address" FROM "addresses" 
-- WHERE id = (
--     SELECT "address_id" FROM "scans" 
--     WHERE "package_id" = (
--         SELECT "id" FROM "packages" 
--         WHERE "from_address_id" =(
--             SELECT "id" FROM "addresses" WHERE "address" = "900 Somerville Avenue"
--             ) 
--         )
--     AND "action" = "Drop"
--     ORDER BY "timestamp" DESC
--     LIMIT 1
-- );

-- also look for the address type
SELECT "type" FROM "addresses" 
WHERE id = (
    SELECT "address_id" FROM "scans" 
    WHERE
    "package_id" = (SELECT "id" FROM "addresses" WHERE "address" = "900 Somerville Avenue") 
    AND "action" = "Drop"
    ORDER BY "timestamp" DESC
    LIMIT 1
);

-- *** The Devious Delivery ***

--adress type
--check the scan history for last drop of point, convert address_id to type of address
-- find parcel with no sending address
SELECT "type" FROM "addresses"
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" IS NULL
        )
    AND "action" = "Drop"
    ORDER BY "timestamp" DESC
    LIMIT 1
);

--content of the parcel
SELECT "contents" FROM "packages"
WHERE "from_address_id" IS NULL;


-- *** The Forgotten Gift ***
-- find the last driver who pick up the parcel
-- find the parcel id
SELECT "name" FROM "drivers" 
WHERE "id" = (
    SELECT "driver_id" FROM "scans"
    WHERE "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" = "109 Tileston Street"
            )
        )
    AND "action" = "Pick" 
    ORDER BY "timestamp" DESC
    LIMIT 1
);

-- content of parcel
SELECT "contents" FROM "packages" 
WHERE "from_address_id" = (
    SELECT "id" FROM "addresses" WHERE "address" = "109 Tileston Street"
    )
;