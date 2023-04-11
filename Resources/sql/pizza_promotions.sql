-- Are there any pizzas we should take of the menu, or any promotions we could leverage?

-- Pizzas with least sales
SELECT od.pizza_id,
	ROUND(p.price*COUNT(od.pizza_id),2) AS sales
From order_details AS od
LEFT JOIN pizzas AS p
ON od.pizza_id = p.pizza_id
GROUP BY od.pizza_id, p.price
ORDER BY sales
LIMIT 5;

-- Pizzas with least orders
SELECT pizza_id, 
    SUM(quantity) AS quantity
FROM order_details
GROUP BY pizza_id
ORDER BY quantity;

-- Number of pizzas bought per date, per time
SELECT
	SUM(od.quantity) AS quantity,
	o.order_time, 
	o.order_date,
	EXTRACT (dow from o.order_date) AS day,
	EXTRACT (MONTH from o.order_date) AS month
FROM order_details AS od
JOIN orders AS o ON od.order_id = o.order_id
GROUP BY o.order_date, o.order_time
ORDER BY quantity DESC

-- Bonus queries
-- Number of pizzas sold per pizza type per size
SELECT DISTINCT
	od.pizza_id AS pizza_type, 
	SUM(od.quantity) AS quantity,
	p.size
FROM order_details AS od
JOIN pizzas AS p
ON od.pizza_id = p.pizza_id
GROUP BY od.pizza_id, p.size, od.quantity
ORDER BY quantity DESC;

-- Best selling pizza
SELECT od.pizza_id,
	ROUND(p.price*COUNT(od.pizza_id),2) AS sales
From order_details AS od
LEFT JOIN pizzas AS p
ON od.pizza_id = p.pizza_id
GROUP BY od.pizza_id, p.price
ORDER BY sales DESC
LIMIT 5;