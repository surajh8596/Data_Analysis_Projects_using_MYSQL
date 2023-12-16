# 1. Write a query to find those employees whose salaries are less than 6000. Return first and last name, and salary.
USE HR;
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY<6000;
----------------------------------------------------------------------------------------------------------------------

# 2. Write a query to find those employees whose salary is higher than 8000. Return first name, last name and department_id and salary.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY FROM EMPLOYEES
WHERE SALARY>8000;
----------------------------------------------------------------------------------------------------------------------

# 3. Write a query to find those employees whose last name is "McEwen". Return first name, last name and department ID.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES
WHERE LAST_NAME='MCEWEN';
-----------------------------------------------------------------------------------------------------------------------

# 4. write a query to identify employees who do not get commission. Return employee_id, first_name, job_id, salary,commission_pct.
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY, COMMISSION_PCT FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL;
-----------------------------------------------------------------------------------------------------------------------

# 5. Write a query to find the details of 'Marketing' department. Return all fields.
SELECT * FROM DEPARTMENTS
WHERE DEPARTMENT_NAME='MARKETING';
----------------------------------------------------------------------------------------------------------------------

# 6. write a query to find those employees whose first name starts with 'M'.
SELECT FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'M%';
----------------------------------------------------------------------------------------------------------------------

# 7. write a query to find those employees whose first name ends with 'O'.
SELECT FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%O';
----------------------------------------------------------------------------------------------------------------------

# 8. write a query to find those employees whose first name contains 'N'.
SELECT FIRST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%N%';
----------------------------------------------------------------------------------------------------------------------

# 9. write a query to find those employees whose first name does not contain the letter 'M'.
	-- Sort the result in ascending order by department ID. Return full name (first and last name together), hire_date, salary and department_id.
SELECT CONCAT(FIRST_NAME, LAST_NAME) AS FULL_NAME, HIRE_DATE, SALARY, DEPARTMENT_ID FROM EMPLOYEES
WHERE FIRST_NAME NOT LIKE '%M%'
ORDER BY DEPARTMENT_ID;
-----------------------------------------------------------------------------------------------------------------------

# 10. Write a query to find those employees who earn between 8000 and 12000 (Begin and end values are included.) and get some commission.
	-- ThOse employees joined AFTER ‘1997-06-05’ and were not included in the department numbers 40, 120 and 70. Return all fields.
SELECT * FROM EMPLOYEES
WHERE (SALARY BETWEEN 8000 AND 12000) AND (COMMISSION_PCT IS NOT NULL) AND (HIRE_DATE>'1997-06-05') AND (DEPARTMENT_ID NOT IN (40,70,120));
------------------------------------------------------------------------------------------------------------------------

# 11. Write a query to find those employees who do not earn any commission. Return full name (first and last name), and salary, commission_pct.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME), SALARY, COMMISSION_PCT FROM EMPLOYEES
WHERE COMMISSION_PCT IS NULL;
------------------------------------------------------------------------------------------------------------------------

# 12. Write a query to find the employees whose salary is in the range 9000, 17000 (Begin and end values are included).
	-- Return fullname, contact details and salary.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME) AS FULL_NAME, PHONE_NUMBER, SALARY FROM EMPLOYEES
WHERE SALARY BETWEEN 9000 AND 17000;
------------------------------------------------------------------------------------------------------------------------

# 13. Write a query to find those employees whose salaries are not between 7000 and 15000 (Begin and end values are included).
	-- Sort the result-set in ascending order by the full name (first and last). Return full name and salary.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME)AS FULL_NAME, SALARY FROM EMPLOYEES
WHERE SALARY NOT BETWEEN 7000 AND 15000
ORDER BY FULL_NAME
LIMIT 0, 1000;
------------------------------------------------------------------------------------------------------------------------

# 14. Write a query to find those employees who were hired between November 5th, 1995 and July 5th, 1998.
	-- Return full name (first and last), job id and hire date.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME)AS FULL_NAME, JOB_ID, HIRE_DATE FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN '1995-11-05' AND '1998-07-05';
------------------------------------------------------------------------------------------------------------------------

# 15. Write a query to find those employees who work either in department 70 or 90. Return full name (first and last name), department id.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME)AS FULL_NAME, DEPARTMENT_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID=70 OR DEPARTMENT_ID=90;
------------------------------------------------------------------------------------------------------------------------

