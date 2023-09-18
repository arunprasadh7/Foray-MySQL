CREATE TABLE Products1 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2),
    is_active BOOLEAN
);

INSERT INTO products1 
VALUES (1, 'Laptop One', 'High-performance laptop', 999.99, 1),
    (2, 'Tablet ', 'Entry-level tablet', 199.99,1),
    (3, 'Laptop two', 'Ultra-slim laptop', 299.99,0),
    (4, 'Desktop PC', 'Powerful desktop computer', 799.99,1),
    (5, 'Laptop three', 'Gaming powerhouse', 499.99,1);
    
CREATE VIEW activeproducts AS
SELECT *
FROM products1
WHERE is_active = 1;

SELECT product_name, price 
FROM activeproducts;
