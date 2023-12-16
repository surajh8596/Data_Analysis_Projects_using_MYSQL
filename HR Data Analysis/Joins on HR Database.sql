# 1. write a SQL query to find the first name, last name, department number, and department name for each employee.
USE HR;
SELECT FIRST_NAME, LAST_NAME, EMPLOYEES.DEPARTMENT_ID, DEPARTMENT_NAME FROM EMPLOYEES
INNER JOIN DEPARTMENTS
ON EMPLOYEES.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID;
-----------------------------------------------------------------------------------------------------------------------

# 2. write a SQL query to find the first name, last name, department, city, and state province for each employee.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENTS.DEPARTMENT_ID, CITY, STATE_PROVINCE FROM EMPLOYEES
INNER JOIN DEPARTMENTS
ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
JOIN LOCATIONS
ON LOCATIONS.LOCATION_ID = DEPARTMENTS.LOCATION_ID;
-----------------------------------------------------------------------------------------------------------------------

# 3. write a SQL query to find all those employees who work in department ID 80 or 40.
-- Return first name, last name, department number and department name.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENTS.DEPARTMENT_ID, DEPARTMENT_NAME FROM EMPLOYEES
INNER JOIN DEPARTMENTS
ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
WHERE DEPARTMENTS.DEPARTMENT_ID IN (40, 80);
-----------------------------------------------------------------------------------------------------------------------

# 4. write a SQL query to find those employees whose first name contains the letter ‘z’.
-- Return first name, last name, department, city, and state province
SELECT FIRST_NAME, LAST_NAME, DEPARTMENTS.DEPARTMENT_ID, DEPARTMENT_NAME, CITY, STATE_PROVINCE FROM EMPLOYEES
INNER JOIN DEPARTMENTS
ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
INNER JOIN LOCATIONS
ON DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID
WHERE FIRST_NAME LIKE '%Z%';
-----------------------------------------------------------------------------------------------------------------------

# 5.  write a SQL query to find all departments, including those without employees.
-- Return first name, last name, department ID, department name.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENTS.DEPARTMENT_ID, DEPARTMENT_NAME FROM EMPLOYEES
RIGHT JOIN DEPARTMENTS
ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;
-----------------------------------------------------------------------------------------------------------------------

# 6. write a SQL query to find the employees who earn less than the employee of ID 182. Return first name, last name and salary.
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY < (SELECT SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID = 182);


# 7. write a SQL query to find the employees and their managers. Return the first name of the employee and manager.
SELECT E1.FIRST_NAME AS EMPLOYEE_NAME, E2.FIRST_NAME AS MANAGER_NAME, E1.MANAGER_ID FROM EMPLOYEES E1
INNER JOIN EMPLOYEES E2
ON E1.MANAGER_ID = E2.EMPLOYEE_ID;
-----------------------------------------------------------------------------------------------------------------------

# 8.  write a SQL query to display the department name, city, and state province for each department.
SELECT DEPARTMENT_NAME, CITY, STATE_PROVINCE FROM DEPARTMENTS
INNER JOIN LOCATIONS
ON DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID;
-----------------------------------------------------------------------------------------------------------------------

# 9. write a SQL query to find out which employees have or do not have a department. Return first name, last name, department ID, department name.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMPLOYEES.DEPARTMENT_ID, DEPARTMENT_NAME FROM EMPLOYEES
RIGHT JOIN DEPARTMENTS
ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;
-----------------------------------------------------------------------------------------------------------------------

#  10. write a SQL query to find the employees and their managers. Those managers do not work under any manager also appear in the list. 
-- Return the first name of the employee and manager.
SELECT E1.FIRST_NAME AS EMPLOYEE_NAME, E2.FIRST_NAME AS MANAGER_NAME FROM EMPLOYEES E1
LEFT JOIN EMPLOYEES E2
ON E1.MANAGER_ID = E2.EMPLOYEE_ID;
-----------------------------------------------------------------------------------------------------------------------

# 11. write a SQL query to find the employees who work in the same department as the employee with the last name Taylor. 
-- Return first name, last name and department ID.
-- OPTION-1
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID = ANY (SELECT DEPARTMENT_ID FROM EMPLOYEES
					   WHERE LAST_NAME = 'TAYLOR');
                       
