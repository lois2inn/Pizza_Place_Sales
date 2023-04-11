-- How many pizzas are typically in an order? Do we have any bestsellers?

-- Number of pizzas typically in an order
SELECT 
	SUM(od.pizza_count)/COUNT(DISTINCT(order_id))
FROM(
	SELECT 
		order_id, 
		COUNT(*) AS pizza_count
	FROM order_details
	GROUP BY order_id) od;

-- Best selling pizza
SELECT 
	pizza_id, 
	COUNT(*) AS pizza_count
FROM order_details
GROUP BY pizza_id
ORDER BY pizza_count DESC
LIMIT 1;

-- Bonus Queries:
-- The maximum length of a value in the column.
SELECT MAX(LENGTH(name)) as max_col_len from pizza_types;

