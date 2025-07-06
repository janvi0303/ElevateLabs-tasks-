-- TASK 7: VIEW CREATION AND USAGE

-- 1. BASIC VIEW: Customer Order Summary
CREATE OR REPLACE VIEW customer_orders_view AS
SELECT 
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, customer_name;

-- 2. VIEW WITH JOIN: Product Catalog
CREATE OR REPLACE VIEW product_catalog_view AS
SELECT 
    p.product_id,
    p.product_name,
    p.price,
    c.category_name,
    p.stock_quantity
FROM products p
JOIN categories c ON p.category_id = c.category_id;

-- 3. SECURITY VIEW: Customer Contact Info (Restricted)
CREATE OR REPLACE VIEW customer_contacts_view AS
SELECT 
    customer_id,
    first_name,
    last_name,
    email,
    phone
FROM customers;

-- 4. COMPLEX VIEW: Order Details
CREATE OR REPLACE VIEW order_details_view AS
SELECT 
    o.order_id,
    o.order_date,
    c.first_name || ' ' || c.last_name AS customer,
    o.status,
    o.total_amount,
    STRING_AGG(p.product_name, ', ' ORDER BY p.product_name) AS products
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.order_id, o.order_date, customer, o.status, o.total_amount;

-- 5. VIEW WITH FILTER: Active Products
CREATE OR REPLACE VIEW active_products_view AS
SELECT *
FROM products
WHERE stock_quantity > 0
WITH CHECK OPTION;  -- Ensures inserts/updates meet filter condition

-- 6. MATERIALIZED VIEW (PostgreSQL-specific)
CREATE MATERIALIZED VIEW product_sales_summary AS
SELECT 
    p.product_id,
    p.product_name,
    COUNT(oi.order_id) AS times_ordered,
    SUM(oi.quantity) AS total_units_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;

-- Query a view like a table
SELECT * FROM customer_orders_view 
WHERE total_spent > 100
ORDER BY total_spent DESC;

-- Join views with tables
SELECT v.customer_name, o.order_date, o.status
FROM customer_orders_view v
JOIN orders o ON v.customer_id = o.customer_id;

-- Refresh materialized view
REFRESH MATERIALIZED VIEW product_sales_summary;

-- View management List all views
SELECT table_name FROM information_schema.views 
WHERE table_schema NOT IN ('pg_catalog', 'information_schema');

--Display the views
SELECT * FROM public.active_products_view;

SELECT * FROM order_details_view;

SELECT * FROM customer_contacts_view;

SELECT * FROM product_catalog_view;

SELECT * FROM customer_orders_view;