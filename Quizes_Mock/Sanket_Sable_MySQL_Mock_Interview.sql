/*
1. CREATE A DATABASE - E-COMMERCE SYSTEM
2. CREATE 5 TABLES USING MIN 5 ATTRIBUTES, INCLUDING VARIOUS TYPES OF DATATYPES & MULTIPLE CONSTRAINTS
3. INSERT 5 RECORDS IN EACH TABLES & DO PROPER DOCUMENTATIONS
4. WRITE BASIC QUERIES FOR EACH TABLE INCLUDING-
	--> SHOW DATA 
    --> TRUNCATE DROP
    --> ALTER, UPDATE, DELETE
    --> RENAME
5. DO PROPER ANALYSIS ABOUT EACH TABLES, GENERATE REAL WORLD BASED SITUATION AND WRITE MISLENEOUS QUERIES INCLUDING
	--> FUNCTIONS, OPERATORS, ALIAS, CLAUSES
*/

CREATE DATABASE E_COMMERCE_SYSTEM;

USE E_COMMERCE_SYSTEM;

-- TABLE 1-----------------------------------------------------------------------------------------------------------
CREATE TABLE USERS(
USER_ID INT AUTO_INCREMENT PRIMARY KEY,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
EMAIL VARCHAR(40),
MOBILE_NUMBER VARCHAR(12)
);

INSERT INTO USERS( FIRST_NAME, LAST_NAME, EMAIL, MOBILE_NUMBER )
VALUES
('SANKET','SABLE','sanketsable123@gmail.com','8291621013'),
('YASH','GARUD','yashgarud123@gmail.com','8489486668'),
('SHIVAM','SINGH','shivamsingh123@gmail.com','9984944664'),
('ANJALI','MALI','anjalimali123@gmail.com','7848662261'),
('MUKASHSHAF','MOMIN','mukashshafmomin123@gmail.com','8468684667');

SELECT * FROM USERS;

DROP TABLE USERS;

TRUNCATE USERS;

-- SELECT USING COLUMN NAME
SELECT FIRST_NAME, MOBILE_NUMBER FROM USERS;

-- ADD NEW COLUMN
ALTER TABLE USERS
ADD COLUMN AGE INT DEFAULT '23';

SET SQL_SAFE_UPDATES = 0;
SET FOREIGN_KEY_CHECKS = 0;

-- UPDATE MOBILE NUMBER
UPDATE USERS
SET MOBILE_NUMBER = 9892820887
WHERE EMAIL LIKE '%ANKE%';

-- DELETE ANY RECORD
DELETE FROM USERS
WHERE LAST_NAME LIKE '%AL%';

-- RENAME COLUMN
ALTER TABLE USERS
RENAME COLUMN MOBILE_NUMBER TO PHONE;

-- TABLE 2-----------------------------------------------------------------------------------------------------
CREATE TABLE PRODUCTS(
PRODUCT_ID INT PRIMARY KEY AUTO_INCREMENT,
NAME VARCHAR(50),
DESCRIPTION VARCHAR(200),
PRICE VARCHAR(10),
QUANTITY VARCHAR(10) -- PER BOX
);

INSERT INTO PRODUCTS( NAME, DESCRIPTION, PRICE, QUANTITY )
VALUES 
('SMART WATCH','ROUGH AND TOUGH, WATER RESISTANCE AND ACCURATE IN FITNESS','2999','30'),
('BLUETOOTH NECKBAND','RELIABLE AND NOISE CANCELLATION SYSTEM','899','20'),
('BLUETOOTH EARBUDS','LOW LATENCY, WATER RESISTENCE AND NOISE CANCELLATION','1200','26'),
('SMART PHONES','6.9 INCH DISPLAY, 128GB STORAGE','12999','25'),
('LAPTOPS','GAMING LAPTOP WITH NVIDIA GRAPHICS OF 3040 512GB SSD','48999','45');

SELECT * FROM PRODUCTS;

DROP TABLE PRODUCTS;

TRUNCATE PRODUCTS;

-- SELECT USING COLUMN NAME
SELECT NAME, PRICE FROM PRODUCTS;

-- ADD NEW COLUMN
ALTER TABLE PRODUCTS
ADD COLUMN WARRENTY VARCHAR(20) DEFAULT '12 MONTHS';

UPDATE PRODUCTS
SET QUANTITY = 45
WHERE PRICE LIKE '%299%';

DELETE FROM PRODUCTS
WHERE DESCRIPTION LIKE '%ITH%';

ALTER TABLE PRODUCTS 
RENAME COLUMN QUANTITY TO QUANTITY_PER_BOX;

-- TABLE 3---------------------------------------------------------------------------------------------------------
CREATE TABLE ORDERS(
ORDER_ID INT PRIMARY KEY AUTO_INCREMENT,
USER_ID INT,
ORDER_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
STATUS VARCHAR(30),
TOTAL_AMOUNT VARCHAR(30),
FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID)
);

