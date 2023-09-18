CREATE DATABASE NEW;
USE NEW;

CREATE TABLE customers (
customer_id INT PRIMARY KEY,
name VARCHAR(50),
email VARCHAR(100)
);
insert into customers values (1, 'one', 'one@'),(2, 'two','two@'), (3,'three','three@');

CREATE TABLE Orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
total DECIMAL(5,2),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

insert into orders values (1,1,curdate(), 5),(2,2,curdate(), 10),(3,1,curdate(), 15);

DROP TABLE Orders;

SELECT customers.name, COUNT(orders.order_id)
FROM Customers 
LEFT JOIN Orders  ON customers.customer_id = orders.customer_id
GROUP BY customers.name;


-- Create the Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    price DECIMAL(10, 2)
);

-- Insert sample data into the Products table
INSERT INTO Products (product_id, product_name, price)
VALUES
    (1, 'Product A', 10.00),
    (2, 'Product B', 15.50),
    (3, 'Product C', 8.75),
    (4, 'Product D', 12.25);
    
-- Create the OrderDetails table
CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert sample data into the OrderDetails table
INSERT INTO OrderDetails (order_detail_id, order_id, product_id, quantity, subtotal)
VALUES
    (1, 1, 1, 3, 30.00),
    (2, 1, 2, 2, 31.00),
    (3, 2, 1, 1, 10.00),
    (4, 2, 3, 4, 35.00);
	
INSERT INTO OrderDetails (order_detail_id, order_id, product_id, quantity, subtotal)
VALUES (5, 3, 2, 2, 31.00),
       (6, 4, 1, 5, 50.00);


    SELECT products.product_name, SUM(orderdetails.quantity) AS total_quantity, SUM(orderdetails.subtotal)
    FROM products
    INNER JOIN orderdetails ON products.product_id = orderdetails.product_id
    GROUP BY products.product_name
    HAVING total_quantity > 0;
    
    
    -- question 3
    
    -- Create the Employees table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    email VARCHAR(255),
    hire_date DATE
);

-- Insert sample data into the Employees table
INSERT INTO Employees (employee_id, employee_name, email, hire_date)
VALUES
    (1, 'John Doe', 'john@example.com', '2020-01-15'),
    (2, 'Jane Smith', 'jane@example.com', '2019-05-20'),
    (3, 'Alice Johnson', 'alice@example.com', '2021-03-10');
   
-- Create the Departments table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255)
);

-- Insert sample data into the Departments table
INSERT INTO Departments (department_id, department_name)
VALUES
    (1, 'HR'),
    (2, 'Finance'),
    (3, 'IT');
    
-- Create the EmployeeDepartment table
CREATE TABLE EmployeeDepartment (
    employee_id INT,
    department_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Insert sample data into the EmployeeDepartment table
INSERT INTO EmployeeDepartment (employee_id, department_id, start_date, end_date)
VALUES
    (1, 1, '2020-01-15', '2021-12-31'), -- John Doe in HR
    (2, 2, '2019-05-20', '2020-12-31'), -- Jane Smith in Finance
    (1, 3, '2022-01-01', NULL),          -- John Doe in IT (currently)
    (3, 1, '2021-03-10', NULL);          -- Alice Johnson in HR (currently)
    
SELECT employees.employee_name, departments.department_name, employeedepartment.start_date
FROM employees
INNER JOIN employeedepartment ON employees.employee_id = employeedepartment.employee_id
INNER JOIN departments ON employeedepartment.department_id = departments.department_id
WHERE employeedepartment.start_date = ( SELECT MIN(start_date) FROM employeedepartment WHERE employee_id = employees.employee_id);

-- question4

select name 
from customers
left join orders on customers.customer_id = orders.customer_id
where orders.customer_id is null;

