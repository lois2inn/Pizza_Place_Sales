-- Drop tables if exists
DROP TABLE orders CASCADE;
DROP TABLE pizza_types CASCADE;
DROP TABLE pizzas;
DROP TABLE order_details;


CREATE TABLE orders (
	order_id INTEGER PRIMARY KEY,
	order_date DATE,
	order_time TIME
);

CREATE TABLE pizza_types (
	pizza_type_id VARCHAR(30) PRIMARY KEY,
	name TEXT,
	category VARCHAR(20),
	ingredients TEXT
);

CREATE TABLE pizzas(
	pizza_id VARCHAR(30) PRIMARY KEY,
	pizza_type_id VARCHAR(30) REFERENCES pizza_types(pizza_type_id),
	size VARCHAR(5),
	price DECIMAL
);

CREATE TABLE order_details(
	order_details_id INTEGER PRIMARY KEY,
	order_id INTEGER REFERENCES orders(order_id),
	pizza_id VARCHAR(30) REFERENCES pizzas(pizza_id),
	quantity INTEGER
);