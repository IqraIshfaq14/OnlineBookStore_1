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

