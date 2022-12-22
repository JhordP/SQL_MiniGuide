CREATE DATABASE SProd;
USE Sprod;

CREATE TABLE customer (
customer_id INT IDENTITY PRIMARY KEY,
customer_name VARCHAR (15),
customer_lastname VARCHAR(30),
customer_gender VARCHAR(1)
)

INSERT INTO customer(customer_name, customer_lastname, customer_gender) VALUES('Mario', 'Lara', 'M');
SELECT TOP 10 customer_name, customer_lastname FROM customer/* WHERE customer_gender='F'*/;
SELECT TOP 5 customer_name, customer_lastname, customer_avrgBalance FROM customer WHERE customer_avrgBalance>200;
SELECT TOP 5 * FROM customer WHERE customer_avrgBalance>200;

SELECT customer_name, customer_lastname, customer_tel, customer_address INTO jhordanytable FROM customer 
WHERE customer_address IS NOT NULL AND customer_name IS NOT NULL AND customer_tel IS NOT NULL AND customer_name <> '';

/*El mismo de arriba pero optimizado y sin insertar en otra tabla la data*/
SELECT customer_name, customer_lastname, customer_tel, customer_address FROM customer 
WHERE customer_address IS NOT NULL AND customer_address <> ' ' AND (customer_name IS NOT NULL AND customer_name <> ' ')
AND (customer_tel IS NOT NULL AND customer_tel <> 0)


SELECT * FROM customer;
SELECT DISTINCT customer_avrgBalance, customer_tel, customer_address FROM customer;
SELECT * FROM customer ORDER BY customer_name ASC;

SELECT * FROM jhordanytable

ALTER TABLE customer DROP COLUMN client_bill;
ALTER TABLE customer ADD customer_address VARCHAR(30);

UPDATE customer SET customer_address='STO DGO' WHERE customer_id=3 OR customer_id=7 OR customer_id=9 OR customer_id=10;
UPDATE customer SET customer_address=NULL;
DELETE FROM client WHERE client_id=3;


SELECT * FROM customer;
DROP TABLE jhordanytable;