# 16. Write a query to find those employees who work under a manager. Return full name (first and last name), salary, andemployee_id, manager ID.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME)AS FULL_NAME, SALARY, EMPLOYEE_ID, MANAGER_ID FROM EMPLOYEES
GROUP BY EMPLOYEE_ID
HAVING COUNT(MANAGER_ID)=1;
------------------------------------------------------------------------------------------------------------------------

# 17. Write a query to find the employees who were hired before May 8th, 1996. Return all fields.
SELECT * FROM EMPLOYEES
WHERE HIRE_DATE<'1996-05-08';
------------------------------------------------------------------------------------------------------------------------

# 18. write a query to find the employees whose managers hold the ID 120, 103, or 145. Return full name, email, salary and manager ID.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME)AS FULL_NAME, EMAIL, SALARY, MANAGER_ID FROM EMPLOYEES
WHERE MANAGER_ID IN (120,103,145);
------------------------------------------------------------------------------------------------------------------------

# 19. Write a query to find employees whose first names contain the letters D, S, or N.
	-- Sort the result-set in descending order by salary. Return all fields.
SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%D%' OR '%N%' OR '%S%';
------------------------------------------------------------------------------------------------------------------------

# 20. Write a query to find those employees who earn above 7000 or the seventh character in their phone number is 3.
	-- Sort the result-set in descending order by first name. 
    -- Return full name, hire date, commission percentage, email, and phone number separated by '-', and salary.
SELECT CONCAT(FIRST_NAME, " ", LAST_NAME)AS FULL_NAME, HIRE_DATE, COMMISSION_PCT, EMAIL, REPLACE(PHONE_NUMBER, ".","-") AS PHONE_NUMBER, SALARY FROM EMPLOYEES
WHERE SALARY >7000 OR PHONE_NUMBER LIKE '______3%'
ORDER BY FIRST_NAME DESC;
------------------------------------------------------------------------------------------------------------------------

# 21. Write a query to find those employees whose first name contains a character 's' in the third position.
	-- Return first name, last name and department id.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES
WHERE FIRST_NAME LIKE '__S%';
------------------------------------------------------------------------------------------------------------------------

# 22. Write a query to find those employees who work in the departments that are not part of the department 50 or 30 or 80.
	-- Return employee_id, first_name, job_id, department_id.
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN (30,50,80);
------------------------------------------------------------------------------------------------------------------------

# 23. Write a query to find the employees whose department numbers are included in 30, 40, or 90.
	-- Return employee id, first name, job id, department id.
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, DEPARTMENT_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (30,40,90);
------------------------------------------------------------------------------------------------------------------------

# 24. Write a query to find those employees who worked more than one jobs in the past. Return employee id.
SELECT EMPLOYEE_ID, COUNT(JOB_ID) AS NUMBER_OF_JOBS FROM JOB_HISTORY
GROUP BY EMPLOYEE_ID
HAVING COUNT(JOB_ID)>1;
------------------------------------------------------------------------------------------------------------------------

# 25. Write a query to count the number of employees, sum of all salary, difference between the highest salary and lowest salaries by each job id.
	-- Return job_id, count, sum, salary_difference.
SELECT JOB_ID, COUNT(EMPLOYEE_ID) AS NO_OF_EMPLOYEE, SUM(SALARY) AS TOTAL_SALARY, MAX(SALARY) AS MAXIMUM_SALARY, MIN(SALARY) AS MINIMUM_SALARY,
(MAX(SALARY)-MIN(SALARY)) AS SALARY_DIFFERENCE, ROUND(AVG(SALARY),0) AS AVERAGE_SALARY FROM EMPLOYEES
GROUP BY JOB_ID;
------------------------------------------------------------------------------------------------------------------------

# 26. write a query to find each job ids where two or more employees worked for more than 300 days. Return job id.
SELECT EMPLOYEE_ID, JOB_ID, START_DATE, END_DATE, DATEDIFF(END_DATE, START_DATE) AS DAYS_WORKED FROM JOB_HISTORY
WHERE DATEDIFF(END_DATE, START_DATE)>300;
------------------------------------------------------------------------------------------------------------------------

# 27. Write a query to count the number of cities in each country. Return country ID and number of cities.
SELECT COUNTRY_ID, COUNT(CITY) FROM LOCATIONS
GROUP BY COUNTRY_ID;
------------------------------------------------------------------------------------------------------------------------

