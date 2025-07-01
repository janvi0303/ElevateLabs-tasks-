-- 1. SCALAR SUBQUERY (Single value) Find products priced above average
SELECT product_name, price FROM products WHERE price > (SELECT AVG(price) FROM products);

-- 2. MULTI-ROW SUBQUERY (IN operator)Customers who placed orders
SELECT first_name, last_name FROM customers WHERE customer_id IN (SELECT DISTINCT customer_id FROM orders);

-- 3. CORRELATED SUBQUERY (Row-by-row)Products with above-average prices in their category
SELECT p1.product_name, p1.price, p1.category_id
FROM products p1 WHERE p1.price > (SELECT AVG(p2.price)FROM products p2 WHERE p2.category_id = p1.category_id);

-- 4. EXISTS SUBQUERY (Boolean check)Categories with products
SELECT category_name FROM categories c WHERE EXISTS (SELECT 1 FROM products p WHERE p.category_id = c.category_id);

-- 5. NOT EXISTS SUBQUERY Customers with no orders
SELECT first_name, last_name
FROM customers c WHERE NOT EXISTS (SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id);

-- 6. SUBQUERY IN SELECT clause Product list with price comparison to category avg
SELECT product_name, price,(SELECT AVG(price) FROM products p2 WHERE p2.category_id = p1.category_id) AS category_avg, price - (SELECT AVG(price) FROM products p2 WHERE p2.category_id = p1.category_id) AS diff_from_avg FROM products p1;

-- 7. DERIVED TABLE (Subquery in FROM)Average order value by customer
SELECT c.first_name, c.last_name,avg_orders.avg_amount
FROM customers c JOIN ( SELECT customer_id, AVG(total_amount) AS avg_amount FROM orders GROUP BY customer_id ) avg_orders ON c.customer_id = avg_orders.customer_id;

-- 8. SUBQUERY WITH JOIN Order details for high-value customers
SELECT o.order_id, c.first_name, o.total_amount FROM orders o JOIN customers c ON o.customer_id = c.customer_id WHERE c.customer_id IN ( SELECT customer_id FROM orders GROUP BY customer_id HAVING SUM(total_amount) > 300);

-- 9. LATERAL SUBQUERY Top product from each category
SELECT c.category_name, p.product_name, p.price FROM categories c, LATERAL ( SELECT product_name, price FROM products WHERE category_id = c.category_id ORDER BY price DESC LIMIT 1) p;

-- 10. Recursive category tree 
WITH RECURSIVE category_tree AS (SELECT category_id, category_name, 1 AS level FROM categories WHERE category_id = 1 UNION ALL SELECT c.category_id, c.category_name, ct.level + 1 FROM categories c JOIN category_tree ct ON c.category_id = ct.category_id + 1 ) SELECT * FROM category_tree;