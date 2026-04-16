CREATE TABLE [passengers](
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "age" Real,
    PRIMARY KEY("id")
);

--"concourses_A" : operating in concourses_A or not
CREATE TABLE [airline](
    "id" INTEGER,
    "name" TEXT,
    "concourses_A" INTEGER,
    "concourses_B" INTEGER,
    "concourses_C" INTEGER,
    "concourses_D" INTEGER,
    "concourses_E" INTEGER,
    "concourses_F" INTEGER,
    "concourses_T" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE [flights](
    "id" INTEGER,
    "flight_number" TEXT,
    "departure_airport_code" TEXT,
    "designation_airport_code" TEXT,
    "expected_departure_datetime" TEXT,
    "expected_arrival_datetime" TEXT,
    "airline_id" INTEGER,
    FOREIGN KEY("airline_id") REFERENCES "airline"("id"),
    PRIMARY KEY("id")
);

CREATE TABLE [check_in](
    "id" INTEGER,
    "passenger_id" INTEGER,
    "datetime" TEXT,
    "flight_id" INTEGER,
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);
