UPDATE "users"
SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = "admin";
DELETE FROM "user_logs"
WHERE "old_username" = 'admin' AND "new_password" = '982c0381c279d139fd221fce974916e7';
INSERT INTO "user_logs" ("type", "old_username", "new_username", "old_password", "new_password")
SELECT 'update', 'admin', 'admin', '2136622ffb4269f1fdb6264266b4711b', (
    SELECT "password"
    FROM "users"
    WHERE "username" = 'emily33'
);
