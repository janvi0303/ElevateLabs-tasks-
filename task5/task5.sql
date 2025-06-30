-- 1. INNER JOIN (Matching rows only)
SELECT o.order_id, c.first_name, c.last_name, o.total_amount FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id;

-- 2. LEFT JOIN (All left table + matches)
SELECT c.customer_id, c.first_name, o.order_id FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- 3. RIGHT JOIN (All right table + matches)
SELECT p.product_name, oi.quantity FROM products p RIGHT JOIN order_items oi ON p.product_id = oi.product_id;

-- 4. FULL OUTER JOIN (All records from both)
SELECT c.first_name, o.order_id FROM customers c FULL OUTER JOIN orders o ON c.customer_id = o.customer_id;

-- 5. CROSS JOIN (Cartesian product)
SELECT p.product_name, c.category_name FROM products p CROSS JOIN categories c LIMIT 10; 

-- 6. SELF JOIN (Join table to itself)
SELECT a.first_name AS customer1, b.first_name AS customer2, a.city FROM customers a JOIN customers b ON a.city = b.city AND a.customer_id < b.customer_id;

-- 7. THREE-TABLE JOIN
SELECT o.order_id, c.first_name, p.product_name, oi.quantity FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

-- 8. JOIN with WHERE filter
SELECT p.product_name, p.price FROM products p JOIN categories c ON p.category_id = c.category_id WHERE c.category_name = 'Electronics';

-- 9. JOIN with GROUP BY
SELECT c.category_name, COUNT(p.product_id) AS product_count FROM categories c LEFT JOIN products p ON c.category_id = p.category_id GROUP BY c.category_name;

-- 10. JOIN with subquery
SELECT c.first_name, o.order_id
FROM customers c
JOIN ( SELECT order_id, customer_id  FROM orders WHERE total_amount > 100 ) o ON c.customer_id = o.customer_id;