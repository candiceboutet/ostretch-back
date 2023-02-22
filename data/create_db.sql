BEGIN;

CREATE DOMAIN "email" AS text CHECK (
    value ~ '^[a-zA-Z0-9.!#$%&''*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$'
);

DROP TABLE IF EXISTS "user", 
"stretch", 
"role", 
"category",
"user_stretch";

CREATE TABLE "role" (
        "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
        "name" VARCHAR(12)
    );


CREATE TABLE "user" (
        "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
        "email" email NOT NULL UNIQUE,
        "password" VARCHAR NOT NULL,
        "username" VARCHAR(15) NOT NULL,
        "biography" VARCHAR(255) DEFAULT NULL,
        "role_id" INTEGER NOT NULL REFERENCES "role"("id")
    );

CREATE TABLE "category" (
        "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
        "name" VARCHAR(255) NOT NULL
    );


CREATE TABLE "stretch" (
        "id" INTEGER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
        "title" VARCHAR(255) NOT NULL NOT NULL,
        "description_content" TEXT NOT NULL,
        "main_image" VARCHAR DEFAULT NULL,
        "description_image" VARCHAR DEFAULT NULL,
        "category_id" INTEGER REFERENCES "category"("id")
    );

CREATE TABLE "user_stretch" (
        "user_id" INTEGER NOT NULL REFERENCES "user"("id"),
        "stretch_id" INTEGER NOT NULL REFERENCES "stretch"("id"),
        UNIQUE ("user_id", "stretch_id")
    );


COMMIT;
