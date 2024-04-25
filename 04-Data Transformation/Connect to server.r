## Create 3-5 dataframe (write table to Server)

# Import Library
library(RPostgreSQL)
library(tidyverse)

# Connect
con <- dbConnect(
  PostgreSQL(),
  host = "floppy.db.elephantsql.com",
  dbname = "bjyengyo",
  user = "bjyengyo",
  password = "bp7QkbM-ZZBf9tAP4STs4kQlpJbzqPi1",
  port = 5432
)
con

#. Create customers table
customers <- tribble(
  ~customer_id, ~name, ~customer_city,
  01 , 'aden', 'leeds',
  02, 'amill', 'sheffieid',
  03 , 'aaron', 'bristol',
  04, 'amir', 'coventry',
  05, 'alan', 'sunderland'
)

# Create orders table
orders <- tribble(
  ~order_id, ~manu_id, ~customer_id, ~order_date, ~order_qty,
  1 , 002, 02, '2022-11-15', 2,
  2 , 003, 03, '2022-11-16', 3,
  3 , 001, 04, '2022-11-22', 3, 
  4 , 005, 05, '2022-11-23', 2, 
  5 , 004, 01, '2022-12-01', 2,
  6 , 002, 02, '2022-12-02', 1, 
  7 , 003, 03, '2022-12-16', 1, 
  8 , 005, 04, '2022-12-17', 3, 
  9 , 001, 05, '2023-01-18', 4, 
 10 , 002, 01, '2023-01-19', 2,
 11 , 002, 02, '2023-01-15', 2, 
 12 , 005, 03, '2023-01-16', 3, 
 13 , 004, 04, '2023-01-17', 3, 
 14 , 002, 05, '2023-02-18', 2, 
 15 , 001, 01, '2023-02-19', 2,
 16 , 002, 02, '2023-03-15', 2, 
 17 , 003, 03, '2023-03-16', 3, 
 18 , 005, 04, '2023-03-17', 2, 
 19 , 004, 05, '2023-03-18', 1, 
 20 , 002, 01, '2023-03-19', 2
)

# create manus table
manus <- tribble(
  ~manu_id , ~ manu_name, ~price,
  001 , 'burger', 150,
  002 , 'pizza', 250,
  003 , 'hotdog', 120,
  004 , 'fries', 100,
  005 , 'sandwich', 160
)

# bring those table to our database
dbWriteTable(con, "customers", customers)
dbWriteTable(con, "orders", orders)
dbWriteTable(con, "manus", manus)

# list table names, columns, execute code
dbListTables(con)
dbListFields(con, "customers")
dbGetQuery(con, "select * from customers
           where name = 'alan'")
