
-- How many customers do we have each day? Are there any peak hours?

-- Number of customers visiting the store each day
SELECT 
	order_date, 
	COUNT(*) AS orders_received
FROM orders
GROUP BY order_date
ORDER BY order_date;

-- Busiest times of day in the store
SELECT 
	EXTRACT(HOUR FROM order_time) AS order_hour, 
	COUNT(*) AS orders_received
FROM orders
GROUP BY order_hour
ORDER BY orders_received DESC
LIMIT 3;


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



