# ElevateLabs-tasks-
The e-commerce database schema is designed with Third Normal Form (3NF) compliance to ensure data integrity and minimize redundancy. Each table serves a distinct purpose: the customers table stores user information, categories organizes products, products contains item details linked to categories, orders records customer purchases, and order_items acts as a junction table linking orders to products with quantities.

**Normalization is the process of organizing data in a database to reduce redundancy and improve data integrity. It involves structuring tables and relationships to minimize duplicate data and ensure dependencies make logical sense.**
i. 1NF is achieved by ensuring all columns contain atomic values (e.g., no lists or nested data).

ii. 2NF is satisfied by eliminating partial dependencies (e.g., order_items relies on both order_id and product_id).

iii. 3NF is met by removing transitive dependencies (e.g., city and state in customers don’t functionally depend on non-key fields like zip_code).

**Keys are attributes (columns) used to uniquely identify records in a table and establish relationships between tables. They ensure data integrity and enable efficient querying.**
**Types of Keys**
1. Primary Key (PK): Uniquely identifies each row in a table. Must be unique (no duplicates). Cannot be NULL. Only one primary key per table (but can be composite).
2. Super Key: A set of columns that includes the primary key (may have extra columns).
3. Foreign Key (FK): Links two tables by referencing the primary key of another table. Can be NULL (unless constrained). Foreign keys enforce relational integrity(cannot reference a non-existent record): 
  i. Products reference categories (category_id).
  
  ii. Orders reference customers (customer_id).
  
  iii. Order items reference both orders and products (order_id, product_id).

**Constraints further validate data:**

NOT NULL ensures critical fields like email are always populated.

UNIQUE prevents duplicate customer emails.

CHECK validates order statuses (e.g., "shipped", "pending").

![image](https://github.com/user-attachments/assets/c954c069-a3a1-4d39-8908-a83e27a3489d)

![image](https://github.com/user-attachments/assets/fb46835b-5fa7-473a-b6e2-76a6829b179b)

![image](https://github.com/user-attachments/assets/359c2f36-32f2-4608-a806-d05907e129a0)

![image](https://github.com/user-attachments/assets/132c404c-8633-4ea5-aa50-ba14e0537573)

![image](https://github.com/user-attachments/assets/acb8ea4f-f949-4c69-bc8c-270fb302ff02)

![image](https://github.com/user-attachments/assets/49e3e10e-cda5-41d1-abb8-4f24f3e5bcf5)

![image](https://github.com/user-attachments/assets/21822761-4e01-4788-8dee-78fb899b99e8)