-- OPTION-2
SELECT E1.FIRST_NAME, E1.LAST_NAME, E1.DEPARTMENT_ID FROM EMPLOYEES E1
INNER JOIN EMPLOYEES E2
ON E1.DEPARTMENT_ID = E2.DEPARTMENT_ID AND E2.LAST_NAME = 'TAYLOR';
-----------------------------------------------------------------------------------------------------------------------

# 12. write a SQL query to find all employees who joined on or after 1st January 1993 and on or before 31 August 1997. 
-- Return job title, department name, employee name, and joining date of the job.
SELECT JOB_TITLE, DEPARTMENT_NAME, FIRST_NAME, LAST_NAME, HIRE_DATE FROM JOB_HISTORY 
JOIN JOBS
ON JOB_HISTORY.job_id = JOBS.JOB_ID
JOIN DEPARTMENTS
ON DEPARTMENTS.DEPARTMENT_ID = JOB_HISTORY.DEPARTMENT_ID
JOIN EMPLOYEES
ON EMPLOYEES.EMPLOYEE_ID = JOB_HISTORY.EMPLOYEE_ID
WHERE start_date>='1993-01-01' AND start_date<='1997-08-31';
-----------------------------------------------------------------------------------------------------------------------

# 13. write a SQL query to calculate the difference between the maximum salary of the job and the employee's salary. 
-- Return job title, employee name, and salary difference.
SELECT JOB_TITLE, concat_ws(" ",FIRST_NAME,LAST_NAME) AS EMPLOYEE_NAME, (MAX_SALARY - SALARY) AS SALARY_DIFF FROM EMPLOYEES
JOIN JOBS
ON EMPLOYEES.JOB_ID = JOBS.JOB_ID;
-----------------------------------------------------------------------------------------------------------------------

# 14. write a SQL query to calculate the average salary, the number of employees receiving commissions in that department. 
-- Return department name, average salary and number of employees.
SELECT DEPARTMENT_NAME, ROUND(AVG(SALARY),2) AS AVERAGE_SALARY, COUNT(COMMISSION_PCT) AS NO_OF_EMPLOYEES FROM DEPARTMENTS
JOIN EMPLOYEES USING (DEPARTMENT_ID)
GROUP BY DEPARTMENT_NAME;
-----------------------------------------------------------------------------------------------------------------------

# 15. write a SQL query to calculate the difference between the maximum salary and 
-- the salary of all the employees who work in the department of ID 80. Return job title, employee name and salary difference.
SELECT JOB_TITLE, CONCAT_WS(" ", FIRST_NAME, LAST_NAME) AS EMPLOYEE_NAME, (MAX_SALARY-SALARY) AS SALARY_DIFF FROM JOBS
JOIN EMPLOYEES USING (JOB_ID)
WHERE DEPARTMENT_ID=80;
-----------------------------------------------------------------------------------------------------------------------

# 16. write a SQL query to find the name of the country, city, and departments, which are running there.
SELECT COUNTRY_NAME, CITY, DEPARTMENT_NAME FROM LOCATIONS
JOIN COUNTRIES USING (COUNTRY_ID)
JOIN DEPARTMENTS USING (LOCATION_ID);
-----------------------------------------------------------------------------------------------------------------------

# 17. write a SQL query to find the department name and the full name (first and last name) of the manager.
SELECT CONCAT_WS(" ", FIRST_NAME, LAST_NAME) AS MANAGER_NAME, DEPARTMENT_NAME FROM DEPARTMENTS
JOIN EMPLOYEES
ON DEPARTMENTS.MANAGER_ID = EMPLOYEES.EMPLOYEE_ID;
-----------------------------------------------------------------------------------------------------------------------

# 18. write a SQL query to calculate the average salary of employees for each job title.
SELECT JOB_TITLE, AVG(SALARY) FROM JOBS
JOIN EMPLOYEES USING (JOB_ID)
GROUP BY JOB_TITLE;
-----------------------------------------------------------------------------------------------------------------------

# 19. write a SQL query to find the employees who earn $12000 or more.
-- Return employee ID, starting date, end date, job ID and department ID.
SELECT EMPLOYEES.EMPLOYEE_ID, START_DATE, END_DATE, EMPLOYEES.JOB_ID, EMPLOYEES.DEPARTMENT_ID FROM JOB_HISTORY
JOIN EMPLOYEES USING (EMPLOYEE_ID)
WHERE SALARY >= 12000;
-----------------------------------------------------------------------------------------------------------------------

