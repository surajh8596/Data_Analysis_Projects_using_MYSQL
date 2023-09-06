# 1. For each order, calculate a subtotal for each Order (identified by OrderID).
USE NORTHWIND;
SELECT ORDERID, FORMAT(SUM(UNITPRICE*QUANTITY*(1-DISCOUNT)), 2) AS TOTAL FROM ORDER_DETAILS
GROUP BY ORDERID;
DESC ORDER_DETAILS;
----------------------------------------------------------------------------------

# 2. Find subtotal for each order id by year. Return Shippeddate, year, orderid and subtotal.
SELECT DISTINCT SHIPPEDDATE AS SHIPPED_DATE, YEAR(SHIPPEDDATE) AS SHIPPED_YEAR, ORDERS.ORDERID,
FORMAT(SUM(UNITPRICE*QUANTITY*(1-DISCOUNT)), 2) AS TOTAL  FROM ORDERS
INNER JOIN ORDER_DETAILS
USING(ORDERID)
WHERE SHIPPEDDATE IS NOT NULL
GROUP BY SHIPPED_DATE;
----------------------------------------------------------------------------------

# 3. Find subtotal for each order id by quarter. Return Shippeddate, year, quarter, orderid and subtotal.
SELECT DISTINCT SHIPPEDDATE AS SHIPPED_DATE, YEAR(SHIPPEDDATE) AS SHIPPED_YEAR, QUARTER(SHIPPEDDATE) AS QUARTER, ORDERS.ORDERID,
FORMAT(SUM(UNITPRICE*QUANTITY*(1-DISCOUNT)), 2) AS TOTAL  FROM ORDERS
INNER JOIN ORDER_DETAILS
USING(ORDERID)
WHERE SHIPPEDDATE IS NOT NULL
GROUP BY SHIPPED_DATE;
----------------------------------------------------------------------------------

# 4. Find out the total sales by category.
SELECT CATEGORYNAME, ROUND(SUM(ORDER_DETAILS.UNITPRICE*QUANTITY*(1-DISCOUNT)), 2) AS TOTAL_SALES FROM CATEGORIES
INNER JOIN PRODUCTS USING(CATEGORYID)
INNER JOIN ORDER_DETAILS USING(PRODUCTID)
GROUP BY CATEGORYNAME;
----------------------------------------------------------------------------------

# 5. Top 5  Ctageories with highest sales.
SELECT CATEGORYNAME, ROUND(SUM(ORDER_DETAILS.UNITPRICE*QUANTITY*(1-DISCOUNT)), 2) AS TOTAL_SALES FROM CATEGORIES
INNER JOIN PRODUCTS USING(CATEGORYID)
INNER JOIN ORDER_DETAILS USING(PRODUCTID)
GROUP BY CATEGORYNAME
ORDER BY TOTAL_SALES DESC
LIMIT 5;
----------------------------------------------------------------------------------

# 6. Top 10 products by quantity sold. Return productid, productname, quantity_sold.
SELECT PRODUCTID, PRODUCTNAME, QUANTITY FROM PRODUCTS
INNER JOIN ORDER_DETAILS USING(PRODUCTID)
GROUP BY ORDERID
ORDER BY QUANTITY DESC
LIMIT 10;
----------------------------------------------------------------------------------

# 7. Number of customers with respect to their contact title. return Contancttitle and number of customers.
SELECT CONTACTTITLE, COUNT(CUSTOMERID) AS NO_OF_CUSTOMERS FROM CUSTOMERS
GROUP BY CONTACTTITLE;
----------------------------------------------------------------------------------

# 8. Number of customers by each conutry.
SELECT COUNTRY, COUNT(CUSTOMERID) AS NO_OF_CUSTOMERS FROM CUSTOMERS
GROUP BY COUNTRY;
----------------------------------------------------------------------------------

# 9. Number of customers by each city.
SELECT CITY, COUNT(CUSTOMERID) AS NO_OF_CUSTOMERS FROM CUSTOMERS
GROUP BY CITY;
----------------------------------------------------------------------------------

# 10. Number of customers by each region.
SELECT REGION, COUNT(CUSTOMERID) AS NO_OF_CUSTOMERS FROM CUSTOMERS
GROUP BY REGION;
----------------------------------------------------------------------------------

# 11. WhAT is the AGE OF  youngest and oldest employee in the company?
SELECT TIMESTAMPDIFF(YEAR, MAX(BIRTHDATE), NOW())  AS AGE_YOUNGEST_EMPLOYEE, 
       TIMESTAMPDIFF(YEAR, MIN(BIRTHDATE), NOW()) AS AGE_OF_LDEST_EMPLOYEE FROM EMPLOYEES;
----------------------------------------------------------------------------------

# 12. Number of employees in each job title?
SELECT TITLE, COUNT(EMPLOYEEID) AS NO_OF_EMPLOYEES FROM EMPLOYEES
GROUP BY TITLE;
----------------------------------------------------------------------------------

# 13. Employees who hired after '1994-01-01'. Return firstname, lastname, title and hiredate.
SELECT FIRSTNAME, LASTNAME, TITLE, HIREDATE FROM EMPLOYEES
WHERE HIREDATE > '1994-01-01';
----------------------------------------------------------------------------------

# 14. Which products gets discount after buying. Return productid, productname, discount.
SELECT DISTINCT PRODUCTS.PRODUCTID, PRODUCTNAME FROM PRODUCTS
INNER JOIN ORDER_DETAILS USING (PRODUCTID)
WHERE DISCOUNT !=0
GROUP BY PRODUCTID;
----------------------------------------------------------------------------------

# 15. Find Top 10 fastest order delivery time. Return ORDERid, orderdate, shippeddate, Delivery time in days.
SELECT ORDERID, ORDERDATE, SHIPPEDDATE, DATEDIFF(SHIPPEDDATE, ORDERDATE) DELIVERED_IN_DAYS FROM ORDERS
WHERE SHIPPEDDATE IS NOT NULL
ORDER BY DELIVERED_IN_DAYS
LIMIT 10;
----------------------------------------------------------------------------------

# 16. What is the maximum delivery time? Return ORDERid, orderdate, shippeddate, Delivery time in days.
SELECT MAX(DATEDIFF(SHIPPEDDATE, ORDERDATE)) MAXIMUM_DELIVERY_TIME FROM ORDERS
WHERE SHIPPEDDATE IS NOT NULL;
----------------------------------------------------------------------------------
