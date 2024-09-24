--task1
CREATE DATABASE lab2;

--task2
CREATE TABLE countries(
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(255),
    region_id INTEGER,
    population INTEGER
    );

--task3
INSERT INTO countries(country_name, region_id, population)
VALUES ('Kazakhstan', 3, 20650029);

--task4
INSERT INTO countries (country_id, country_name)
VALUES (2, 'Switzerland');

--task5
INSERT INTO countries (country_name, region_id, population)
VALUES ('Italy', NULL, 59342867);

--task6
INSERT INTO countries (country_name, region_id, population)
VALUES
    ('Spain', 4, 83000000),
    ('China', 5, 25000000),
    ('Australia', 6, 1390000000);

--task7
ALTER TABLE countries
ALTER COLUMN country_name SET DEFAULT 'Kazakhstan';

--task8
INSERT INTO countries(region_id, population)
VALUES (7, 2000000);

--task9
INSERT INTO countries(country_name, region_id, population)
VALUES (DEFAULT, DEFAULT, DEFAULT);

--task10
CREATE TABLE countries_new (LIKE countries INCLUDING ALL);

--task11
INSERT INTO countries_new (country_name, region_id, population)
SELECT country_name, region_id, population
FROM countries;

--task12
UPDATE countries
SET region_id = 1
WHERE region_id IS NULL;

--task13
SELECT
    country_name,
    population * 1.10 AS "New Population"
FROM
    countries;

--task14
DELETE FROM countries
WHERE population < 100000;

--task15
WITH deleted_rows AS (
    DELETE FROM countries_new
    WHERE country_id IN (SELECT country_id FROM countries)
    RETURNING *
)
SELECT * FROM deleted_rows;

--task16
WITH deleted_rows AS (
    DELETE FROM countries
    RETURNING *
)
SELECT * FROM deleted_rows;

