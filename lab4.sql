--task1
CREATE DATABASE lab4;

--task2
CREATE TABLE warehouses (
    code INTEGER PRIMARY KEY,
    location VARCHAR(255) NOT NULL,
    capacity INTEGER
);

CREATE TABLE boxes (
    code CHAR(4) PRIMARY KEY,
    contents VARCHAR(255) NOT NULL,
    value REAL,
    warehouse INTEGER,
    FOREIGN KEY (warehouse) REFERENCES warehouses(code)
);

--task3
INSERT INTO warehouses(code, location, capacity)
VALUES (1, 'Chicago', 3),
       (2, 'Chicago', 4),
       (3, 'New York', 7),
       (4, 'Los Angeles', 2),
       (5, 'San Francisco', 8);

INSERT INTO Boxes (code, contents, value, warehouse)
VALUES
('0MN7', 'Rocks', 180, 3),
('4H8P', 'Rocks', 250, 1),
('4RT3', 'Scissors', 190, 4),
('7G3H', 'Rocks', 200, 1),
('8JN6', 'Papers', 75, 1),
('8Y6U', 'Papers', 50, 3),
('9J6F', 'Papers', 175, 2),
('LL08', 'Rocks', 140, 4),
('P0H6', 'Scissors', 125, 1),
('P2T6', 'Scissors', 150, 2),
('TU55', 'Papers', 90, 5);

--task4
SELECT * FROM warehouses;

--task5
SELECT * FROM boxes
WHERE value>150;

--task6
SELECT DISTINCT contents
FROM boxes;

--task7
SELECT Warehouse, COUNT(*)
FROM Boxes
GROUP BY Warehouse;

--task8
SELECT Warehouse, COUNT(*)
FROM Boxes
GROUP BY Warehouse
HAVING COUNT(*) > 2;

--task9
INSERT INTO Warehouses VALUES (6, 'New York', 3);

--task10
INSERT INTO Boxes VALUES('H5RT', 'Papers', 200, 2);

--task11
UPDATE Boxes
SET Value = Value * 0.85
WHERE code = (
    SELECT code
    FROM boxes
    ORDER BY Value DESC
    LIMIT 1 OFFSET 2
    );

--task12
DELETE FROM boxes
WHERE VALUE > 150;

--task13
DELETE FROM boxes
WHERE warehouse IN (
    SELECT code FROM warehouses
    WHERE location = 'New York'
    )
RETURNING*;
