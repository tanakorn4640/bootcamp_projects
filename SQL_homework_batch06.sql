-- Restaurant Owners
-- 5 tables
-- 1x fact , 4x dimension
-- search google, how to add foreign key
-- write SQL 3-5 queries analyze data
-- 1x subquery / with

--- SQLITE command ---
.mode markdown
.header on


---------- Create Table ---------- 
--- Create Fact Table ---
CREATE Table fact_orders (
  order_id INT PRIMARY KEY,
  order_date VARCHAR(200), 
  staff_id INT,
  customer_id INT,
  store_id INT,
  menu_id INT,
  amount INT,
  total_sales REAL,
FOREIGN KEY(staff_id) REFERENCES dim_staff(staff_id),
FOREIGN KEY(customer_id) REFERENCES dim_customer(customer_id),
FOREIGN KEY(store_id) REFERENCES dim_store(store_id),
FOREIGN KEY(menu_id) REFERENCES dim_menu(menu_id)
);
  

--- Insert data into Fact Table 
INSERT INTO fact_orders VALUES
    (1, '2022-07-01', 101, 201, 302, 1, 3, 1000.00),
    (2, '2022-07-01', 101, 202, 302, 2, 1, 3000.50),
    (3, '2022-07-02', 104, 202, 302, 5, 1, 7000.30),
    (4, '2022-07-03', 105, 202, 301, 5, 4, 5000.00),
    (5, '2022-07-04', 102, 203, 303, 4, 2, 2000.20),
    (6, '2022-07-05', 103, 205, 303, 2, 2, 4000.80),
    (7, '2022-07-06', 103, 205, 301, 3, 2, 6000.90),
    (8, '2022-07-07', 105, 204, 301, 1, 5, 8000.00),
    (9, '2022-07-07', 104, 201, 302, 1, 5, 9000.00),
    (10, '2022-07-08', 104, 201, 303, 3, 5, 5555.10),
    (11, '2022-07-09', 102, 201, 301, 4, 3, 6789.00),
    (12, '2022-07-10', 105, 204, 302, 4, 4, 1234.00),
    (13, '2022-07-10', 105, 202, 301, 5, 3, 4416.00),
    (14, '2022-07-11', 101, 202, 302, 3, 4, 2244.00),
    (15, '2022-07-12', 103, 204, 303, 4, 3, 7749.70);



--- Create Table Dim1 ---
CREATE TABLE dim_staff (
    staff_id INT PRIMARY KEY,
    staff_gender VARCHAR(200),
    staff_firstname VARCHAR(200),
    staff_lastname VARCHAR(200),
    staff_status VARCHAR(200)
);

--- Insert data into Dim1 ---
INSERT INTO dim_staff VALUES
    (101, 'Mr.', 'Wesley', 'Fofana', 'full time'),
    (102, 'Mrs.', 'Xochitl', 'Gomez', 'part time'),
    (103, 'Mr.', 'Declan', 'Rice', 'full time'),
    (104, 'Mrs.', 'Minjeong', 'Kim', 'part time'),
    (105, 'Mrs.', 'Elizabeth', 'Olsen', 'part time');



--- Create Table dim2 ---
CREATE TABLE dim_customer (
    customer_id INT PRIMARY KEY,
    customer_gender VARCHAR(200),
    customer_firstname VARCHAR(200),
    customer_lastname VARCHAR(200),
    customer_email VARCHAR(200)
);

--- Insert data into dim 2 ---
INSERT INTO dim_customer VALUES
    (201, 'Mr.', 'Reech', 'James', 'reech.jame@email.com'),
    (202, 'Mr.', 'Kai', 'Havertz', 'kai.have@email.com'),
    (203, 'Mrs.', 'Wonyoung', 'Jang', 'wonyoung.jang@email.com'),
    (204, 'Mrs.', 'Sakura', 'Miyawaki', 'sakura.miya@email.com'),
    (205, 'Mrs.', 'Eunchae', 'Hong', 'eunchae.hong@email.com');



--- CREATE Table dim3 ---
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_region VARCHAR(200),
    store_country VARCHAR(200),
    store_city VARCHAR(200)
);

--- Insert date into dim3 ---
INSERT INTO dim_store VALUES
    (301, 'East asia', 'South Korea', 'Seoul'),
    (302, 'North America', 'United States', 'New york'),
    (303, 'East asia', 'Japan', 'Tokyo');
    


--- CREATE Table dim4 ---
CREATE TABLE dim_menu (
    menu_id INT PRIMARY KEY,
    menu_name VARCHAR(200),
    menu_price REAL
);

--- Insert data into dim4 ---
INSERT INTO dim_menu VALUES
    (1, 'Bibimbap', 10000.00),
    (2, 'Ribeye Steak', 15000.50),
    (3, 'Tonkotsu Ramen', 20000.00),
    (4, 'Bulgogi', 8000.20),
    (5, 'Fried Chicken Curry Rice', 7000.00);



--- 4 Queries ---
--- Queries 1 Top 3 for the most customers spender
SELECT
    dcus.customer_id AS 'customerId',
    dcus.customer_gender || ' ' || dcus.customer_firstname AS 'customers_firstname',
    dcus.customer_lastname AS 'customers_lastname',
    dcus.customer_email AS 'customers_email',
    SUM(ord.total_sales) AS 'total'
FROM dim_customer AS 'dcus'
JOIN fact_orders AS 'ord' ON dcus.customer_id = ord.customer_id
GROUP BY 1
ORDER BY 5 DESC
LIMIT 3;


--- Queries 2 Tonkotsu Ramen sales in each country ---
WITH ord AS(
  SELECT
      store_id,
      menu_id,
      amount,
      total_sales
  FROM orders
), dme AS(
    SELECT
      menu_id,
      menu_name,
      menu_price  
  FROM dim_menu
), dst AS (
  SELECT *
  FROM dim_store 
)


SELECT
    dst.store_country AS 'country',
    dst.store_city AS 'city',
    dme.menu_name AS 'menu',
    dme.menu_price AS 'price',
    SUM(ord.amount) AS 'amount',
    SUM(ord.total_sales) AS 'total'
FROM fact_orders AS 'ord'
JOIN dim_menu AS 'dme' ON ord.menu_id = dme.menu_id
JOIN dim_store AS 'dst' ON ord.store_id = dst.store_id
WHERE dme.menu_name = 'Tonkotsu Ramen'
GROUP BY 1
ORDER BY 5 DESC;


--- Queries 3 If staff sales more than 20000 will receive a bonus 10% from sales  ---
WITH ord AS(
  SELECT
      staff_id,
      menu_id,
      total_sales
  FROM fact_orders
), dsf AS (
  SELECT
    staff_id,
    staff_gender,
    staff_firstname,
    staff_lastname,
    staff_status
  FROM dim_staff
), dme AS (
    SELECT *
    FROM dim_menu
)
  

SELECT 
    dsf.staff_gender || ' ' || dsf.staff_firstname AS 'staffs_firstname',
    dsf.staff_lastname AS 'staffs_lastname',
    dsf.staff_status AS 'staffs_status',
    dme.menu_name AS 'menuname',
    dme.menu_price AS 'menuprice',
    SUM(ord.total_sales) AS 'totalsales',
  CASE
    WHEN SUM(ord.total_sales) > 20000 THEN SUM(ord.total_sales) * 10/100
    ELSE 'No bonus'
  END AS 'bonus' 
FROM fact_orders AS 'ord'
JOIN dim_staff AS 'dsf' ON ord.staff_id = dsf.staff_id
JOIN dim_menu AS 'dme' ON ord.menu_id = dme.menu_id
GROUP BY 1;




    