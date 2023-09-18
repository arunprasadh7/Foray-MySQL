-- Creating a simple product inventory

CREATE DATABASE ProductInventory;
USE Productinventory;

-- creating product info table
CREATE TABLE productinfo (
product_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
description VARCHAR(250),
price DECIMAL(6,2),
type VARCHAR(20)
);
DESC productinfo;
drop table productinfo;

create table inventory_tracking (
product_id INT,
quantity INT NOT NULL,
FOREIGN KEY(product_id) REFERENCES productinfo(product_id)
);
select * from inventory_tracking;
drop table inventory_tracking;

-- adding new product to the inventory
INSERT INTO productinfo (name, description, price, type)
VALUES  ('Product1', 'Description1', 10.50, 'Electronics');
INSERT INTO productinfo (name, description, price, type)
VALUES  ('Product2', 'Description2', 20.20, 'Clothing'),
		('Product3', 'Description3', 30.50, 'Clothing'),
        ('Product4', 'Description4', 40.50, 'Electronics'),
        ('Product5', 'Description5', 50.50, 'Electronics');

select * from productinfo;

INSERT INTO inventory_tracking
VALUES  (1, 10),
		(2, 20),
        (3, 30),
        (4, 40),
        (5, 50);
select * from inventory_tracking;
DELETE from inventory_tracking;

-- Removing a product from the inventory:
DELETE FROM productinfo 
WHERE product_id = 5;

DELETE productinfo, inventory_tracking
FROM productinfo
JOIN inventory_tracking ON productinfo.product_id = inventory_tracking.product_id
WHERE productinfo.product_id = 5;

ALTER TABLE inventory_tracking
DROP FOREIGN KEY inventory_tracking_ibfk_1 ;
ALTER TABLE inventory_tracking
ADD CONSTRAINT fk_inventory
FOREIGN KEY (product_id) REFERENCES productinfo(product_id)
ON DELETE cascade;

-- Updating inventory
UPDATE inventory_tracking
SET quantity = 25
WHERE product_id = 2;

-- Viewing a list of all products, sorted by category
SELECT * FROM productinfo
ORDER BY type;

-- products sorted by price
SELECT * FROM productinfo
ORDER BY price DESC;