SELECT "school_id" FROM "graduation_rates" 
WHERE "graduated" > (SELECT "graduated" FROM "graduation_rates" );