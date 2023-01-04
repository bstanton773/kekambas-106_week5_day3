-- Add a row to the customer

INSERT INTO customer(
	first_name, 
	last_name,
	email_address,
	address,
	loyalty_member,
	username 
) VALUES (
	'Robert',
	'Flobbert',
	'robbert.flobbert@gobbert.com',
	'123 Real Street',
	TRUE,
	'robbertf'
);

SELECT *
FROM customer;


INSERT INTO customer(
	first_name, 
	last_name,
	email_address,
	address,
	loyalty_member,
	username 
) VALUES (
	'Freddie',
	'Kruger',
	'freddie@scarytown.com',
	'321 Elm Street',
	TRUE,
	'freddiek'
), (
	'Jason',
	'Vorhees',
	'jvorhees@scarytown.com',
	'123 Elm Street',
	FALSE,
	'jason'
);


INSERT INTO customer(
	first_name,
	last_name
) VALUES (
	'Michael',
	'Jordan'
);

SELECT *
FROM customer;


-- Create a New Seller
INSERT INTO seller(
	name,
	description,
	email,
	address
) VALUES (
	'New Egg',
	'Computer Parts',
	'newegggothacked@gmail.com',
	'555 Circle Drive'
);

SELECT *
FROM seller;

INSERT INTO category (
	name,
	color
) VALUES (
	'rapberry pi',
	'red'
),(
	'usb-drives',
	'blue'
),(
	'water-bottles',
	'clear'
);

SELECT *
FROM category;

INSERT INTO customer(
	first_name,
	last_name
) VALUES (
	'Michael',
	'Jordan'
);

SELECT * FROM customer;


-- DELETE FROM table_name WHERE condition;


DELETE FROM customer 
WHERE customer_id = 5;

SELECT *
FROM customer;

DELETE FROM customer 
WHERE loyalty_member = FALSE;


INSERT INTO customer(
	first_name, 
	last_name,
	email_address,
	address,
	loyalty_member,
	username 
) VALUES (
	'Jason',
	'Vorhees',
	'jvorhees@scarytown.com',
	'123 Elm Street',
	FALSE,
	'jason'
);

SELECT *
FROM customer;

DELETE FROM customer 
WHERE customer_id > 5;


-- A DELETE WITHOUT A WHERE WILL DELETE ALL ROWS! ** CANNOT UNDO
DELETE FROM customer;


SELECT *
FROM customer;
-- UPDATE table_name SET col_name = value WHERE condition
UPDATE customer
SET email_address = 'freddie@happytown.com'
WHERE customer_id = 2;

SELECT *
FROM customer;


-- AN UPDATE WITHOUT A SET WILL UPDATE ALL ROWS! ** CANNOT UNDO
UPDATE customer 
SET loyalty_member = FALSE;

SELECT *
FROM customer;


INSERT INTO customer(
	first_name, 
	last_name,
	email_address,
	address,
	loyalty_member,
	username 
) VALUES (
	'Jason',
	'Vorhees',
	'jvorhees@scarytown.com',
	'123 Elm Street',
	FALSE,
	'jason'
);

ALTER SEQUENCE customer_customer_id_seq
RESTART WITH 3;


INSERT INTO customer(
	first_name, 
	last_name,
	email_address,
	address,
	loyalty_member,
	username 
) VALUES (
	'Patrick',
	'Mahomes',
	'pmahomes@nfl.com',
	'123 Elm Street',
	FALSE,
	'patrick'
);

SELECT *
FROM customer;


SELECT *
FROM customer 
WHERE address LIKE '%Elm%';


UPDATE customer 
SET loyalty_member = TRUE
WHERE address LIKE '%Elm%';

SELECT *
FROM customer;

