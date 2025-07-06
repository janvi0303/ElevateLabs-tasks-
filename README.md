# ElevateLabs-tasks-

# Task 1 - E-commerce Database Schema

## Overview
This repository contains the SQL script to create an e-commerce database schema with tables for customers, products, orders, and categories.

## Schema Design
- **Customers**: Stores customer information
- **Products**: Contains product details with category relationships
- **Orders**: Records customer orders
- **Order Items**: Tracks individual products within orders
- **Categories**: Organizes products into categories

## Relationships
- One-to-many: Customer to Orders
- One-to-many: Category to Products
- Many-to-many: Orders to Products (via Order Items)

# Task 2: Data Insertion and Handling Nulls

## Overview
This repository contains SQL DML operations for:
- Inserting data (including partial inserts with NULLs)
- Updating records with conditions
- Deleting data safely
- Handling NULL values

## Key Concepts Demonstrated
- INSERT with partial values
- UPDATE with WHERE clauses
- DELETE operations
- NULL handling (IS NULL, COALESCE)
- Transactions for data integrity

# Task 3: Basic SELECT Queries

## Overview
This repository contains SQL SELECT queries demonstrating:
- Basic data retrieval
- Filtering with WHERE
- Sorting with ORDER BY
- Limiting results
- Table joins
- Aggregate functions

## Key Concepts Demonstrated
- Projection (column selection)
- Selection (row filtering)
- Sorting and limiting
- Table relationships

# Task 4: Aggregate Functions and Grouping

## Overview:
- Basic aggregates (COUNT, SUM, AVG)
- GROUP BY with single/multiple columns
- HAVING for group filtering
- Advanced functions (ROUND, STRING_AGG)

## Key Concepts Demonstrated:
- Data summarization
- Group filtering vs row filtering
- Multi-table aggregation

# Task 5: SQL Joins Practice

## Joins Demonstrated:
- INNER, LEFT, RIGHT, FULL OUTER
- CROSS, SELF joins
- Multi-table joins
- Joins with filtering/aggregation

## Key Concepts:
- Relationship mapping
- NULL handling in outer joins
- Join optimization

# Task 6: Subqueries Practice

## Subquery Types Demonstrated:
- Scalar, Multi-row, Correlated
- EXISTS/NOT EXISTS
- Derived tables (FROM clause)
- LATERAL joins (PostgreSQL)
- Recursive CTEs

## Key Concepts:
- Query nesting logic
- Performance considerations
- Alternative approaches

# Task 7: SQL Views Practice

## View Types Demonstrated:
- Basic views
- Join views
- Security views
- Materialized views (PostgreSQL)
- Views with WITH CHECK OPTION

## Key Concepts:
- Data abstraction
- Query simplification
- Security implementation
- Performance considerations

  # Task 8: Stored Procedures & Functions

## Components:
- Discount calculation function
- Price update procedure
- Order retrieval function
- Order processing procedure

## Key Concepts:
- Modular SQL logic
- Parameter handling
- Error management
- Transaction control
