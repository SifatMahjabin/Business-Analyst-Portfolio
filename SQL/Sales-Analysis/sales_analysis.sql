CREATE DATABASE SALES_ANALYSIS;
USE SALES_ANALYSIS;

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
); 
 -- sales table
 CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
); 

-- Customers
INSERT INTO customers (customer_name, region) VALUES
('Rahim', 'Dhaka'),
('Karim', 'Chittagong'),
('Ayesha', 'Dhaka'),
('Nusrat', 'Khulna'),
('Sabbir', 'Rajshahi');

-- Products
INSERT INTO products (product_name, category, price) VALUES
('Laptop', 'Electronics', 80000),
('Mobile', 'Electronics', 30000),
('Chair', 'Furniture', 5000),
('Table', 'Furniture', 10000),
('Headphone', 'Accessories', 2000);

-- Sales
INSERT INTO sales (customer_id, product_id, quantity, sale_date) VALUES
(1,1,1,'2025-01-10'),
(2,2,2,'2025-01-15'),
(3,3,5,'2025-02-01'),
(4,4,1,'2025-02-10'),
(5,5,3,'2025-03-05'),
(1,2,1,'2025-03-15'),
(3,1,1,'2025-04-01'),
(2,3,4,'2025-04-10'),
(4,5,2,'2025-05-01'),
(5,4,1,'2025-05-15'); 

SELECT * FROM customers;
SELECT * FROM products ;
SELECT * FROM sales ;  

SELECT 
SALES.SALE_ID, 
CUSTOMERS.CUSTOMER_NAME, 
CUSTOMERS.REGION, 
PRODUCTS.PRODUCT_NAME, 
PRODUCTS.CATEGORY, 
SALES.QUANTITY, 
PRODUCTS.PRICE, 
(SALES.QUANTITY*PRODUCTS.PRICE) as TOTAL_AMOUNT 
FROM SALES 
JOIN CUSTOMERS ON SALES.CUSTOMER_ID=CUSTOMERS.CUSTOMER_ID 
JOIN PRODUCTS ON SALES.PRODUCT_ID=PRODUCTS.PRODUCT_ID
 
  
  -- Find products that have price higher then avg price
 
 SELECT 
 PROduct_NAME, 
 PRICE 
 FROM products
 WHERE PRICE>(SELECT AVG(PRICE) fROM products)  
 
--  Use a subquery to find products with sales above average. 



SELECT 
Products.product_name,
Sum(Sales.quantity*products.price) AS total_sales 
FROM sales 
JOIN PRODUCTS 
ON SALES.PRODUCT_ID=PRODUCTS.PRODUCT_ID 
group by Products.product_name 
Having total_sales> (select AVG(PRODUCT_TOTAL)
FROM
(SELECT 
SUM(SALES.QUANTITY*PRODUCTS.PRICE) as product_total 
FROM sales 
Join products 
ON SALES.PRODUCT_ID=PRODUCTS.PRODUCT_ID 
group by Products.product_name ) AS avg_sales) 
 
 SELECT * FROM SALES;
 
 
 SELECT 
 YEAR(SALE_DATE) AS YEAR, 
 mONTH(SALE_DATE) as MONTH, 
 SUM(SALES.QUANTITY* PRODUCTS.PRICE) AS TOTAL_SALES 
 From sales 
 join products 
 on sales.product_id=products.product_id 
 GROUP BY  
 YEAR(SALE_DATE),
 MONTH(SALE_DATE)  
 ORDER BY  
 YEAR(SALE_DATE),
 MONTH(SALE_DATE)  
 
 -- TOP 3 CUSTOMER BY SALES 
 
  SELECT * FROM SALES ;
  SELECT * FROM PRODUCTS 
  SELECT * FROM CUSTOMERS
  
 SELECT 
 CUSTOMERS.CUSTOMER_NAME, 
 SUM(SALES.QUANTITY* PRODUCTS.PRICE) AS TOTAL_SALES  
 FROM SALES 
 JOIN CUSTOMERS 
 ON SALES.CUSTOMER_ID=CUSTOMERS.CUSTOMER_ID  
 JOIN PRODUCTS 
 ON SALES.PRODUCT_ID=PRODUCTS.PRODUCT_ID
 GROUP BY CUSTOMERS.CUSTOMER_NAME 
 ORDER BY TOTAL_SALES DESC 
 LIMIT 3
  
  -- 8  
  
  SELECT * FROM ( SELECT CUSTOMERS.CUSTOMER_NAME,  
  SUM(SALES.QUANTITY* PRODUCTS.PRICE) AS TOTAL_SALES 
  FROM sales  
JOIN CUSTOMERS 
 ON SALES.CUSTOMER_ID=CUSTOMERS.CUSTOMER_ID  
 JOIN PRODUCTS 
 ON SALES.PRODUCT_ID=PRODUCTS.PRODUCT_ID 
 GROUP BY CUSTOMERS.CUSTOMER_NAME ) as new_table 
 WHERE TOTAL_SALES>50000 
  
  SELECT 
 CUSTOMERS.CUSTOMER_NAME, 
 SUM(SALES.QUANTITY* PRODUCTS.PRICE) AS TOTAL_SALES  
 FROM SALES 
 JOIN CUSTOMERS 
 ON SALES.CUSTOMER_ID=CUSTOMERS.CUSTOMER_ID  
 JOIN PRODUCTS 
 ON SALES.PRODUCT_ID=PRODUCTS.PRODUCT_ID
 GROUP BY CUSTOMERS.CUSTOMER_NAME 
 HAVING TOTAL_SALES>50000
 
 
 
 
  
  
  
  


 

 
 




