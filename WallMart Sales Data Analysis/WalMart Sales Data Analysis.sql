#Create a Database to store Walmart sales data by name 'walmart'
CREATE DATABASE walmart;

USE WALMART;

#Create table 'Sales'. Define the structure for table and import the data from csv file.
CREATE TABLE sales(
	invoice_id VARCHAR(30) PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1));

#Check the structure of the table and then see the rows.
DESC SALES;
SELECT * FROM SALES;

-- --------------------------- Feature Engineering ----------------------------- --
#This will help use generate some new columns from existing ones. 
#1. Add a new column named time_of_day to give insight of sales in the Morning, Afternoon, Evening, Night, Late Night and Early Morning.
 -- This will help answer the question on which part of the day most sales are made.
ALTER TABLE SALES ADD COLUMN TIME_OF_DAY VARCHAR(15);

UPDATE SALES 
SET TIME_OF_DAY = ( 
CASE 
     WHEN TIME BETWEEN '00:00:00' AND '12:00:00' THEN 'MORNING'
     WHEN TIME BETWEEN '12:00:01' AND '16:00:00' THEN 'AFTERNOON'
     ELSE 'EVENING'
END);


#2. Add a new column named day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri).
	-- This will help answer the question on which week of the day each branch is busiest.
ALTER TABLE SALES ADD COLUMN DAY_NAME VARCHAR(10);

UPDATE SALES
SET DAY_NAME = DAYNAME(DATE);

#3. Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar).
	-- Help determine which month of the year has the most sales and profit.
ALTER TABLE SALES ADD COLUMN MONTH_NAME VARCHAR(15);

UPDATE SALES
SET MONTH_NAME = MONTHNAME(DATE);

# Check the extracted features
SELECT TIME_OF_DAY, DAY_NAME, MONTH_NAME FROM SALES;
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- -------------------------------------------------------- Exploratory Data Analysis (EDA) -------------------------------------------------- --
-- Exploratory data analysis is done to answer the listed questions and aims of this project.

-- Business Questions To Answer:

# 1. GENERIC QUESTIONS:

-- 1. How many unique cities does the data have?
SELECT CITY, COUNT(CITY) FROM SALES
GROUP BY CITY;
	-- There are total 3 cities Yangon, Naypyitaw and Mandalay.
-- ------------------------------------------------------------

-- 2. In which city is each branch?
SELECT DISTINCT CITY, BRANCH FROM SALES;
	-- Yangons brnch is at A, Naypyitaws branch at C and Mandalays branch is at B.

---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------

# 2. Product Realated Questions:

-- 1. How many unique product lines does the data have?
SELECT DISTINCT PRODUCT_LINE FROM SALES;
	-- Total 5 product lines are there, Food & Beverages, Health & Beauty, Sports & Travel, Fashion Accessories, Home & lifestype, and Electronic.

-- 2. What is the most common payment method?
SELECT PAYMENT, COUNT(PAYMENT) AS TOTAL_PAYMENTS FROM SALES
GROUP BY PAYMENT;
	-- Cash and E-Wallets are the most preffered payment method.

-- 3. What is the most selling product line?
SELECT PRODUCT_LINE, SUM(QUANTITY) AS TOTAL_QUANTITY  FROM SALES
GROUP BY PRODUCT_LINE
ORDER BY TOTAL_QUANTITY DESC;
	-- Electronics Accessories is the best selling product line followed by Food & Beverages.
    -- Least selling product line is Health & Beauty.
    
-- 4. What is the total revenue by month?
SELECT MONTH_NAME, SUM(TOTAL) AS TOTAL_REVENUE FROM SALES
GROUP BY MONTH_NAME
ORDER BY TOTAL_REVENUE DESC;
	-- In month of January highest revenue is collected.
	-- Least revenue collection is in February Month.

