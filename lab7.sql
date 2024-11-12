CREATE DATABASE lab7;

CREATE TABLE countries(
	country_id SERIAL,
	country_name VARCHAR(50)
);

INSERT INTO countries(country_name)
VALUES ('Uzbekistan'), ('Turkey'), ('Kazakhstan'), ('China');

SELECT * FROM countries;

CREATE TABLE departments(
	department_id SERIAL PRIMARY KEY,
	department_name VARCHAR(50),
	budget INTEGER
);

INSERT INTO departments(department_name, budget)
VALUES ('Finance', 4000),
('Human Resources', 2000),
('Sales', 6000);

SELECT * FROM departments;

CREATE TABLE employees(
	employee_id SERIAL,
	employee_name VARCHAR(50),
	employee_surname VARCHAR(50),
	employee_salary INTEGER,
	department_id INTEGER REFERENCES departments
);

INSERT INTO employees(employee_name, employee_surname, employee_salary, department_id)
VALUES ('Arman', 'Duisenov', 5000, 1),
       ('Aruzhan', 'Tleukulova', 7000, 2),
       ('Aknur', 'Tolymbek', 6000, 3);

SELECT * FROM employees;

--task1
CREATE INDEX index_country_name ON countries(country_name);

--task2
CREATE INDEX index_employee_full_name ON employees(employee_name, employee_surname);

--task3
CREATE INDEX index_employees_salary ON employees(employee_salary);

--task4
CREATE INDEX employees_sub_name ON employees(SUBSTRING(employee_name from 1 for 4 ));

--task5
CREATE INDEX index_depts_budg_salary ON employees(department_id, employee_salary);
CREATE INDEX index_depts_budg ON departments(budget);
