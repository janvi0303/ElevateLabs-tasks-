-- 1. SIMPLE SELECTS
-- Select all columns from customers
SELECT * FROM customers;

-- Select specific columns
SELECT first_name, last_name, email FROM customers;

-- 2. FILTERING WITH WHERE
-- Customers from New York
SELECT * FROM customers WHERE city = 'New York';

-- Products over $100
SELECT product_name, price FROM products WHERE price > 100;

-- Pending orders
SELECT order_id, customer_id, total_amount FROM orders WHERE status = 'pending';

-- 3. COMBINING CONDITIONS
-- Electronics products between $50 and $200
SELECT product_name, price FROM products WHERE category_id = 1 AND price BETWEEN 50 AND 200;

-- Customers without phone numbers (before our NULL update)
SELECT first_name, last_name FROM customers WHERE phone IS NULL;

-- 4. PATTERN MATCHING WITH LIKE
-- Products with 'Smart' in name
SELECT product_name FROM products WHERE product_name LIKE '%Smart%';

-- Customers with emails ending in '.com'
SELECT email FROM customers WHERE email LIKE '%.com';

--Products starting with 'W'
SELECT * FROM products WHERE product_name LIKE 'W%';

-- 5. SORTING WITH ORDER BY
-- Most expensive products first
SELECT product_name, price FROM products ORDER BY price DESC;

-- Oldest orders first
SELECT order_id, order_date FROM orders ORDER BY order_date ASC;

-- 6. LIMITING RESULTS
-- Top 3 most expensive products
SELECT product_name, price FROM products ORDER BY price DESC LIMIT 3;

-- Second page of customers (rows 2-4)
SELECT first_name, last_name FROM customers ORDER BY customer_id LIMIT 2 OFFSET 1;

-- 7. JOINING TABLES
-- Order details with product info
SELECT o.order_id, p.product_name, oi.quantity, oi.unit_price FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id JOIN products p ON oi.product_id = p.product_id;

-- Orders with customer details (only matches | INNER JOIN)
SELECT o.order_id, o.order_date, c.first_name, c.last_name FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id;

-- All customers with their orders (including customers with no orders | LEFT OUTER JOIN)
SELECT c.first_name, c.last_name, o.order_id, o.order_date FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- All products and any orders that include them (including unsold products | RIGHT OUTER JOIN)
SELECT p.product_name, oi.order_id, oi.quantity FROM products p RIGHT JOIN order_items oi ON p.product_id = oi.product_id;

-- All customers and all products (FULL JOIN)
SELECT c.first_name, p.product_name FROM customers c FULL OUTER JOIN products p ON true LIMIT 10; 

-- Every possible customer-product combination (Cartesian product | SELF JOIN)
SELECT c.first_name, p.product_name FROM customers c CROSS JOIN products p LIMIT 10;

-- 8. USING DISTINCT
-- Unique cities customers are from
SELECT DISTINCT city FROM customers;

-- 9. COLUMN ALIASING
-- Formatted customer names
SELECT first_name || ' ' || last_name AS full_name, city || ', ' || a_state AS location FROM customers;

-- 10. AGGREGATE FUNCTIONS
-- Total value of all products in inventory
SELECT SUM(price * stock_quantity) AS total_inventory_value FROM products;

-- Average order amount
SELECT AVG(total_amount) AS avg_order_value FROM orders;

-- Count customers with phone numbers
SELECT COUNT(phone) AS customers_with_phones FROM customers;

-- Total quantity of a specific product sold
SELECT SUM(quantity) AS total_sold FROM order_items WHERE product_id = 3;

-- Least expensive product price
SELECT MIN(price) AS min_product_price FROM products;

-- Most expensive product
SELECT MAX(price) AS max_product_price FROM products;

-- Standard deviation of product prices
SELECT STDDEV(price) AS price_stddev FROM products;

-- List products in each category
SELECT c.category_name, STRING_AGG(p.product_name, ' | ') AS products FROM products p JOIN categories c ON p.category_id = c.category_id GROUP BY c.category_name;

-- GROUP CONCAT
SELECT c.category_name, STRING_AGG(p.product_name, ', ' ORDER BY p.product_name) AS product_list FROM products p JOIN categories c ON p.category_id = c.category_id GROUP BY c.category_name;

-- Count pending vs completed vs processing orders
SELECT COUNT(*) FILTER (WHERE status = 'pending') AS pending_orders, COUNT(*) FILTER (WHERE status = 'delivered') AS delivered_orders, COUNT(*) FILTER (WHERE status = 'processing') AS processing_orders FROM orders;