-- 5. What month had the largest COGS?
SELECT MONTH_NAME, MAX(COGS) AS MAXIMUM_COGS FROM SALES
GROUP BY MONTH_NAME
ORDER BY MAXIMUM_COGS DESC
LIMIT 1;
	-- Largest COGS (993) is in month of "FEBRUARY".

-- 6. What product line had the largest revenue?
SELECT PRODUCT_LINE, SUM(TOTAL) AS TOTAL_REVENUE FROM SALES
GROUP BY PRODUCT_LINE
ORDER BY TOTAL_REVENUE DESC;
	-- Food & Beverages have the larget total revenue collection.
    -- Least revenue collected by Health & Beauty product line.

-- 7. What is the city with the largest revenue?
SELECT CITY, SUM(TOTAL) AS TOTAL_REVENUE FROM SALES
GROUP BY CITY
ORDER BY TOTAL_REVENUE DESC;
	-- "Naypyitaw' city has highest revenue collection.
    -- "Mandalay" city has low revenue collection.

-- 8. What product line had the largest VAT?
SELECT PRODUCT_LINE, AVG(TAX_PCT) AS MAXIMUM_AVERAGE_VAT FROM SALES
GROUP BY PRODUCT_LINE
ORDER BY MAXIMUM_AVERAGE_VAT DESC;
	-- Home & Lifestyle has more VAT on their product.
    -- Least VAT is on Fashion Accessories.


-- 9. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
SELECT PRODUCT_LINE, 
CASE WHEN AVG(TOTAL) > (SELECT AVG(TOTAL) FROM SALES) THEN 'GOOD' ELSE 'BAD'
END AS CATEGORY_OF_SALES FROM SALES
GROUP BY PRODUCT_LINE;
	-- "Food & Beverages", "Health & Beauty", "Sports & Travel" and "Home & Lifestyle" product lines sales greater than the average sales.
    -- "Fashion Accessories" and "Electronics Accessories" product lines have sales less than the average sales.

-- 10. Which branch sold more products than average product sold?
SELECT BRANCH FROM SALES
GROUP BY BRANCH
HAVING AVG(QUANTITY) > (SELECT AVG(QUANTITY) FROM SALES);
	-- Only branch "C" sold more average quantities.

-- 11. What is the most common product line by gender?
SELECT GENDER, PRODUCT_LINE, COUNT(GENDER) COUNT_OF_PERSONS FROM SALES
GROUP BY PRODUCT_LINE, GENDER
ORDER BY COUNT_OF_PERSONS DESC;
	-- "Fashion Accessories" product line is most commom to "Female".
    -- "Health & Beauty" is most common product line in "Male".

-- 12. What is the average rating of each product line?
SELECT PRODUCT_LINE, ROUND(AVG(RATING), 2) AS AVERAGE_RATING FROM SALES
GROUP BY PRODUCT_LINE
ORDER BY AVERAGE_RATING DESC;
	-- "Food & Beverages" product line has highest average rating (7.11).
    -- Least rated (6.84) product line is "Home & lifestyle".
    
---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------

# 3. Sales Related Questions

-- 1. Number of sales made in each time of the day per weekends
SELECT DAY_NAME, TIME_OF_DAY, ROUND(SUM(TOTAL), 2) AS TOTAL_SALES FROM SALES
WHERE DAY_NAME = 'SUNDAY' OR DAY_NAME = 'SATURDAY'
GROUP BY TIME_OF_DAY, DAY_NAME
ORDER BY TOTAL_SALES DESC;
	-- Highest sales recorded in "SATURDAY EVENING". Lowest Sales in "Satrday Morning".

-- 2. Which of the customer types brings the most revenue?
SELECT CUSTOMER_TYPE, SUM(TOTAL)/1000 AS TOTAL_REVENUE_IN_THOUSANDS FROM SALES
GROUP BY CUSTOMER_TYPE
ORDER BY TOTAL_REVENUE_IN_THOUSANDS DESC;
	-- "MEMBER" type customers are responsible for highest revenue generation.

