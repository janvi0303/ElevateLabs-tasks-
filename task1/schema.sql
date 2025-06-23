-- 1. Create the database 
CREATE DATABASE ecommerce_db;
\c ecommerce_db

-- 2. Create tables 
--i. Creating Customers table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(200),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--ii. Creating Categories table
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    description TEXT
);

--iii.Creating Products table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

--iv. Creating Orders table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) CHECK (status IN ('pending', 'processing', 'shipped', 'delivered', 'cancelled')) DEFAULT 'pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

UPDATE orders SET total_amount = (
  SELECT SUM(quantity * unit_price)
  FROM order_items
  WHERE order_items.order_id = orders.order_id
);

--v. Create Order Items table
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- 3. Insert sample data

-- Insert categories
INSERT INTO categories (category_name, description) VALUES
('Electronics', 'Gadgets and electronic devices'),
('Clothing', 'Apparel and fashion items'),
('Home & Kitchen', 'Household and kitchen products'),
('Books', 'Fiction and non-fiction books');

-- Insert customers
INSERT INTO customers (first_name, last_name, email, phone, address, city, a_state, zip_code) VALUES
('John', 'Smith', 'john.smith@example.com', '555-0101', '123 Main St', 'New York', 'NY', '10001'),
('Emily', 'Johnson', 'emily.j@example.com', '555-0102', '456 Oak Ave', 'Los Angeles', 'CA', '90001'),
('Michael', 'Williams', 'michael.w@example.com', '555-0103', '789 Pine Rd', 'Chicago', 'IL', '60601'),
('Sarah', 'Brown', 'sarah.b@example.com', NULL, '321 Elm St', 'Houston', 'TX', '77001');

-- Insert products
INSERT INTO products (product_name, description, price, stock_quantity, category_id) VALUES
('Smartphone X', 'Latest smartphone with advanced camera', 799.99, 50, 1),
('Wireless Earbuds', 'Noise-cancelling wireless earbuds', 149.99, 100, 1),
('Men''s T-Shirt', 'Cotton crew-neck t-shirt', 19.99, 200, 2),
('Women''s Jeans', 'Slim-fit denim jeans', 39.99, 150, 2),
('Blender', 'High-speed kitchen blender', 59.99, 75, 3),
('Cookbook', 'Best-selling recipe collection', 24.99, 30, 4),
('Smart Watch', 'Fitness tracking smartwatch', 199.99, 40, 1);

-- Insert orders
INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES
(1, '2023-05-15 10:30:00', 799.99, 'delivered'),
(2, '2023-05-16 14:15:00', 189.98, 'shipped'),
(3, '2023-05-17 09:45:00', 59.99, 'processing'),
(1, '2023-05-18 16:20:00', 219.98, 'pending');

-- Insert order items
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 799.99),  -- John bought Smartphone X
(2, 2, 1, 149.99),  -- Emily bought Wireless Earbuds
(2, 6, 1, 24.99),   -- Emily also bought Cookbook
(3, 5, 1, 59.99),   -- Michael bought Blender
(4, 3, 2, 19.99),   -- John bought 2 Men's T-Shirts
(4, 4, 1, 39.99);   -- John also bought Women's Jeans
