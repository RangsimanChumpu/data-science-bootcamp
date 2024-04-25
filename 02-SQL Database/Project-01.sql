--Create three tables and use at least 3 function in sql.

CREATE TABLE customers (
  customer_id text primary key,
  name text,
  customer_city text
);

INSERT INTO customers 
VALUES (01 , 'aden', 'leeds'), 
      (02, 'amill', 'sheffieid'), 
      (03 , 'aaron', 'bristol'), 
      (04, 'amir', 'coventry'), 
      (05, 'alan', 'sunderland');

CREATE TABLE orders (
  order_id text primary key,
  manu_id text,
  customer_id text,
  order_date date,
  order_qty int 
);

INSERT INTO orders 
VALUES  (1 , 002, 02, '2022-11-15', 2),
        (2 , 003, 03, '2022-11-16', 3), 
        (3 , 001, 04, '2022-11-22', 3), 
        (4 , 005, 05, '2022-11-23', 2), 
        (5 , 004, 01, '2022-12-01', 2),
        (6 , 002, 02, '2022-12-02', 1), 
        (7 , 003, 03, '2022-12-16', 1), 
        (8 , 005, 04, '2022-12-17', 3), 
        (9 , 001, 05, '2023-01-18', 4), 
        (10 , 002, 01, '2023-01-19', 2),
        (11 , 002, 02, '2023-01-15', 2), 
        (12 , 005, 03, '2023-01-16', 3), 
        (13 , 004, 04, '2023-01-17', 3), 
        (14 , 002, 05, '2023-02-18', 2), 
        (15 , 001, 01, '2023-02-19', 2),
        (16 , 002, 02, '2023-03-15', 2), 
        (17 , 003, 03, '2023-03-16', 3), 
        (18 , 005, 04, '2023-03-17', 2), 
        (19 , 004, 05, '2023-03-18', 1), 
        (20 , 002, 01, '2023-03-19', 2);
  
CREATE TABLE manus (
  manu_id text primary key,
  manu_name text,
  price int
);

INSERT INTO manus
VALUES (001 , 'burger', 150),
      (002 , 'pizza', 250),
      (003 , 'hotdog', 120),
      (004 , 'fries', 100),
      (005 , 'sandwich', 160);

WITH orders_customers AS (
  SELECT customer_id,
         manu_id,
         order_qty
  FROM orders
), total_p AS (
  SELECT 
    oc.customer_id,
    cu.name,
    cu.customer_city,
    ma.manu_name,
    ma.price,
    COUNT(oc.order_qty),
    oc.order_qty * ma.price AS total_price
  FROM orders_customers AS oc
  JOIN customers AS cu ON oc.customer_id = cu.customer_id
  JOIN manus     AS ma ON ma.manu_id = oc.manu_id
  GROUP BY 1, 4
)

SELECT 
  name,
  SUM(total_price),
  CASE 
    WHEN SUM(total_price) >= 1000 THEN "customer A"
    WHEN SUM(total_price) >= 800 THEN "customer B"
  ELSE "customer C"
  END AS customers_class
FROM total_p
GROUP BY 1
ORDER BY 2 DESC
