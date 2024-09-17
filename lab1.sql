--Task 1
CREATE DATABASE lab1;

--Task2
CREATE TABLE users (
    id bigserial primary key,
    firstname varchar(100),
    lastname varchar(100)
    )

--Task3
ALTER TABLE users
ADD COLUMN isadmin INTEGER;

--Task4
ALTER TABLE users
ALTER COLUMN isadmin TYPE BOOLEAN
USING CASE
    WHEN isadmin = 0 THEN false
    WHEN isadmin = 1 THEN true
END;

--Task5
ALTER TABLE users
ALTER COLUMN isadmin SET DEFAULT false;

ALTER TABLE users
DROP CONSTRAINT IF EXISTS users_pkey;

--Task6
ALTER TABLE users
ADD CONSTRAINT pk_users_id PRIMARY KEY (id);

--Task7
CREATE TABLE tasks (
    id bigserial primary key,
    name varchar(50),
    user_id int
)

--Task8
DROP TABLE tasks;

--Task9
DROP DATABASE lab1;
