CREATE TABLE [users](
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT,
    "password" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE [schools](
    "id" INTEGER,
    "school_name" TEXT,
    "school_type" TEXT,
    "location" TEXT,
    "foundation_year" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE [companies](
    "id" INTEGER,
    "company_name" TEXT,
    "company_industry" TEXT,
    "location" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE [user_connection](
    "user_id" INTEGER,
    "user_id_following" INTEGER,
    FOREIGN KEY ("user_id") REFERENCES "users"("id"),
    FOREIGN KEY ("user_id_following") REFERENCES "users"("id")
);

CREATE TABLE[school_connection](
    "id" INTEGER,
    "user_id" INTEGER,
    "school_id" INTEGER,
    "school_entry_date" INTEGER,
    "graduation_date" INTEGER,
    "degree_and_title" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id"),
    FOREIGN KEY ("school_id") REFERENCES "school"("id")
);

CREATE TABLE [job_record](
    "id" INTEGER,
    "user_id" INTEGER,
    "company_id" INTEGER,
    "company_entry_date" INTEGER,
    "company_leaving_date" INTEGER,
    "job_title" TEXT,
    PRIMARY KEY("id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id"),
    FOREIGN KEY ("company_id") REFERENCES "company"("id")    
);