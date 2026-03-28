
-- *** The Lost Letter ***

-- find the package id by sender address, check the scan history for last drop of point, convert address_id to address
SELECT "address" FROM "addresses" 
WHERE id = (
    SELECT "address_id" FROM "scans" 
    WHERE "package_id" = (
        SELECT "id" FROM "packages" 
        WHERE "from_address_id" =(
            SELECT "id" FROM "addresses" WHERE "address" = "900 Somerville Avenue"
            ) 
        )
    AND "action" = "Drop"
    ORDER BY "timestamp" DESC
    LIMIT 1
);

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