# 20. write a SQL query to find out which departments have at least two employees. Group the result set on country name and city.
-- Return country name, city, and number OF EMPLOYEES.
SELECT COUNTRY_NAME, CITY, DEPARTMENT_ID, COUNT(EMPLOYEE_ID) AS NO_OF_EMPLOYEES FROM EMPLOYEES
JOIN DEPARTMENTS USING (DEPARTMENT_ID)
JOIN LOCATIONS USING (LOCATION_ID)
JOIN COUNTRIES USING (COUNTRY_ID)
GROUP BY COUNTRY_NAME, CITY
HAVING NO_OF_EMPLOYEES >= 2;
-----------------------------------------------------------------------------------------------------------------------

# 21. write a SQL query to find the department name, full name (first and last name) of the manager and their city.
SELECT DEPARTMENT_NAME, CONCAT_WS(" ",FIRST_NAME, LAST_NAME) AS MANAGER_NAME, CITY FROM COUNTRIES
JOIN LOCATIONS USING (COUNTRY_ID)
JOIN DEPARTMENTS USING (LOCATION_ID)
JOIN EMPLOYEES
ON EMPLOYEES.EMPLOYEE_ID = DEPARTMENTS.MANAGER_ID;
-----------------------------------------------------------------------------------------------------------------------

# 22. write a SQL query to calculate the number of days worked by employees in a department of ID 80.
-- Return employee ID, job title, number of days worked.
SELECT EMPLOYEE_ID, JOB_TITLE, DATEDIFF(END_DATE, START_DATE) AS DAYS_WORKED FROM JOB_HISTORY
JOIN JOBS USING(JOB_ID)
JOIN DEPARTMENTS USING(DEPARTMENT_ID)
WHERE DEPARTMENT_ID = 80;
-----------------------------------------------------------------------------------------------------------------------

# 23. write a SQL query to find full name (first and last name), and salary of all employees working 
-- in any department in the city of London.
SELECT CONCAT(FIRST_NAME," ", LAST_NAME) AS EMPLOYEE_NAME, SALARY FROM EMPLOYEES
JOIN DEPARTMENTS USING (DEPARTMENT_ID)
JOIN LOCATIONS USING (LOCATION_ID)
JOIN COUNTRIES USING (COUNTRY_ID)
WHERE CITY = 'LONDON';
-----------------------------------------------------------------------------------------------------------------------

# 24. write a SQL query to find full name (first and last name), job title, start and end date of last jobs of employees 
-- who did not receive commissions.
SELECT CONCAT(FIRST_NAME," ", LAST_NAME) AS EMPLOYEE_NAME, JOB_TITLE, H.* FROM EMPLOYEES AS E
JOIN (SELECT MAX(START_DATE), MAX(END_DATE), EMPLOYEE_ID FROM JOB_HISTORY GROUP BY EMPLOYEE_ID) AS H
ON E.EMPLOYEE_ID = H.EMPLOYEE_ID
JOIN JOBS AS J
ON E.JOB_ID = J.JOB_ID
WHERE E.COMMISSION_PCT IS NULL;
-----------------------------------------------------------------------------------------------------------------------

# 25. write a SQL query to find the department name, department ID, and number of employees in each department.
SELECT DEPARTMENT_NAME, DEPARTMENT_ID, COUNT(EMPLOYEE_ID) AS NO_OF_EMPLOYEES FROM DEPARTMENTS
JOIN EMPLOYEES USING (DEPARTMENT_ID)
GROUP BY DEPARTMENT_NAME;
-----------------------------------------------------------------------------------------------------------------------

# 26. write a SQL query to find out the full name (first and last name) of the employee with an ID and 
-- the name of the country where he/she is currently employed.
SELECT CONCAT(FIRST_NAME," ", LAST_NAME) AS EMPLOYEE_NAME, EMPLOYEE_ID, COUNTRY_NAME FROM COUNTRIES
JOIN LOCATIONS USING (COUNTRY_ID)
JOIN DEPARTMENTS USING (LOCATION_ID)
JOIN EMPLOYEES USING (DEPARTMENT_ID);
---------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------
