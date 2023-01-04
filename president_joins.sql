-- Create a customer table
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(25),
	last_name VARCHAR(25),
	email VARCHAR(50),
	address VARCHAR(50),
	city VARCHAR(20),
	state VARCHAR(2),
	zipcode VARCHAR(5)
);

SELECT *
FROM customer;


-- Create an Order table
CREATE TABLE order_(
	order_id SERIAL PRIMARY KEY,
	order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	amount NUMERIC(5,2),
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

SELECT *
FROM order_;


-- DML - Inserting data into the customer table
INSERT INTO customer(first_name, last_name, email, address, city, state, zipcode)
VALUES('George', 'Washington', 'firstpres@usa.gov', '3200 Mt. Vernon Way', 'Mt. Vernon', 'VA', '87522'),
('John', 'Adams', 'jadams@whitehouse.org', '1234 W Presidential Place', 'Quincy', 'MA', '43592'),
('Thomas', 'Jefferson', 'iwrotethedeclaration@freeamerica.org', '555 Independence Drive', 'Charleston', 'VA', '34532'),
('James', 'Madison', 'fatherofconstitution@prez.io', '8345 E Eastern Ave', 'Richmond', 'VA', '43538'),
('James', 'Monroe', 'jmonroe@usa.gov', '3682 N Monroe Parkway', 'Chicago', 'IL', '60623');

SELECT *
FROM customer;

-- Insert some orders
INSERT INTO order_(amount, customer_id)
VALUES (22.33, 2);


INSERT INTO order_(amount, customer_id)
VALUES (67.83, 2);


INSERT INTO order_(amount, customer_id)
VALUES (89.53, 1);

INSERT INTO order_(amount, customer_id)
VALUES (72.87, 4);

INSERT INTO order_(amount, customer_id)
VALUES (99.99, null);

INSERT INTO order_(amount, customer_id)
VALUES (54.34, null);


SELECT *
FROM order_;

SELECT *
FROM customer;


SELECT first_name, last_name, email
FROM customer 
WHERE customer_id = 2;


SELECT amount, order_date
FROM order_ 
WHERE customer_id = 2;


-- USING JOINS - we can combine the data from multiple tables on a common field
-- SELECT col1, col2, etc. (can be from either table)
-- FROM table_name_1 (will be cosidered the LEFT table)
-- JOIN table_name_2 (will be considered the RIGHT table)
-- ON table_name_1.col_name = table_name_2.col_name (where one of the col_name is a FK to other col_name)

-- Inner Join - Most common join -- default JOIN i.e. do not have to specifiy INNER
SELECT first_name, last_name, email, amount, order_date, order_.customer_id AS ord_cust_id, customer.customer_id AS cust_cust_id, order_.order_id AS ord_ord_id 
FROM customer 
JOIN order_ 
ON customer.customer_id = order_.customer_id;

--SELECT first_name, order_date, amount
--FROM customer 
--JOIN order_ 
--ON customer.customer_id = order_.customer_id;

-- INNER JOIN
SELECT *
FROM customer
JOIN order_ 
ON customer.customer_id = order_.customer_id;

-- FULL JOIN
SELECT *
FROM customer 
FULL JOIN order_ 
ON customer.customer_id = order_.customer_id;

-- LEFT JOIN
SELECT *
FROM customer -- LEFT Table
LEFT JOIN order_ -- RIGHT Table
ON customer.customer_id = order_.customer_id;

-- RIGHT JOIN
SELECT *
FROM customer -- LEFT Table
RIGHT JOIN order_ -- RIGHT Table
ON customer.customer_id = order_.customer_id;


SELECT state, SUM(amount)
FROM customer 
JOIN order_ 
ON customer.customer_id = order_.customer_id 
WHERE state LIKE 'M%'
GROUP BY state;


-- Alias Table Names 
SELECT c.customer_id, c.first_name, c.last_name, o.amount, o.order_date
FROM customer c
JOIN order_ o 
ON c.customer_id = o.customer_id;




