-- 1. COUNT: Total number of customers
SELECT COUNT(*) AS total_customers FROM customers;

-- 2. SUM: Total sales revenue
SELECT SUM(total_amount) AS total_revenue FROM orders;

-- 3. AVG: Average order value
SELECT AVG(total_amount) AS avg_order_value FROM orders;

-- 4. MIN/MAX: Cheapest and most expensive products
SELECT MIN(price) AS min_price, MAX(price) AS max_price FROM products;

-- 5. ROUND: Average price per category (rounded)
SELECT c.category_name,mROUND(AVG(p.price), 2) AS avg_price FROM products p JOIN categories c ON p.category_id = c.category_id GROUP BY c.category_name;

-- 6. COUNT DISTINCT: Unique cities with customers
SELECT COUNT(DISTINCT city) AS unique_cities FROM customers;

-- 7. STRING_AGG: List all products in each category
SELECT c.category_name, STRING_AGG(p.product_name, ', ') AS products FROM products p JOIN categories c ON p.category_id = c.category_id GROUP BY c.category_name;

-- 8. Sales by order status
SELECT status, COUNT(*) AS order_count, SUM(total_amount) AS total_sales FROM orders GROUP BY status;

-- 9. Products per category
SELECT c.category_name, COUNT(p.product_id) AS product_count FROM products p JOIN categories c ON p.category_id = c.category_id GROUP BY c.category_name;

-- 10. Customer order frequency
SELECT customer_id, COUNT(*) AS orders_placed FROM orders GROUP BY customer_id ORDER BY orders_placed DESC;

-- 11. Categories with 2+ products
SELECT c.category_name, COUNT(p.product_id) AS product_count FROM products p JOIN categories c ON p.category_id = c.category_id GROUP BY c.category_name HAVING COUNT(p.product_id) >= 2;

-- 12. Customers with $200+ total spending
SELECT c.first_name, c.last_name, SUM(o.total_amount) AS total_spent FROM customers c JOIN orders o ON c.customer_id = o.customer_id GROUP BY c.customer_id HAVING SUM(o.total_amount) > 200;