--task1
CREATE DATABASE lab6;

--task2
CREATE TABLE locations(
    location_id SERIAL PRIMARY KEY,
    street_address VARCHAR(25),
    postal_code VARCHAR(12),
    city VARCHAR(30),
    state_province VARCHAR(12)
);

CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE,
    budget INTEGER,
    location_id INTEGER REFERENCES locations
);

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(20),
    salary INTEGER,
    department_id INTEGER REFERENCES departments
);

--We insert data for our queries; Insert data into locations table
INSERT INTO locations (street_address, postal_code, city, state_province)
VALUES
    ('123 Maple St', '12345', 'New York', 'NY'),
    ('456 Oak Ave', '67890', 'Los Angeles', 'CA'),
    ('789 Pine Rd', '11223', 'Chicago', 'IL'),
    ('101 Birch Blvd', '33445', 'Houston', 'TX');

-- Insert data into departments table
INSERT INTO departments (department_name, budget, location_id)
VALUES
    ('Human Resources', 500000, 1),
    ('Engineering', 1200000, 2),
    ('Sales', 800000, 3),
    ('Marketing', 600000, 4);

-- Insert data into employees table
INSERT INTO employees (first_name, last_name, email, phone_number, salary, department_id)
VALUES
    ('John', 'Doe', 'john.doe@example.com', '555-1234', 70000, 1),
    ('Jane', 'Smith', 'jane.smith@example.com', '555-5678', 95000, 2),
    ('Alice', 'Johnson', 'alice.johnson@example.com', '555-8765', 85000, 3),
    ('Bob', 'Brown', 'bob.brown@example.com', '555-4321', 78000, 4);

--task4
SELECT first_name, last_name, employees.department_id, department_name
FROM employees
JOIN departments ON employees.department_id = departments.department_id;

--task4
SELECT first_name, last_name, employees.department_id, department_name
FROM employees
JOIN departments ON employees.department_id = departments.department_id
WHERE employees.department_id BETWEEN 40 AND 80;

--task5
SELECT first_name, last_name, department_name, city, state_province
FROM employees
JOIN departments ON employees.department_id = departments.department_id
JOIN locations  ON departments.location_id = locations.location_id;

--task6
SELECT department_name
FROM departments
LEFT JOIN employees ON departments.department_id = employees.department_id
WHERE employees.department_id IS NULL;

--task7
SELECT first_name, last_name, employees.department_id, department_name
FROM employees
JOIN departments ON employees.department_id = departments.department_id
