# 📚 Online Book Store SQL Project

## 🧾 Project Overview

This project demonstrates a SQL-based management system for an **Online Book Store**, focusing on managing **Books**, **Customers**, and **Orders** data. It includes data importation from CSV files, relational table creation, and various SQL queries ranging from basic retrieval to advanced analytics.

---

## 🗂️ Database Schema

The system is composed of three core tables:

### 📘 Books

| Column         | Type           | Description                |
|----------------|----------------|----------------------------|
| `Book_ID`      | SERIAL (PK)    | Unique identifier          |
| `Title`        | VARCHAR(100)   | Book title                 |
| `Author`       | VARCHAR(50)    | Author name                |
| `Genre`        | VARCHAR(50)    | Book genre                 |
| `Published_Year` | INT          | Year of publication        |
| `Price`        | NUMERIC(10,2)  | Price of the book          |
| `Stock`        | INT            | Number of books in stock   |

### 👤 Customers

| Column         | Type           | Description                |
|----------------|----------------|----------------------------|
| `Customer_ID`  | SERIAL (PK)    | Unique identifier          |
| `Name`         | VARCHAR(100)   | Customer name              |
| `Email`        | VARCHAR(50)    | Email address              |
| `Phone`        | VARCHAR(15)    | Contact number             |
| `City`         | VARCHAR(50)    | City of residence          |
| `Country`      | VARCHAR(100)   | Country of residence       |

### 📦 Orders

| Column         | Type           | Description                          |
|----------------|----------------|--------------------------------------|
| `Order_ID`     | SERIAL (PK)    | Unique identifier                    |
| `Customer_ID`  | INT (FK)       | Linked to Customers table            |
| `Book_ID`      | INT (FK)       | Linked to Books table                |
| `Order_Date`   | DATE           | Date when the order was placed       |
| `Quantity`     | INT            | Number of units ordered              |
| `Total_Amount` | NUMERIC(10,2)  | Total price for the order            |

---

## 📥 Data Import

CSV files are used to populate the tables. The `COPY` command is utilized for efficient bulk data loading:

```sql
COPY Books(book_id, title, author, genre, published_year, price, stock)
FROM 'C:\\Users\\hp\\Downloads\\Books.csv'
DELIMITER ',' CSV HEADER;

COPY Customers(customer_id, name, email, phone, city, country)
FROM 'C:\\Users\\hp\\Downloads\\Customers.csv'
DELIMITER ',' CSV HEADER;

COPY Orders(order_id, customer_id, book_id, order_date, quantity, total_amount)
FROM 'C:\\Users\\hp\\Downloads\\Orders.csv'
DELIMITER ',' CSV HEADER;

 🔍 SQL Queries
## 🔍 **SQL Queries**

### 📌 **Basic Queries**
- **Retrieve all Fiction genre books**
- **Find books published after 1950**
- **List all customers from Canada**
- **Show orders placed in November 2023**
- **Calculate total stock available**
- **Find the most expensive book**
- **Show customers who ordered more than one quantity**
- **Retrieve orders with total amount > $20**
- **List all distinct book genres**
- **Find the books with the lowest stock**
- **Calculate total revenue from all orders**

### 📊 **Advanced Analytical Queries**
- **Total books sold per genre**
- **Average price of books in "Fantasy" genre**
- **Customers with at least 2 orders**
- **Most frequently ordered book (with title)**
- **Top 3 most expensive "Fantasy" books**
- **Quantity sold per author**
- **Cities with customers who spent over $30**
- **Highest-spending customer**
- **Remaining stock after fulfilling orders**

## ✅ **Prerequisites**
- **PostgreSQL installed and configured**
- **CSV data files: `Books.csv`, `Customers.csv`, `Orders.csv`**
- **SQL editor (pgAdmin, DBeaver, or psql CLI)**
- **Basic SQL knowledge**

## 🚀 **How to Run**
1. **Open your PostgreSQL environment.**
2. **Execute the provided SQL script:**
   - Drops and recreates tables
   - Loads data from CSV files
   - Runs various SQL queries
3. **Modify and extend queries for additional insights**

## 📌 **Notes**
- **Ensure column names in the CSV files match the SQL schema.**
- **Update local paths for data import commands.**
- **All foreign key constraints are in place to maintain data integrity.**

## 📧 **Contact**
**If you have any questions or suggestions, feel free to open an issue or contact the project maintainer.**

