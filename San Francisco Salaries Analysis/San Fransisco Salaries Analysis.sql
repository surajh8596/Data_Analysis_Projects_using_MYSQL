-- Use Salaries_DB database
USE SALARIES_DB;

# 1. Basic Exploration of database

-- a. See entire data
SELECT * FROM SALARIES;

-- b. Check the total employees in the table
SELECT COUNT(*) FROM SALARIES;
	-- 118872 Total employees in the table.

-- c. Unique employee names
SELECT COUNT(DISTINCT EMPLOYEENAME) FROM SALARIES;
	-- 118909 Employees has unique names.
    
-- d. How many total job title does table have
SELECT COUNT(DISTINCT JOBTITLE) FROM SALARIES;
	-- 3000 distinct job titles.

-- e. What is minimum, maximum and average base pay.
SELECT MIN(BASEPAY) AS MINIMUM, MAX(BASEPAY) AS MAXIMUM, AVG(BASEPAY) AS AVERAGE FROM SALARIES;
	-- Minimum base pay is 0, mximum is 302578 and average base pay is 75576.76.
    
-- f. What is maximum overtime pay
SELECT MAX(overtimepay) AS MAXIMUM FROM SALARIES;
	-- Maximum overtime pay is 24000 dollar.
    
-- g. What is the maximum benifit amount an employee recieving
SELECT MAX(BENEFITS) AS MAXIMUM FROM SALARIES;
	-- Maximum benefit recieved by an employee is 11000 dollar.
    
-- h. What is minimum, maximum and average total pay.
SELECT MIN(TOTALPAY) AS MINIMUM, MAX(TOTALPAY) AS MAXIMUM, AVG(TOTALPAY) AS AVERAGE FROM SALARIES;
	-- Minimum base pay is 0, mximum is 302578 and average total pay is 75576.76.
    
-- i. What are the unique Years
SELECT DISTINCT YEAR FROM SALARIES;
	-- We have 2011 to 2014 years employee salaries data.
    
-- ----------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------

# 2. Business Questions

-- A. Disply top 10 job tite who's average overtime pay is greater than 50000.
SELECT JOBTITLE, ROUND(AVG(OVERTIMEPAY),2) AS AVERAGE_OVERTIME_PAY FROM SALARIES
WHERE OVERTIMEPAY > 50000
GROUP BY JOBTITLE
ORDER BY AVERAGE_OVERTIME_PAY DESC
LIMIT 10;
	-- CAPTAIN III (POLICE DEPARTMENT) Job title has highest average salary.

-- B. Display top 10 employees who occuring in this table multiple times.
SELECT EMPLOYEENAME, COUNT(EMPLOYEENAME) AS OCCURANCE FROM SALARIES
GROUP BY EMPLOYEENAME
ORDER BY OCCURANCE DESC
LIMIT 10;
	-- kEVIN LEE occuring most of the times.
    
-- C. WHich year has highest total pay ?
SELECT YEAR, AVG(TOTALPAY) AVERAGE_TOTAL_PAY FROM SALARIES
GROUP BY YEAR;
	-- 2014 has high average total pay.

-- D. What is the top 5 job title's with highest employees.
SELECT JOBTITLE, COUNT(JOBTITLE) AS NO_OF_EMPLOYEES FROM SALARIES
GROUP BY JOBTITLE
ORDER BY NO_OF_EMPLOYEES DESC
LIMIT 5;
	-- Most employees working as Transit Operators.
    
-- E. Display the Records for job title 'MAYOR'
SELECT * FROM SALARIES
WHERE JOBTITLE = 'MAYOR';
	-- Only 3 records for Mayor job title, and 2 instances 'Edwin Lee' was the mayor.

-- F. Show the top 10 highest paid employees.
SELECT EMPLOYEENAME, TOTALPAY FROM SALARIES
ORDER BY TOTALPAY DESC
LIMIT 10;
	-- 'NATHANIEL FORD' is the highest paid employee.
    
-- G. Display the average of BasePay, OvertimePay, and OtherPay for each employee.
SELECT EMPLOYEENAME, (BASEPAY + OVERTIMEPAY + OTHERPAY)/3 as AVG_BP_OP_OT from salaries;

-- H. Show all employees who are 'MANAGER' mentioned in their job title.
SELECT EMPLOYEENAME, JOBTITLE FROM SALARIES
WHERE JOBTITLE LIKE '%MANAGER%';

-- I. Show all JOB TITLES with a total pay between 50,000 and 75,000.
SELECT JOBTITLE, TOTALPAY FROM SALARIES
WHERE TOTALPAY BETWEEN 50000 AND 75000;

-- J. Show all employees with a total pay benefits value  between 125,000 and 150,000 and a job title containing the word "Director".
SELECT EMPLOYEENAME, JOBTITLE, TOTALPAYBENEFITS FROM SALARIES
WHERE TOTALPAYBENEFITS BETWEEN 125000 AND 150000
AND JOBTITLE LIKE '%DIRECTOR%';

-- H. Drop unneccesary column like 'notes'
ALTER TABLE SALARIES
DROP COLUMN NOTES;
ROLLBACK;

-- 17	Update the base pay of all employees with 
-- the job title containing "Manager" by increasing it by 10%.
update salaries
set BasePay = BasePay * 1.1
where JobTitle Like "%Manager%";
select * from salaries;

-- 18	Delete all employees who have no OvertimePay.
select count(*) from salaries
where OvertimePay =0;
delete from salaries
where OvertimePay =0;
select count(*) from salaries
where OvertimePay =0;