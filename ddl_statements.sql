CREATE TABLE customer(
	-- column_name DATATYPE <CONSTRAINTS>,
	customer_id SERIAL PRIMARY KEY, -- PRIMARY KEY specifies BOTH UNIQUE AND NOT NULL
	first_name VARCHAR(50) NOT NULL, -- NOT NULL means that this COLUMN cannot be EMPTY
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(50),
	address VARCHAR(100),
	loyalty_member BOOLEAN DEFAULT FALSE
);

-- Add column to a table
-- ALTER TABLE table_name_to_alter ADD COLUMN new_col_name DATATYPE
ALTER TABLE customer 
ADD COLUMN username VARCHAR(20);

-- Change DataType of a Column
-- change email datatype to VARCHAR(30)
-- ALTER TABLE table_name ALTER COLUMN col_name TYPE NEW_DATATYPE
ALTER TABLE customer 
ALTER COLUMN email TYPE VARCHAR(30);

-- Change the name of a column
-- ALTER TABLE table_name RENAME COLUMN current_col_name TO new_col_name
ALTER TABLE customer 
RENAME COLUMN email TO email_address;

SELECT *
FROM customer;



-- Create Order Table with a Foreign Key to Customer table
CREATE TABLE order_(
	order_id SERIAL PRIMARY KEY,
	order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	date_shipped TIMESTAMP,
	customer_id INTEGER NOT NULL,
	-- Syntax: FOREIGN KEY(column_in_domestic_table) REFERENCES foreign_table_name(column_in_foreign_table)
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

-- To delete a table, use DROP
-- DROP TABLE IF EXISTS table_name_to_drop 
DROP TABLE IF EXISTS "order";


-- Create Order-Product Table (Join Table between the Order and Product table)
CREATE TABLE order_product(
	order_id INTEGER NOT NULL,
	FOREIGN KEY(order_id) REFERENCES order_(order_id),
	product_id INTEGER NOT NULL
--	FOREIGN KEY(product_id) REFERENCES product(product_id) -- CANNOT REFERENCE A TABLE THAT DOES NOT EXIST!
);


-- Create the Product Table AND THEN alter order_pruduct to add foreign KEY 
CREATE TABLE product(
	product_id SERIAL PRIMARY KEY,
	prod_name VARCHAR(25),
	description VARCHAR(200),
	price NUMERIC(5,2),
	quantity INTEGER
);

-- Alter order_product table to add to foreign key
ALTER TABLE order_product 
ADD FOREIGN KEY(product_id) REFERENCES product(product_id);


-- Rename a table
-- ALTER TABLE table_name RENAME TO new_name;
ALTER TABLE product 
RENAME TO item;


-- create a test table to eventuall drop
CREATE TABLE test(
	test_id SERIAL PRIMARY KEY,
	col_1 INTEGER,
	col_2 BOOLEAN
);


-- Drop a column
-- ALTER TABLE table_name DROP COLUMN col_name;
-- BE VERY CAREFUL WITH DROP - NO UNDOING!
ALTER TABLE test 
DROP COLUMN col_1;

SELECT *
FROM test;


-- Remove a table completely use DROP TABLE
-- *IF EXISTS will only drop if the table exists, otherwise will skip
DROP TABLE IF EXISTS test;




-- Create a seller table
CREATE TABLE seller(
	seller_id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	description VARCHAR(200),
	email VARCHAR(100),
	address VARCHAR(100)
);

-- Create a category table
CREATE TABLE category(
	category_id SERIAL PRIMARY KEY,
	name VARCHAR(20),
	color VARCHAR(6)
);


-- ADD seller_id and category_id to Product TABLE 
--ALTER TABLE product 
--ADD COLUMN seller_id INTEGER NOT NULL;
--
--ALTER TABLE product 
--ADD COLUMN category_id INTEGER NOT NULL;
--
-- Add foreign keys to those new columns
--ALTER TABLE product 
--ADD FOREIGN KEY(seller_id) REFERENCES seller(seller_id);
--
--ALTER TABLE product 
--ADD FOREIGN KEY(category_id) REFERENCES category(category_id);




