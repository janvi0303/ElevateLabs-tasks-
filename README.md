# ElevateLabs-tasks-
The e-commerce database schema is designed with Third Normal Form (3NF) compliance to ensure data integrity and minimize redundancy. Each table serves a distinct purpose: the customers table stores user information, categories organizes products, products contains item details linked to categories, orders records customer purchases, and order_items acts as a junction table linking orders to products with quantities.

Normalization is strictly followed:

1NF is achieved by ensuring all columns contain atomic values (e.g., no lists or nested data).

2NF is satisfied by eliminating partial dependencies (e.g., order_items relies on both order_id and product_id).

3NF is met by removing transitive dependencies (e.g., city and state in customers don’t functionally depend on non-key fields like zip_code).

Foreign keys enforce relational integrity:

Products reference categories (category_id).

Orders reference customers (customer_id).

Order items reference both orders and products (order_id, product_id).

Constraints further validate data:

NOT NULL ensures critical fields like email are always populated.

UNIQUE prevents duplicate customer emails.

CHECK validates order statuses (e.g., "shipped", "pending").