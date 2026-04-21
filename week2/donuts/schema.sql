CREATE TABLE [donuts](
    "id" INTEGER,
    "product_name" TEXT NOT NULL UNIQUE,
    "contain_gluten" INTEGER,
    "price" REAL NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE [ingredients](
    "id" INTEGER,
    "product_id" INTEGER NOT NULL UNIQUE,
    "recipe" TEXT NOT NULL,
    "price per unit of ingredient" REAL NOT NULL,
    FOREIGN KEY ("product_id") REFERENCES "donuts"("id"),
    PRIMARY KEY ("id")
);

CREATE TABLE [orders](
    "id" INTEGER,
    "customer_id" INTEGER,
    "purchase_list" TEXT,
    PRIMARY KEY ("id")
);

CREATE TABLE [customers](
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "orders_id" INTEGER,
    PRIMARY KEY ("id")
);

--need order id in customers, cumstomers in order

-- solution 2
-- orders --> "id", "customer_id"
-- customers --> "id", "name"
-- orders_item --> "order_id", "donuts", "quantity"

