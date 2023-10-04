CREATE DATABASE retail_store;
USE retail_store;


-- Create the categories table
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- Insert sample values into categories table
INSERT INTO categories (category_name) VALUES
    ('Electronics'),
    ('Clothing'),
    ('Books'),
    ('Home and Garden'),
    ('Toys');

-- Create the products table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- Insert sample values into products table
INSERT INTO products (product_name, price, stock_quantity) VALUES
    ('Smartphone', 599.99, 50),
    ('Laptop', 999.99, 30),
    ('T-shirt', 19.99, 100),
    ('Jeans', 49.99, 75),
    ('Book - Fiction', 12.99, 200),
    ('Book - Non-Fiction', 14.99, 150),
    ('Garden Tools Set', 89.99, 20),
    ('Toy Car', 29.99, 50),
    ('Doll', 24.99, 40),
    ('Kitchen Appliances', 199.99, 15);
    
    
-- Create the product_categories table to establish a many-to-many relationship
CREATE TABLE product_categories (
    product_id INT,
    category_id INT,
    PRIMARY KEY (product_id, category_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);


-- Insert sample values into product_categories table to associate products with categories
INSERT INTO product_categories (product_id, category_id) VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 2),
    (5, 3),
    (6, 3),
    (7, 4),
    (8, 5),
    (9, 5),
    (10, 4);