-- 3. Which city has the largest tax percent/VAT (Value Added Tax)?
SELECT CITY, AVG(TAX_PCT) AS AVERAGE_TAX FROM SALES
GROUP BY CITY
ORDER BY AVERAGE_TAX DESC
LIMIT 1;
	-- "NAYPYITAW" city has highest average tax.

-- 4. Which customer type pays the most in VAT?
SELECT Customer_type, AVG(TAX_PCT) AS AVERAGE_TAX FROM SALES
GROUP BY Customer_type
ORDER BY AVERAGE_TAX DESC
LIMIT 1;
	-- "MEMBER" type customers pay more tax.

---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------

# 4. Customer Related Questions

-- 1. How many unique customer types OUR the data have?
SELECT DISTINCT CUSTOMER_TYPE FROM SALES;
	-- There are only 2 different type of Customers, "Member" and "Normal" customers.
    
-- 2. How many unique payment methods does the data have?
SELECT DISTINCT PAYMENT FROM SALES;
	-- Three types of Payment options avaiable for Walmart customers, "Credit Card", "E-Wallet" and "Cash" payment.
    
-- 3. What is the most common customer type?
SELECT CUSTOMER_TYPE, count(*) AS TOTAL_CUSTOMERS FROM SALES
GROUP BY CUSTOMER_TYPE;
	-- Data contains almost equal number of custumers in both Customer Type.

-- 4. Which customer type buys the most quantities?
SELECT CUSTOMER_TYPE, AVG(QUANTITY) TOTAL_QUANTITY FROM SALES
GROUP BY CUSTOMER_TYPE;
	-- No much difference between quantities purchased by each type of memebers, "MEMBER" customers buys more quantities.

-- 5. What is the gender of most of the customers?
SELECT GENDER, COUNT(*) FROM SALES
GROUP BY GENDER;
	-- Almost equal.
    
-- 6. What is the gender distribution per branch?
SELECT BRANCH, GENDER, COUNT(GENDER) CUSTOMER_DISTRIBUTION FROM SALES
GROUP BY BRANCH, GENDER
ORDER BY CUSTOMER_DISTRIBUTION DESC;
	-- More "Males" Customers preffer "Branch-A and B",  "Branch-C" is preffered by "Females".
    
-- 7. Which time of the day do customers give most ratings?
SELECT TIME_OF_DAY, AVG(RATING) AS AVERAGE_RATING FROM SALES
GROUP BY TIME_OF_DAY
ORDER BY AVERAGE_RATING DESC;
	-- Customers who does their shopping during "AFTERNOON" hours give highest rating.
    
-- 8. Which time of the day do customers give most ratings per branch?
SELECT Branch, TIME_OF_DAY, AVG(RATING) AS AVERAGE_RATING FROM SALES
GROUP BY BRANCH, TIME_OF_DAY
ORDER BY AVERAGE_RATING DESC;
	-- For "Branch-A" customers gave highest rating in the "Afternoon" hours.
    -- FOr 'Branch-C" "Evening' time acquired more rating.
	-- For "Branch-B" customers gave good rating at the "Morning" period.

-- 9. Which day fo the week has the best avg ratings?
SELECT DAY_NAME, AVG(RATING) AS AVERAGE_RATING FROM SALES
GROUP BY DAY_NAME
ORDER BY AVERAGE_RATING DESC;
	-- High average rating on "Monday" and least on "Wednesday".
    
-- 10. Which day of the week has the best average ratings per branch?
SELECT Branch, DAY_NAME, AVG(RATING) AS AVERAGE_RATING FROM SALES
GROUP BY BRANCH, DAY_NAME
ORDER BY AVERAGE_RATING DESC;
	-- For "Branch-A" customers gave highest rating ON "FRIDAY".
    -- FOr 'Branch-B" "MONDAY' acquired more rating.
	-- For "Branch-C" customers gave good rating ON "SATURDAY".

---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
