
-- How many customers do we have each day? Are there any peak hours?

-- Exploring the orders table

-- Get all records from the table
SELECT * FROM orders;

-- Number of customers visiting the store each day
SELECT 
	order_date, 
	COUNT(*) AS orders_received
FROM orders
GROUP BY order_date
ORDER BY order_date;

-- Peak hours per day
SELECT 
	order_date, 
	EXTRACT(HOUR FROM order_time) AS order_hour, 
	COUNT(*) AS  orders_received
FROM orders 
GROUP BY order_date, order_hour
ORDER BY order_date ASC, orders_received DESC;

-- Bonus Queries
-- Describe the table structure
SELECT 
   table_name, 
   column_name, 
   data_type 
FROM 
   information_schema.columns
WHERE 
   table_name = 'orders';

-- The date with maximum orders
SELECT 
	order_date,
	COUNT(*) AS orders_received
FROM orders
GROUP BY order_date
ORDER BY orders_received DESC
LIMIT 1;

-- Extract hour from timestamp
SELECT 
	EXTRACT(HOUR FROM order_time) AS order_hour
FROM orders;

-- Busiest times of day in the store (overall)
SELECT 
	EXTRACT(HOUR FROM order_time) AS order_hour, 
	COUNT(*) AS orders_received
FROM orders
GROUP BY order_hour
ORDER BY orders_received DESC
LIMIT 3;



