1. Initial Table State
SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;

2. INSERT Operations
--TABLE CUSTOMERS
INSERT INTO customers (first_name, last_name, email, city, a_state) VALUES ('Robert', 'Wilson', 'robert.w@example.com', 'Boston', 'MA');

SELECT * FROM customers;

--TABLE PRODUCTS
INSERT INTO products (product_name, description, price, category_id) VALUES ('Wireless Charger', 'Fast-charging pad', 29.99, 1);

SELECT * FROM products;

3. UPDATE Operations
--TABLE CUSTOMERS
UPDATE customerS SET address = '100 Park Ave', zip_code = '10022' WHERE email = 'robert.w@example.com';

SELECT * FROM customers;

--TABLE PRODUCTS
UPDATE products SET price = price * 1.1 WHERE category_id = 1;

SELECT * FROM products;

4. DELETE Operations
--TABLE CUSTOMERS
DELETE FROM customers WHERE email = 'emily.j@example.com'; --RECEIVED ERROR

DELETE FROM order_items WHERE order_id IN (SELECT order_id FROM orders WHERE customer_id = 2);

DELETE FROM orders WHERE customer_id = 2;

DELETE FROM customers WHERE email = 'emily.j@example.com';

SELECT * FROM customers;

5. NULL Handling
SELECT customer_id, first_name, phone FROM customers WHERE phone IS NULL;

UPDATE customers SET phone = '555-0000' WHERE phone IS NULL;

SELECT customer_id, first_name, phone FROM customers;

6. Transaction Example
-- Start transaction
BEGIN;

-- Insert new order
INSERT INTO orders (customer_id, total_amount, status)
VALUES (1, 99.99, 'pending');

-- Display the newly created order
SELECT 'Order created:' AS message;
SELECT * FROM orders WHERE order_id = currval('orders_order_id_seq');

-- Add items to the order
INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES (
    currval('orders_order_id_seq'), 
    3, 
    2, 
    (SELECT price FROM products WHERE product_id = 3)
);

-- Update order total based on items
UPDATE orders 
SET total_amount = (
    SELECT SUM(quantity * unit_price) 
    FROM order_items 
    WHERE order_id = currval('orders_order_id_seq')
) 
WHERE order_id = currval('orders_order_id_seq');

-- Commit the transaction
COMMIT;

-- Display final order details with items
SELECT 'Final order details:' AS message;

SELECT o.order_id, o.order_date, o.status, o.total_amount, oi.product_id, 
p.product_name, oi.quantity, oi.unit_price,(oi.quantity * oi.unit_price) AS item_total
FROM orders o JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_id = currval('orders_order_id_seq');
