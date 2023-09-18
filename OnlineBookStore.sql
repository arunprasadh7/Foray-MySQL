create database OnlineBookStore;
use OnlineBookStore;

CREATE TABLE Books (
book_id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(250) ,
author VARCHAR(100),
genre VARCHAR(100),
price DECIMAL(5,2),
stock_qty INT
);
desc books;

CREATE TABLE Customers (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
email VARCHAR(100),
address VARCHAR(250)
);
desc customers;

CREATE TABLE Orders (
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
order_date DATETIME,
total_amount DECIMAL(5,2),
FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);


CREATE TABLE OrderDetails (
order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT,
book_id INT,
quantity INT,
subtotal DECIMAL(5,2),
FOREIGN KEY (order_id) REFERENCES Orders(order_id),
FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- inserting sample books into the books table
INSERT INTO Books (title, author, genre, price, stock_qTY)
VALUES  ('Book 1', 'Author A', 'Fiction', 19.99, 100),
		('Book 2', 'Author B', 'Science Fiction', 24.99, 50),
        ('Book 3', 'Author C', 'Mystery', 14.99, 75);
        
-- inserting customers into cx table
INSERT INTO Customers (first_name, last_name, email, address)
VALUES  ('John', 'Doe', 'john.doe@example.com', '123 Main St, City, Country'),
		('Jane', 'Smith', 'jane.smith@example.com', '456 Elm St, Town, Country');
        
-- simulating cx placing orders
INSERT INTO Orders (customer_id, order_date, total_amount)
VALUES (1, NOW(), 0);
SET @order_id = LAST_INSERT_ID();

INSERT INTO OrderDetails (order_id, book_id, quantity, subtotal)    
VALUES  (@order_id, 1, 2, (SELECT price * 2 from books where book_id =1)),
		(@order_id, 2, 3, (select price * 3 from books where book_id = 2)),
        (@order_id, 3, 2, (select price * 2 from books where book_id = 3));
        
UPDATE Orders
SET total_amount = (select sum(subtotal) FROM OrderDetails WHERE order_id = @order_id) WHERE order_id = @order_id;

-- total revenue
SELECT SUM(total_amount) FROM Orders;

-- retriving list of cx
SELECT * FROM customers;
select * from orderdetails;

-- updating stock qty of book in books table
select * from books;
update books
set stock_qty = 75 where book_id = 2;

-- deleting cx record
select * from orderdetails;
delete from orderdetails where order_id = 1;
delete from orders where customer_id = 1;
delete from customers where customer_id = 1;

-- avg price of books in each genre
select * from books;
select avg(price) from books where genre = 'Fiction';
select avg(price) from books where genre = ' Science Fiction';
select avg(price) from books where genre = 'Mystery';

-- highest sales revenue book
select * from orderdetails;