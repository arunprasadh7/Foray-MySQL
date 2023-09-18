CREATE DATABASE NEW2;
USE new2;

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    salary DECIMAL(6, 2)
);

INSERT INTO Employees (employee_id, employee_name, salary)
VALUES
    (1, 'Emp one', 500.00),
    (2, 'Emp two', 600.00),
    (3, 'Emp three', 550.00);

SELECT * FROM employees;
UPDATE Employees
SET salary = salary * 10/100;


-- two 
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    total_amount DECIMAL(6, 2)
);

INSERT INTO Orders (order_id, order_date, total_amount)
VALUES
    (1, '2022-12-15', 100.00),
    (2, '2023-01-05', 75.50),
    (3, '2023-02-20', 200.25),
    (4, '2022-11-28', 50.75);
    
DELETE FROM Orders
WHERE order_date < '2023-01-01';

-- three

CREATE TABLE Sales (
    product_id INT,
    sale_date DATE,
    amount DECIMAL(6, 2)
);

INSERT INTO Sales (product_id, sale_date, amount)
VALUES
    (1, '2023-01-05', 100.00),
    (2, '2023-01-05', 75.50),
    (1, '2023-01-06', 50.25),
    (3, '2023-01-06', 200.00),
    (2, '2023-01-07', 125.75);

SELECT * FROM sales ;
SELECT SUM(amount) FROM sales;

-- four

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255)
);

CREATE TABLE Orders1 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

-- Customers
INSERT INTO Customers (customer_id, customer_name)
VALUES
    (1, 'John Doe'),
    (2, 'Jane Smith'),
    (3, 'Bob Johnson'),
    (4, 'Alice Brown');

-- Orders
INSERT INTO Orders1 (order_id, customer_id, order_date, total_amount)
VALUES
    (1, 1, '2023-01-05', 100.00),
    (2, 2, '2023-01-06', 75.50),
    (3, 1, '2023-01-07', 50.25),
    (4, 3, '2023-02-10', 200.00);
    
SELECT * FROM orders1;
SELECT customer_name FROM CUSTOMERS
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders1);

-- five
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255)
);

CREATE TABLE Employees1 (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Departments
INSERT INTO Departments (department_id, department_name)
VALUES
    (1, 'HR'),
    (2, 'Finance'),
    (3, 'Marketing');

-- Employees
INSERT INTO Employees1 (employee_id, employee_name, department_id)
VALUES
    (1, 'John Doe', 1),
    (2, 'Jane Smith', 2),
    (3, 'Bob Johnson', 1),
    (4, 'Alice Brown', 3);
    
select * from employees1;
select * from departments;

select employees1.employee_name, departments.department_id
FROM employees1
JOIN departments ON employees1.department_id = departments.department_id;

-- six
CREATE TABLE students (
student_id INT PRIMARY KEY,
student_name VARCHAR(255),
age INT
);

INSERT INTO students 
VALUES (1, 'Arun', 26);

-- seven
CREATE TABLE Duplicates (
    id INT PRIMARY KEY,
    value VARCHAR(255)
);

INSERT INTO Duplicates (id, value)
VALUES
    (1, 'A'),
    (2, 'B'),
    (3, 'A'),
    (4, 'C'),
    (5, 'B'),
    (6, 'A');
    
select min(id) from duplicates group by value;
DELETE FROM duplicates WHERE id NOT IN (SELECT MIN(id) FROM duplicates GROUP BY value);
DELETE FROM Duplicates
WHERE id NOT IN (
    SELECT MIN(id)
    FROM Duplicates
    GROUP BY value
);
