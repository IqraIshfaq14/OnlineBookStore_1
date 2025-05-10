--Create Tables
DROP TABLE IF EXISTS Books;
CREATE TABLE Books(
	Book_ID SERIAL PRIMARY KEY,
	Title varchar(100),
	Author varchar(50),
	Genre varchar(50),
	Published_Year INT ,
	Price NUMERIC(10,2),
	Stock INT
);
DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers(
	Customer_id SERIAL PRIMARY KEY,
	Name varchar(100),
	Email varchar(50),
	Phone varchar(15),
	City Varchar(50) ,
	Country varchar(100)
);
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
	Order_ID SERIAL PRIMARY KEY,
	Customer_ID int References Customers(customer_id),
	Book_ID int References Books(Book_id),
	Order_Date DATE,
	Quantity int,
	Total_Amount Numeric(10,2)
);
SELECT * FROM CUSTOMERS;
SELECT * FROM Books;
SELECT * FROM ORDERS;
---Import data into Books Table from csv
COPY Books(book_id,title,author,genre,published_year,price,stock)
FROM '‪C:\\Users\\hp\\Downloads\\Books.csv'
DELIMITER ','
CSV HEADER;

---Import data into Customers Table from csv
COPY Customers(customer_id, name, email,phone,city,country)
FROM '‪C:\\Users\\hp\\Downloads\\Customers.csv'
DELIMITER ','
CSV HEADER;
---Import data into Orders Table from csv
COPY Orders(order_id,cutomer_id,book_id,order_date,quantity,total_amount)
FROM '‪C:\\Users\\hp\\Downloads\\Orders.csv'
DELIMITER ','
CSV HEADER;

SELECT * FROM CUSTOMERS;
SELECT * FROM Books;
SELECT * FROM ORDERS;
-- 1) Retrieve all books in the "Fiction" genre:
SELECT  * from books 
WHERE Genre='Fiction';


-- 2) Find books published after the year 1950:
SELECT *FROM Books
WHERE published_year > 1950;

-- 3) List all customers from the Canada:
SELECT *FROM customers
where country='Canada';
-- 4) Show orders placed in November 2023:
SELECT *FROM orders
WHERE  order_date BETWEEN '2023-11-01' AND '2023-11-30'

-- 5) Retrieve the total stock of books available:
SELECT 
SUM(stock) AS total_stock
 FROM books;

-- 6) Find the details of the most expensive book:
FROM books
ORDER BY price  DESC LIMIT 1; 


-- 7) Show all customers who ordered more than 1 quantity of a book:
SELECT FROM Orders
WHERE Quantity>1;

-- 8) Retrieve all orders where the total amount exceeds $20:
SELECT FROM orders
WHERE total_amount> 20;

-- 9) List all genres available in the Books table:
SELECT DISTINCT genre FROM books;

-- 10) Find the book with the lowest stock:
SELECT *FROM books
 ORDER BY stock LIMIT 6;

-- 11) Calculate the total revenue generated from all orders:
SELECT SUM(total_amount) AS Revenue FROM orders;
-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:
SELECT *FROM Books;
SELECT b.genre,SUM(o.quantity ) AS total_books_sold
FROM orders o 
JOIN books b ON o.book_id=b.book_id
GROUP BY b.genre;

-- 2) Find the average price of books in the "Fantasy" genre:
SELECT AVG(price) AS average_price
FROM books
WHERE Genre='Fantasy';


-- 3) List customers who have placed at least 2 orders:
SELECT customer_id ,COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id
HAVING  COUNT(order_id)>=2;

-- 3.1) List customers who have placed at least 2 orders and name:
SELECT  o.customer_id ,c.name,COUNT(o.order_id) AS order_count
FROM orders o
JOIN customers c ON c.customer_id=o.customer_id
GROUP BY  o.customer_id, c.name
HAVING COUNT(order_id)>=2;

-- 4) Find the most frequently ordered book:
SELECT *FROM books;
SELECT book_id,COUNT(order_id) AS order_count
FROM orders
GROUP BY book_id
ORDER BY COUNT(order_id) DESC LIMIT 1;
---also showing the name of the book
SELECT o.book_id,b.title, COUNT(o.order_id) AS order_count
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY o.book_id,b.title
ORDER BY  COUNT (o.order_id) DESC LIMIT 1;


-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
SELECT *FROM books
WHERE genre='Fantasy'
ORDER BY  price DESC LIMIT 3;

-- 6) Retrieve the total quantity of books sold by each author:

SELECT b.author,SUM(o.quantity) AS total_books_sold
FROM orders o
JOIN books b ON o.book_id=b.book_id
GROUP BY b.author;

-- 7) List the cities where customers who spent over $30 are located:
SELECT DISTINCT c.city, total_amount
FROM orders o 
JOIN customers c ON o.customer_id=c.customer_id
WHERE o.total_amount >30;

-- 8) Find the customer who spent the most on orders:
SELECT  c.customer_id,c.name, SUM(o.total_amount) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id=c.customer_id
GROUP BY  c.customer_id , c.name
ORDER BY  total_spent DESC LIMIT 1;

--9) Calculate the stock remaining after fulfilling all orders:
SELECT *FROM books;
SELECT b.book_id, b.title,b.stock,COALESCE(SUM(quantity),0) AS order_quantity,
	b.stock- COALESCE(SUM(o.quantity),0) as remaining_quantity
FROM books b 
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY  b.book_id;

