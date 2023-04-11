-- How much money did we make this year? 
SELECT ROUND(SUM(od.quantity*p.price),2) AS total_sales
FROM order_details od
INNER JOIN pizzas p
ON od.pizza_id = p.pizza_id;

-- Can we identify any seasonality in the sales?
-- Monthly sales of pizzas 
SELECT
	EXTRACT(MONTH FROM o.order_date) AS months,
	SUM(od.quantity*p.price) AS sales
FROM order_details AS od
JOIN orders AS o ON o.order_id = od.order_id
JOIN pizzas AS p ON p.pizza_id = od.pizza_id
GROUP BY months
ORDER BY sales DESC;

-- Sales per order date
SELECT
	o.order_date,
	SUM(od.quantity*p.price) AS sales
FROM order_details AS od
JOIN orders AS o ON o.order_id = od.order_id
JOIN pizzas AS p ON p.pizza_id = od.pizza_id
GROUP BY o.order_date
ORDER BY sales DESC;

-- Bonus Queries

-- Average price of pizza in this store
SELECT AVG(price) FROM pizzas;

-- Most expensive pizza in the store
SELECT pizza_id, 
	MAX(price) AS price
FROM pizzas
GROUP BY pizza_id
ORDER BY price DESC
LIMIT 1;

-- The sizes of pizza offered.
SELECT DISTINCT(size) FROM pizzas;

-- The most expensive pizzas per size in the store
SELECT 
    size as pizza_size, 
    MAX(price) as max_price
FROM pizzas
GROUP BY pizza_size
ORDER BY max_price DESC
LIMIT 1;

-- The best selling pizza size
SELECT COUNT(*) AS pizza_count,
    p.size AS pizza_size
FROM pizzas AS p
JOIN order_details AS od
ON p.pizza_id = od.pizza_id
GROUP BY pizza_size
ORDER BY pizza_count DESC
LIMIT 1;

-- Using CASE on price
SELECT 
    pizza_id, 
    price,
    CASE 
        WHEN price < 10 THEN 'Pizza costs less than $10'
        ELSE 'Pizza costs greater than $10' 
        END 
    AS cost_threshold 
FROM pizzas;

-- Total number of pizzas sold in the store
SELECT SUM(quantity) FROM order_details;