# 28. Write a query to count the number of employees worked under each manager. Return manager ID and number of employees.
SELECT MANAGER_ID, COUNT(EMPLOYEE_ID) FROM EMPLOYEES
GROUP BY MANAGER_ID;
------------------------------------------------------------------------------------------------------------------------

# 29. Write a query to find all jobs. Sort the result-set in descending order by job title. Return all fields.
SELECT * FROM JOBS
ORDER BY JOB_TITLE DESC;
------------------------------------------------------------------------------------------------------------------------

# 30. Write a query to find all those employees who are either Sales Representatives or Sales Manager. Return first name, last name and job_title.
SELECT FIRST_NAME, LAST_NAME, EMPLOYEE_ID, JOB_ID FROM EMPLOYEES
WHERE JOB_ID IN ('SA_REP', 'SA_MAN');
------------------------------------------------------------------------------------------------------------------------

# 31. Write a query to calculate the average salary of employees who receive a commission percentage for each department.
	-- Return department id, average salary, COMMISSION_PCT.
SELECT DEPARTMENT_ID, AVG(SALARY) AS AVERAGE_SALARY, AVG(COMMISSION_PCT) FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
GROUP BY DEPARTMENT_ID;
------------------------------------------------------------------------------------------------------------------------

# 32. Write a query to find the departments where any manager manages four or more employees. Return department_id, manager_id and count of employee.
SELECT DEPARTMENT_ID, MANAGER_ID, COUNT(EMPLOYEE_ID) AS NUMBER_OF_EMPLOYEES FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, MANAGER_ID
HAVING NUMBER_OF_EMPLOYEES>=4;
------------------------------------------------------------------------------------------------------------------------

# 33. Write a query to find the departments where more than ten employees receive commissions. Return department id and count of employees.
SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID) AS NUMBER_OF_EMPLOYEES FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
GROUP BY DEPARTMENT_ID
HAVING NUMBER_OF_EMPLOYEES>10;
------------------------------------------------------------------------------------------------------------------------

# 34. Write a query to find those employees who have completed their previous jobs. Return employee ID, end_date.
SELECT EMPLOYEE_ID, END_DATE FROM JOB_HISTORY
WHERE END_DATE IS NOT NULL;
------------------------------------------------------------------------------------------------------------------------

# 35. Write a query to find those employees who do not have commission percentage and 
	-- have salaries between 7000, 12000(Begin and end values are included.) 
    -- and who are employed in the department number 50. Return all the fields of employees.
SELECT * FROM EMPLOYEES
WHERE (COMMISSION_PCT IS NULL) AND (SALARY BETWEEN 7000 AND 12000) AND DEPARTMENT_ID=50;
------------------------------------------------------------------------------------------------------------------------

# 36. Write a query to compute the average salary of each job ID. Exclude those records where average salary is on or lower than 8000.
	-- Return job ID, average salary.
SELECT JOB_ID, ROUND(AVG(SALARY),2) AS AVERAGE_SALARY FROM EMPLOYEES
GROUP BY JOB_ID
HAVING AVERAGE_SALARY>8000;
------------------------------------------------------------------------------------------------------------------------

# 37. Write a query to find those job titles where maximum salary falls between 12000 and 18000 (Begin and end values are included.).
	-- Return job_title, max_salary-min_salary.
SELECT JOB_TITLE, MAX_SALARY, MIN_SALARY, (MAX_SALARY-MIN_SALARY) AS SALARY_DIFFERENCE FROM JOBS
WHERE MAX_SALARY BETWEEN 12000 AND 18000;
------------------------------------------------------------------------------------------------------------------------

# 38. Write a query to find the employees whose first or last name begins with 'D'. Return first name, last name.
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'D%' OR LAST_NAME LIKE 'D%';
------------------------------------------------------------------------------------------------------------------------

# 39. Write a query to find details of those jobs where the minimum salary exceeds 9000. Return all the fields of jobs.
SELECT * FROM JOBS
WHERE MAX_SALARY>9000;
------------------------------------------------------------------------------------------------------------------------

# 40. Write a query to find those employees who joined after 7th September 1987. Return all the fields.
SELECT * FROM EMPLOYEES
WHERE HIRE_DATE>'1987-09-07';
------------------------------------------------------------------------------------------------------------------------

