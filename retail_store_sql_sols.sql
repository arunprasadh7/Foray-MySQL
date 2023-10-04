-- get products by category
-- 1 accecpt category name as input and return product name, price, stock qty
SELECT 
	p.product_name,
    p.price,
    p.stock_quantity
FROM products p
JOIN product_categories pc 
	USING(product_id)
JOIN categories c
	USING(category_id)
WHERE c.category_name = 'clothing';

-- 2 - get low stock products
-- return list of products that have stock qty below specific threshold

SELECT 
	product_name
FROM products
WHERE stock_quantity < 50
LIMIT 2;

-- 3 create new product
-- add new product to the db (product_name, price, stockqty)
INSERT INTO products(product_name, price, stock_quantity)
VALUES ();