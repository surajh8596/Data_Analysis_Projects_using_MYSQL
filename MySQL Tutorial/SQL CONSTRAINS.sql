-- THERE ARE TOTALLY 8 CONTRAINS IN SQL, NOT NULL, PRIMARY KEY, FOREIGN KEY, UNIQUE, DEFUALT, CHECK, AUTO INCREAMENT.
-- CONSTRAINTS 
	-- 1. Data type constraint - Specifies the data type that can be inserted in tha column
    -- 2. Nullability constraint - Whether the values in the columns are null or not
    -- 3. Default constraint - Setting some default values
    -- 4. Primary key constraint - This should be unique and not null
    -- 5. Foreign key constraint - This used to specify the relationship to other table
    -- 6. Unique constraint - Values entered are unique, no duplicates allowed
    -- 7. Check constraint - check the condition 
    -- 8. Auto increament constraint


CREATE DATABASE ONLINE_SELLER;

USE ONLINE_SELLER;

CREATE TABLE PRODUCTS (
ID INT PRIMARY KEY,
PRODUCT_NAME VARCHAR(30) NOT NULL,
BRAND_NAME VARCHAR(20) NOT NULL);

SELECT * FROM PRODUCTS;

INSERT INTO PRODUCTS
VALUES(1, "SAMSUNG S30", "SAMSUNG");

SELECT * FROM PRODUCTS;

INSERT INTO PRODUCTS
VALUES(2, "JEANS", "LEWIS"), (3, "KURTA", "RAYMONDS"), (4, "PANASONIC P95", "PANASONIC");

SELECT * FROM PRODUCTS;

INSERT INTO PRODUCTS VALUES(5, NULL, "VIVO");

--------------------------------------------------------------

CREATE TABLE CATEGORY (
CAT_ID INT NOT NULL UNIQUE,
CATEGORY VARCHAR(20) NOT NULL UNIQUE,
PRODUCT_ID INT NOT NULL,
FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(ID));

INSERT INTO CATEGORY VALUES(1, "ELECTRONICS", 1),
(2, "ClOTHING", 2),
(3, "HOME APPLAINCES", 3);

SELECT * FROM CATEGORY;


CREATE TABLE CUSTOMERS(
CUST_ID INT PRIMARY KEY AUTO_INCREMENT,
CUST_NAME VARCHAR(30) NOT NULL,
CUST_CITY VARCHAR(30) NOT NULL,
CUST_STATE VARCHAR(30) DEFAULT 'KARNATAKA');

INSERT INTO CUSTOMERS (CUST_NAME, CUST_CITY, CUST_STATE)
VALUES("VAIDEHI","NAGPUR","MAHARASTRA"),
("SUMAN","BELGAUM", "KARNATAKA");

SELECT * FROM CUSTOMERS;

INSERT INTO CUSTOMERS (CUST_NAME, CUST_CITY)
VALUES ('ANIKET','DHARWAD');

SELECT * FROM CUSTOMERS;

CREATE TABLE COUNTRIES (
COUNTRY_ID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
COUNTRY_NAME VARCHAR(20),
LOCATION_ID INT UNSIGNED
);

SELECT * FROM COUNTRIES;

INSERT INTO COUNTRIES VALUES ('INDIA',1), ('SRILANKA', 2), ('NEPAL', 3), ('USA',4), ('UK',5), ('POLAND',6), ('SOUTH AFRIKA', 7);


# Commands
-- 1. DDL- create, alter, update, drop
-- 2. DML- insert, rename, delete
-- 3. DQL- select
-- 4. DTL-
-- 5. DCL-

----------------------------------------------------------

USE HR;



