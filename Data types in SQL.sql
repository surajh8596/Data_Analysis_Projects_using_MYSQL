CREATE DATABASE DATATYPE; # CREATING DATABASE

USE DATATYPE;   # USE DATABASE

-- MySQL Numeric Data Types (Number Formats)

# 1. Integers represent numbers without fractions and can have SIGNED and UNSIGNED attributes..
# 2. Decimals represent numbers with fractions and store exact numeric values in the column.
-- They can be signed and unsigned and are usually used for columns that store monetary values.
-- In the comparison with the floating-point numbers, decimals are more accurate.
# 3. Floating-point represent numbers with fractions but do not store exact numeric values.
-- They can be signed and unsigned.
-- Floating-point numeric values use a 64-bit OR 32-bit format to store data. 
-- They may lead to a loss of precision during arithmetic operations.


-- CREATE TABLES & COLUMNS WITH INTEGER, DECIMAL, FLOAT DATA TYPE

CREATE TABLE STUDENT (
ROLL_NO INT UNSIGNED,
PROGRESS INT SIGNED,
PERC_MARKS DECIMAL(3,2),
PERC_MARKS_INC_DESC FLOAT
);
SELECT * FROM STUDENT;
DESC STUDENT;


-- INSERT TO TABLE
INSERT INTO STUDENT 
(ROLL_NO,PROGRESS,PERC_MARKS,PERC_MARKS_INC_DESC)
VALUES  (1, -20, 3.55, -5.34),
		(2, 20, 4.5, 5.5);
SELECT * FROM STUDENT;


# CHAR and VARCHAR data type
-- 1. CHAR data types store non-binary strings with a fixed length that reaches 255 characters.
-- 2. VARCHAR data types store non-binary strings with a variable length having a maximum size of up to 65535 characters.
-- For both data types, you need to set a size parameter in characters (in brackets) when creating a column.
-- The size parameter represents the column length for a CHAR data type and the maximum column length for a VARCHAR data type.
-- For example, CHAR(3) refers to up to 3 characters for the column value.
-- The main distinction between the CHAR and VARCHAR data types is a way of storing data.
-- CHAR adds spaces to values on the right to the specified length, for example, CHAR(3) will be displayed as follows ‘table ‘. 
-- VARCHAR outputs the value as it is, without any additional spaces – VARCHAR(3) will be displayed as ‘table’.

CREATE TABLE STUDENT_INFO (
FIRST_NAME CHAR(10),
LAST_NAME VARCHAR(15));
DESC STUDENT_INFO;

INSERT INTO STUDENT_INFO (FIRST_NAME, LAST_NAME)
VALUES ('AMAN', 'CHADDA'),
	   ('RICHA', 'GHOSH');
SELECT * FROM STUDENT_INFO;


# ENUM Data Type in MySQL
-- ENUM data types are strings with enumeration values. ENUM allows you to set a list of predefined values and then choose any of them. 
-- If you add an invalid value that is not included in the list, you will get an empty string.
-- For example, we want to create a table that will store information about the size of women’s clothes: small, medium, and large. 
-- In the table, we will insert the size column with the ENUM type. It means that this column will take only specified values.

CREATE TABLE clothes (
    product_ID int PRIMARY KEY AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    fabric text NOT NULL,
    size enum ('small', 'medium', 'large') NOT NULL
);
DESC CLOTHES;

-- insert into the table a new row with a valid value
INSERT INTO clothes (product_ID, name, fabric, size)
  VALUES (1, 'dresses', 'cotton', 'small');


# MySQL Date & Time Data Types
-- For managing date and time information in databases, MySQL date types are used that are divided into
--  DATE-- Stores only date information in the table column	YYYY-MM-DD format (year, month, and date)	from ‘1000-01-01’ to ‘9999-12-31’.
-- TIME-- Displays only time	HH:MM:SS format (hours, minutes, and seconds)	from ‘-838:59:59’ to ‘838:59:59’
-- DATETIME-- Stores both date and time in the column	YYYY-MM-DD HH:MM:SS ( year, month, and date, and hours, minutes, and seconds) from ‘1000-01-01 00:00:00’ to ‘9999-12-31 23:59:59’
-- TIMESTAMP-- Stores both date and time values in the column. Conversion of the value from the zone of the connection server to UTC takes place.	YYYY-MM-DD HH:MM:SS ( year, month, and date, and hours, minutes, and seconds)	from ‘1970-01-01 00:00:01’ UTC to ‘2038-01-19 03:14:07’ UTC
-- YEAR--Stores only year values in the column	YYYY (year)	from ‘1901’ to ‘2155’

CREATE TABLE employees(
  employee_id INT AUTO_INCREMENT,
  first_name varchar(45) NOT NULL,
  last_name varchar(45) NOT NULL,
  date_of_birth date,
  PRIMARY KEY (employee_id)
);
DROP TABLE EMPLOYEES;

-- insert data into the table
INSERT INTO employees (employee_id, first_name, last_name, date_of_birth)
  VALUES (1, 'John', 'Sanders', '2000-01-19');

-- retrieve data
SELECT * FROM employees e;



-- modify the table with a new column 
ALTER TABLE employees 
  ADD COLUMN first_day_at_work datetime;

-- add data to the created table
UPDATE employees 
SET 
    first_day_at_work = '2020-11-18 10:00:00'
WHERE employee_id = 1;
SELECT * FROM employees e;


-- modify the table
ALTER TABLE employees 
  ADD COLUMN start_to_work time;
  
-- update the table with new information
UPDATE employees 
SET 
    start_to_work = '08:00:00'
WHERE employee_id = 1; 
SELECT * FROM employees e;



-- add a new column
ALTER TABLE employees 
  ADD COLUMN certified year;

-- set the value to the column
UPDATE employees 
SET 
    certified = '2021'
WHERE employee_id = 1;
SELECT * FROM employees e;



-- CHANGE DATATYPE OF COLUMN
-- For our example, we are going to use the employees table. To open the CREATE script of the table, in Database Explorer, right-click the table and select Generate Script As > CREATE > To New SQL Window.

ALTER TABLE EMPLOYEES
MODIFY COLUMN  first_day_at_work timestamp;
select * from employees;













