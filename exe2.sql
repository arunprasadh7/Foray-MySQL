create database new1;
use new1;

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    description VARCHAR(250),
    price DECIMAL(5, 2)
);

INSERT INTO Products (product_id, product_name, description, price)
VALUES
    (1, 'Laptop One', 'High-performance laptop', 999.99),
    (2, 'Tablet ', 'Entry-level tablet', 199.99),
    (3, 'Laptop two', 'Ultra-slim laptop', 299.99),
    (4, 'Desktop PC', 'Powerful desktop computer', 799.99),
    (5, 'Laptop three', 'Gaming powerhouse', 499.99);
    
    CREATE INDEX product_name_index ON Products(product_name);
    
    SELECT * FROM products WHERE product_name LIKE 'laptop%';
    
    CREATE VIEW [laptop] AS 
    SELECT *
    FROM products
    WHERE product_name LIKE 'laptop%';

	CREATE VIEW [laptop] AS 
    SELECT *
    FROM products
    WHERE product_name = 'laptop';
    
CREATE VIEW laptop AS 
SELECT *
FROM products
WHERE product_name LIKE 'laptop%';

select * from laptop;

