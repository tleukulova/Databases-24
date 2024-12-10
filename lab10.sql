CREATE DATABASE lab10;

--tables

CREATE TABLE books(
    book_id INT PRIMARY KEY,
    title VARCHAR,
    author VARCHAR,
    price DECIMAL,
    quantity INT
);

CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    book_id INT REFERENCES books,
    customer_id INT,
    order_date DATE,
    quantity INT
);

CREATE TABLE customers(
    customer_id INT PRIMARY KEY,
    name VARCHAR,
    email VARCHAR
);

--sample data

INSERT INTO books (book_id, title, author, price, quantity)
VALUES
    (1, 'Database 101', 'A. Smith', 40.00, 10),
    (2, 'Learn SQL', 'B. Johnson', 35.00, 15),
    (3, 'Advanced DB', 'C. Lee', 50.00, 5);

INSERT INTO Customers (customer_id, name, email)
VALUES
    (101, 'John Doe', 'johndoe@example.com'),
    (102, 'Jane Doe', 'janedoe@example.com');


--task1
BEGIN;

INSERT INTO orders (order_id, customer_id, book_id, quantity, order_date)
VALUES (1, 101, 1, 2, CURRENT_DATE);

UPDATE Books
SET quantity = quantity - 2
WHERE book_id = 1;

COMMIT;

--Expected Outcome: The `Orders` table has a new record, and the `Books` table shows 8
SELECT * FROM orders where order_id = 1;
SELECT * FROM books where book_id = 1;


--task2
BEGIN;

DO $$
DECLARE
    available_quantity INT;
BEGIN
    SELECT quantity INTO available_quantity
    FROM Books
    WHERE book_id = 3;

    IF available_quantity < 10 THEN
        RAISE EXCEPTION 'Not enough stock for book_id 3.';
    END IF;

    INSERT INTO Orders (order_id, customer_id, book_id, quantity, order_date)
    VALUES (2, 102, 3, 10, CURRENT_DATE);

    UPDATE Books
    SET quantity = quantity - 10
    WHERE book_id = 3;

END $$;
COMMIT;


--Expected Outcome: No change in the `Orders` or `Books` tables due to the rollback
select * from books where book_id = 3;

--task3
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE books
SET price = 45.45
WHERE book_id = 1;

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT price FROM books where book_id = 1;

COMMIT;

SELECT price FROM books WHERE book_id = 1;

--task4
BEGIN;
UPDATE customers
SET email = 'abc@gmail.com'
WHERE customer_id = 101;
COMMIT;

SELECT email FROM customers WHERE customer_id = 101;