INSERT INTO ORDERS( USER_ID, STATUS, TOTAL_AMOUNT )
VALUES
(1,'PROCESSING','15000'),
(2,'SHIPPED','20000'),
(3,'DELIVERED','50000'),
(4,'SHIPPED','13000'),
(5,'DELIVERED','55000');

SELECT * FROM ORDERS;

DROP TABLE ORDERS;

TRUNCATE ORDERS;

-- SELECT USING COLUMN NAME
SELECT USER_ID, TOTAL_AMOUNT FROM ORDERS;

-- ADD NEW COLUMN
ALTER TABLE ORDERS
ADD COLUMN DISCOUNT VARCHAR(20) DEFAULT '10% DISCOUNT';

UPDATE ORDERS
SET STATUS = 'SHIPPED'
WHERE TOTAL_AMOUNT = 20000;

DELETE FROM ORDERS
WHERE TOTAL_AMOUNT LIKE '500%';

ALTER TABLE ORDERS 
RENAME COLUMN STATUS TO ORDER_STATUS;

-- TABLE 4------------------------------------------------------------------------------------------
CREATE TABLE ORDER_ITEMS(
ORDER_ITEM_ID INT PRIMARY KEY AUTO_INCREMENT,
ORDER_ID INT NOT NULL,
PRODUCT_ID INT NOT NULL,
QUANTITY VARCHAR(20),
PRICE_PER_UNIT VARCHAR(20),
TOTAL_AMOUNT VARCHAR(10),
FOREIGN KEY(ORDER_ID) REFERENCES ORDERS(ORDER_ID),
FOREIGN KEY(PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID) 
);

INSERT INTO ORDER_ITEMS( ORDER_ID, PRODUCT_ID, QUANTITY, PRICE_PER_UNIT, TOTAL_AMOUNT)
VALUES
(1,1,'2','2999','5998'),
(2,4,'3','12999','38997'),
(3,2,'6','899','5394'),
(4,3,'5','1200','6000'),
(5,5,'4','48999','195996');

SELECT * FROM ORDER_ITEMS;

DROP TABLE ORDER_ITEMS;

TRUNCATE ORDER_ITEMS;

-- SELECT USING COLUMN NAME
SELECT ORDER_ID, TOTAL_AMOUNT FROM ORDER_ITEMS;

-- ADD NEW COLUMN
ALTER TABLE ORDER_ITEMS
ADD COLUMN DISCOUNT VARCHAR(20) DEFAULT '10%';

UPDATE ORDER_ITEMS
SET QUANTITY = 10
WHERE TOTAL_AMOUNT LIKE '%394';

DELETE FROM ORDER_ITEMS
WHERE QUANTITY = '10';

ALTER TABLE ORDER_ITEMS 
RENAME COLUMN QUANTITY TO ORDER_QUANTITY;

-- TABLE 5------------------------------------------------------------------------------------------------------------------------
CREATE TABLE CATEGORIES(
CATEGORY_ID INT PRIMARY KEY AUTO_INCREMENT,
PRODUCT_ID INT,
NAME VARCHAR(50),
DESCRIPTION VARCHAR(200),
STOCK_AVAILABLE INT,
RESTOCK_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY(PRODUCT_ID) REFERENCES PRODUCTS(PRODUCT_ID)
);

INSERT INTO CATEGORIES( PRODUCT_ID, NAME, DESCRIPTION, STOCK_AVAILABLE)
VALUES
(1,'WEARABALES','ROUGH AND TOUGH, WATER RESISTANCE AND ACCURATE IN FITNESS',12),
(2,'KDM','RELIABLE AND NOISE CANCELLATION SYSTEM',10),
(3,'NOISE','LOW LATENCY, WATER RESISTENCE AND NOISE CANCELLATION',8),
(4,'SAMSUNG','6.9 INCH DISPLAY, 128GB STORAGE',5),
(5,'ACER','GAMING LAPTOP WITH NVIDIA GRAPHICS OF 3040 512GB SSD',3);

SELECT * FROM CATEGORIES;

DROP TABLE CATEGORIES;

TRUNCATE CATEGORIES;

-- SELECT USING COLUMN NAME
SELECT NAME, DESCRIPTION FROM CATEGORIES;

-- ADD NEW COLUMN
ALTER TABLE CATEGORIES
ADD COLUMN WARRENTY VARCHAR(20) DEFAULT '12 MONTHS';

UPDATE CATEGORIES
SET NAME = 'BOAT'
WHERE STOCK_AVAILABLE = 10 ;

DELETE FROM CATEGORIES
WHERE DESCRIPTION LIKE '%TENC%';

ALTER TABLE CATEGORIES 
RENAME COLUMN NAME TO CATEGORY_NAME;