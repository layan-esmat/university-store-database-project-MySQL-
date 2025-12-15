# UniversityStore Database Project

## Overview
This project implements a simple **University Store database** using **MySQL**. It demonstrates core database concepts including table creation, constraints, relationships, data insertion, joins, aggregation, and views.

---

## Database Structure
The database **UniversityStore** consists of three main tables:

### 1. Student
Stores student information with constraints to ensure data validity.
- Primary Key: `studentID`
- Defaults: Nationality (`'Saudi'`)
- Validation: Age restricted between 18 and 40

### 2. Product
Stores products available in the store.
- Primary Key: `productID`
- Defaults: Category (`'stationary'`)
- Validation: Price must be greater than 0

### 3. Purchase
Represents purchases made by students.
- Primary Key: `purchaseID`
- Foreign Keys:
  - `studentID` → Student
  - `productID` → Product
- Default purchase date set to the current date

---

## Key Features Implemented

### Data Integrity
- Primary key and foreign key constraints
- `CHECK` constraints for valid age and price
- `DEFAULT` values for commonly used attributes

### Data Manipulation
- Inserted multiple records into all tables
- Ensured referential integrity during insertion

### Queries
- INNER JOIN to retrieve student and product details
- LEFT JOIN to include students without purchases
- Filtering based on nationality
- Aggregation using `GROUP BY` and `COUNT`
- Conditional filtering on product price

### Views
- Created a view `v_studentPurchases` to display student purchase details
- Demonstrates abstraction and simplified data access

---

## Learning Outcomes
- Understanding relational database design
- Applying constraints and relationships correctly
- Writing JOIN queries across multiple tables
- Using aggregation and views effectively
- Following correct insertion rules with foreign keys

---

## Technologies
- Database: MySQL
- Language: SQL
