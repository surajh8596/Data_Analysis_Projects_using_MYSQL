# 1. Write a SQL query to find those employees who receive a higher salary than the employee with ID 163. Return first name, last name.
USE HR;
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY > (SELECT SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID=163);
---------------------------------------------------------------------------------------------------------------------------------------

# 2. Write a SQL query to find out which employees have the same designation as the employee whose ID is 169.
	-- Return first name, last name, department ID and job ID.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, JOB_ID FROM EMPLOYEES
WHERE JOB_ID = (SELECT JOB_ID FROM EMPLOYEES WHERE EMPLOYEE_ID=169);
---------------------------------------------------------------------------------------------------------------------------------------

# 3. Write a SQL query to find those employees whose salary matches the lowest salary of any of the departments.
	-- Return first name, last name and department ID.
SELECT FIRST_NAME, LAST_NAME, EMPLOYEE_ID, DEPARTMENT_ID, SALARY FROM EMPLOYEES
WHERE SALARY IN (SELECT MIN(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID);
---------------------------------------------------------------------------------------------------------------------------------------

# 4. Write a SQL query to find those employees who earn more than the average salary. Return employee ID, first name, last name.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);
---------------------------------------------------------------------------------------------------------------------------------------
# 5. Write a SQL query to find those employees who report to that manager whose first name is ‘Payam’.
	-- Return first name, last name, employee ID and salary.
SELECT FIRST_NAME, LAST_NAME, EMPLOYEE_ID, MANAGER_ID, SALARY FROM EMPLOYEES
WHERE MANAGER_ID = (SELECT MANAGER_ID FROM EMPLOYEES WHERE FIRST_NAME='PAYAM');
---------------------------------------------------------------------------------------------------------------------------------------

# 6. Write a SQL query to find all those employees who work in the Finance department. Return department ID, name (first), job ID and department name.
SELECT EMPLOYEES.DEPARTMENT_ID, FIRST_NAME, JOB_ID, DEPARTMENT_NAME, EMPLOYEE_ID FROM EMPLOYEES
LEFT JOIN DEPARTMENTS
ON DEPARTMENTS.DEPARTMENT_ID=EMPLOYEES.DEPARTMENT_ID
WHERE DEPARTMENT_NAME='FINANCE';
---------------------------------------------------------------------------------------------------------------------------------------

# 7. Write a SQL query to find the employee whose salary is 3000 and reporting person’s ID(Manager_ID) is 121. Return all fields.
SELECT * FROM EMPLOYEES
WHERE SALARY = 3000 AND MANAGER_ID=121;
---------------------------------------------------------------------------------------------------------------------------------------

# 8. Write a SQL query to find those employees whose ID matches any of the numbers 134, 159 and 183. Return all the fields.
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (134,159,183);
---------------------------------------------------------------------------------------------------------------------------------------

# 9. Write a SQL query to find those employees whose salary is in the range of 1000, and 3000 (Begin and end values have included.).
	-- Return all the fields.
SELECT * FROM EMPLOYEES
WHERE SALARY BETWEEN 1000 AND 3000;
---------------------------------------------------------------------------------------------------------------------------------------

# 10. Write a SQL query to find those employees whose salary falls within the range of the smallest salary and 2500. Return all the fields.
SELECT * FROM EMPLOYEES
WHERE SALARY < 2500;
---------------------------------------------------------------------------------------------------------------------------------------

# 11. Write a SQL query to find those employees who do not work in the departments where managers’ IDs are between 100 and 200.
	-- Return all the fields of the employeess.
SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN (SELECT DEPARTMENT_ID FROM DEPARTMENTS 
							WHERE MANAGER_ID BETWEEN 100 AND 200);
---------------------------------------------------------------------------------------------------------------------------------------

# 12. Write a SQL query to find those employees who get second-highest salary. Return all the fields of the employees.
SELECT * FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES WHERE SALARY < (SELECT MAX(SALARY) FROM EMPLOYEES));
---------------------------------------------------------------------------------------------------------------------------------------

# 13. Write a SQL query to find those employees who work in the same department as ‘Clara’. Exclude all those records where first name is ‘Clara’.
	-- Return first name, last name and hire date.
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE, DEPARTMENT_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM EMPLOYEES 
					   WHERE FIRST_NAME = 'CLARA')
                       AND FIRST_NAME != 'CLARA';
---------------------------------------------------------------------------------------------------------------------------------------

# 14. Write a SQL query to find those employees who work in a department where the employee’s first name contains the letter 'T'.
	-- Return employee ID, first name and last name.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE FIRST_NAME LIKE '%T%');
---------------------------------------------------------------------------------------------------------------------------------------

# 15. Write a SQL query to find those employees who earn more than the average salary and work in the same department as an employee whose 
	-- first name contains the letter 'J'. Return employee ID, first name and salary.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES
WHERE (SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES)) AND
(DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE FIRST_NAME LIKE '%J%'));
---------------------------------------------------------------------------------------------------------------------------------------

# 16. Write a SQL query to find those employees whose department is located at ‘Toronto’. Return first name, last name, employee ID, job ID.
SELECT FIRST_NAME, LAST_NAME, EMPLOYEE_ID, JOB_ID, EMPLOYEES.DEPARTMENT_ID, CITY FROM EMPLOYEES
RIGHT JOIN DEPARTMENTS
ON DEPARTMENTS.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID
INNER JOIN LOCATIONS
ON LOCATIONS.LOCATION_ID = DEPARTMENTS.LOCATION_ID
WHERE LOCATIONS.CITY = 'TORONTO';
---------------------------------------------------------------------------------------------------------------------------------------

# 17. Write a SQL query to find those employees whose salary is lower than that of employees whose job title is ‘MK_MAN’.
	-- Return employee ID, first name, last name, job ID.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID FROM EMPLOYEES
WHERE SALARY < (SELECT SALARY FROM EMPLOYEES WHERE JOB_ID = 'MK_MAN');
---------------------------------------------------------------------------------------------------------------------------------------

# 18. Write a SQL query to find those employees whose salary is lower than that of employees whose job title is "MK_MAN".
	-- Exclude employees of Job title ‘MK_MAN’. Return employee ID, first name, last name, job ID.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID FROM EMPLOYEES
WHERE (SALARY < (SELECT SALARY FROM EMPLOYEES WHERE JOB_ID = 'MK_MAN')) AND
				(JOB_ID !='MK_MAN');
---------------------------------------------------------------------------------------------------------------------------------------

# 19. Write a SQL query to find those employees whose salary exceeds the salary of all those employees whose job title is "PU_MAN".
	-- Exclude job title ‘PU_MAN’. Return employee ID, first name, last name, job ID.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID FROM EMPLOYEES
WHERE (SALARY > (SELECT SALARY FROM EMPLOYEES WHERE JOB_ID = 'PU_MAN')) AND
				(JOB_ID !='PU_MAN');
---------------------------------------------------------------------------------------------------------------------------------------

# 20. Write a SQL query to find those employees whose salaries are higher than the average for THRIR departments.
	-- Return employee ID, first name, last name, job ID.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY FROM EMPLOYEES
WHERE SALARY > ALL (SELECT AVG(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID);
---------------------------------------------------------------------------------------------------------------------------------------

# 21. Write a SQL query to check whether there are any employees with salaries exceeding 3700. Return first name, last name and department ID.
SELECT FIRST_NAME, LAST_NAME, EMPLOYEE_ID, DEPARTMENT_ID FROM EMPLOYEES
WHERE SALARY > 3700;
---------------------------------------------------------------------------------------------------------------------------------------

# 22. Write a SQL query to calculate total salary of the departments where at least one employee works. Return department ID, total salary.
SELECT DEPARTMENT_ID, SUM(SALARY) AS TOTAL_SALARY FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING COUNT(EMPLOYEE_ID) >=1;
---------------------------------------------------------------------------------------------------------------------------------------

# 23. Write a query to display the employee id, name and the job id column with a modified title SALESMAN for those employees whose job title
--  is ST_MAN and DEVELOPER for whose job title is IT_PROG.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID,
CASE JOB_ID WHEN 'ST_MAN' THEN 'SALESMAN'
			WHEN 'IT_PROG' THEN 'DEVELOPER'
ELSE JOB_ID
END CHANGED_JOB_ID
FROM EMPLOYEES;
---------------------------------------------------------------------------------------------------------------------------------------

# 24. Write a query to display the employee id, name, salary and the SalaryStatus column with a title HIGH and LOW respectively for those employees
	-- whose salary is more than and less than the average salary of all employees.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY,
CASE WHEN SALARY> (SELECT AVG(SALARY) FROM EMPLOYEES) THEN 'HIGH'
	 ELSE 'LOW'
	 END SALARY_STATUS FROM EMPLOYEES;
---------------------------------------------------------------------------------------------------------------------------------------

# 25. Write a query to display the employee id, name, SalaryDrawn, AvgCompare (salary - the average salary of all employees) and
	-- the SalaryStatus column with a title HIGH and LOW respectively for those employees whose salary is more than and less than
	-- the average salary of all employees
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY AS SALARY_DRAWN,
ROUND((SALARY - (SELECT AVG(SALARY) FROM EMPLOYEES)), 2) AS AVG_COMPARE,
CASE WHEN SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES) THEN 'HIGH'
	 ELSE 'LOW'
     END SALARY_STATUS FROM EMPLOYEES;
---------------------------------------------------------------------------------------------------------------------------------------

# 26. Write a SQL query to find all those departments where at least one employee is employed. Return department name.
SELECT DEPARTMENT_NAME, COUNT(EMPLOYEE_ID) AS NUMBER_OF_EMPLOYEE FROM EMPLOYEES
RIGHT JOIN DEPARTMENTS
ON DEPARTMENTS.DEPARTMENT_ID=EMPLOYEES.DEPARTMENT_ID
GROUP BY DEPARTMENTS.DEPARTMENT_NAME
HAVING NUMBER_OF_EMPLOYEE >=1;
---------------------------------------------------------------------------------------------------------------------------------------

# 27. Write a SQL query to find employees who work in departments located in the United Kingdom. Return first name.
-- OPTION-1
SELECT EMPLOYEE_ID, FIRST_NAME, COUNTRY_NAME FROM EMPLOYEES
INNER JOIN DEPARTMENTS
ON DEPARTMENTS.DEPARTMENT_ID=EMPLOYEES.DEPARTMENT_ID
INNER JOIN LOCATIONS
ON DEPARTMENTS.LOCATION_ID=LOCATIONS.LOCATION_ID
INNER JOIN COUNTRIES
ON COUNTRIES.COUNTRY_ID=LOCATIONS.COUNTRY_ID
WHERE COUNTRY_NAME='UNITED KINGDOM';

-- OPTION- 2
SELECT FIRST_NAME FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM DEPARTMENTS
						WHERE LOCATION_ID IN (SELECT LOCATION_ID FROM LOCATIONS
                        WHERE COUNTRY_ID IN (SELECT COUNTRY_ID FROM COUNTRIES
                        WHERE COUNTRY_NAME='UNITED KINGDOM')));
---------------------------------------------------------------------------------------------------------------------------------------

# 28. Write a SQL query to find out which employees are earning more than the average salary and who work in any of the IT departments.
	-- Return last name.
SELECT LAST_NAME, DEPARTMENT_NAME FROM EMPLOYEES
INNER JOIN DEPARTMENTS
ON DEPARTMENTS.DEPARTMENT_ID=EMPLOYEES.DEPARTMENT_ID
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES) 
AND DEPARTMENTS.DEPARTMENT_NAME='IT';
---------------------------------------------------------------------------------------------------------------------------------------

# 29. Write a SQL query to find all those employees who earn more than an employee whose last name is 'Ozer'. 
	-- Sort the result in ascending order by last name. Return first name, last name and salary.
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES
WHERE SALARY > (SELECT SALARY FROM EMPLOYEES WHERE LAST_NAME='OZER');
---------------------------------------------------------------------------------------------------------------------------------------

# 30. Write a SQL query find the employees who report to a manager based in the United States. Return first name, last name.
-- OPTION-1
SELECT FIRST_NAME, LAST_NAME FROM EMPLOYEES
WHERE MANAGER_ID IN (SELECT MANAGER_ID FROM EMPLOYEES
					WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM DEPARTMENTS
					WHERE LOCATION_ID IN (SELECT LOCATION_ID FROM LOCATIONS
					WHERE COUNTRY_ID='US')));

-- OPTION-2
SELECT FIRST_NAME, LAST_NAME, COUNTRY_ID FROM EMPLOYEES
INNER JOIN DEPARTMENTS
ON DEPARTMENTS.MANAGER_ID=EMPLOYEES.MANAGER_ID
INNER JOIN LOCATIONS
ON DEPARTMENTS.LOCATION_ID=DEPARTMENTS.LOCATION_ID
WHERE LOCATIONS.COUNTRY_ID='US';
---------------------------------------------------------------------------------------------------------------------------------------

# 31. Write a SQL query to find those employees whose salaries exceed 50% of their department's total salary bill. Return first name, last name.
SELECT E1.FIRST_NAME, E1.LAST_NAME FROM EMPLOYEES E1
WHERE SALARY > (SELECT ROUND(SUM(SALARY)/2, 2) FROM EMPLOYEES E2
				WHERE E1.DEPARTMENT_ID=E2.DEPARTMENT_ID);
---------------------------------------------------------------------------------------------------------------------------------------

# 32. Write a SQL query to find those employees who are managers. Return ALL FIELD employees table.
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (SELECT DISTINCT MANAGER_ID FROM EMPLOYEES);
---------------------------------------------------------------------------------------------------------------------------------------

# 33. Write a SQL query to find those employees who manage a department. Return all the fields of employees table.
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID = ANY (SELECT MANAGER_ID FROM DEPARTMENTS);
---------------------------------------------------------------------------------------------------------------------------------------

# 34. Write a SQL query to search for employees who receive such a salary, which is the maximum salary for salaried employees, 
	-- hired between January 1st, 1987 and December 31st, 1999. Return employee ID, first name, last name, salary, department name and city.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, HIRE_DATE, DEPARTMENTS.DEPARTMENT_NAME, LOCATIONS.CITY FROM EMPLOYEES
INNER JOIN DEPARTMENTS
ON EMPLOYEES.DEPARTMENT_ID=DEPARTMENTS.DEPARTMENT_ID
INNER JOIN LOCATIONS
ON DEPARTMENTS.LOCATION_ID=LOCATIONS.LOCATION_ID
WHERE EMPLOYEES.HIRE_DATE BETWEEN '1987-01-01' AND '1999-12-31' AND
SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES);
---------------------------------------------------------------------------------------------------------------------------------------

# 35. Write a SQL query to find those departments that are located in the city of London. Return department ID, department name, CITY.
-- OPTION-1
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATIONS.CITY FROM DEPARTMENTS
INNER JOIN LOCATIONS
ON DEPARTMENTS.LOCATION_ID=LOCATIONS.LOCATION_ID
WHERE CITY='LONDON';

-- OPTION-2
SELECT DEPARTMENT_ID, DEPARTMENT_NAME FROM DEPARTMENTS
WHERE LOCATION_ID = (SELECT LOCATION_ID FROM LOCATIONS
					 WHERE CITY='LONDON');
---------------------------------------------------------------------------------------------------------------------------------------

# 36. Write a SQL query to find those employees who earn more than the average salary. Sort the result-set in descending order by salary.
	-- Return first name, last name, salary, and department ID.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES)
ORDER BY SALARY DESC;
---------------------------------------------------------------------------------------------------------------------------------------

# 37. Write a SQL query to find those employees who earn more than the maximum salary for a department of ID 40
	-- Return first name, last name and department ID.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES
WHERE SALARY > (SELECT MAX(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID=40);
---------------------------------------------------------------------------------------------------------------------------------------

# 38. Write a SQL query to find departments for a particular location. The location matches the location of the department of ID 30.
-- Return department name and department ID.
SELECT DEPARTMENT_NAME, DEPARTMENT_ID FROM DEPARTMENTS
WHERE LOCATION_ID = ALL (SELECT LOCATION_ID FROM DEPARTMENTS
						 WHERE DEPARTMENT_ID=30);
---------------------------------------------------------------------------------------------------------------------------------------

# 39. Write a SQL query to find employees who work for the department in which employee ID 201 is employed.
	-- Return first name, last name, salary, and department ID.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM EMPLOYEES
					   WHERE EMPLOYEE_ID=201);
---------------------------------------------------------------------------------------------------------------------------------------

# 40. Write a SQL query to find those employees whose salary matches that of the employee who works in department ID 40.
-- Return first name, last name, salary, and department ID.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES
WHERE SALARY = (SELECT SALARY FROM EMPLOYEES
				WHERE DEPARTMENT_ID=40);
---------------------------------------------------------------------------------------------------------------------------------------

# 41. Write a SQL query to find those employees who work in the department 'Marketing'. Return first name, last name and department ID.
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS
					   WHERE DEPARTMENT_NAME='MARKETING');
---------------------------------------------------------------------------------------------------------------------------------------

# 42. Write a SQL query to find those employees who earn more than the minimum salary of a department of ID 40.
	-- Return first name, last name, salary, and department ID.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES
WHERE SALARY > (SELECT MAX(SALARY) FROM EMPLOYEES
				WHERE DEPARTMENT_ID=40);
---------------------------------------------------------------------------------------------------------------------------------------

# 43. Write a SQL query to find those employees who joined after the employee whose ID is 165. Return first name, last name and hire date.
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE FROM EMPLOYEES
WHERE HIRE_DATE > (SELECT HIRE_DATE FROM EMPLOYEES
				   WHERE EMPLOYEE_ID=165);
---------------------------------------------------------------------------------------------------------------------------------------

# 44. Write a SQL query to find those employees who earn less than the minimum salary of a department of ID 70.
-- Return first name, last name, salary, and department ID.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES
WHERE SALARY < (SELECT MIN(SALARY) FROM EMPLOYEES
				WHERE DEPARTMENT_ID=70);
---------------------------------------------------------------------------------------------------------------------------------------

# 45. Write a SQL query to find those employees who earn less than the average salary and work at the department where Laura(first name) is employed.
	-- Return first name, last name, salary, and department ID.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES
WHERE (SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES)) AND
	  (DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM EMPLOYEES 
      WHERE FIRST_NAME='LAURA'));
---------------------------------------------------------------------------------------------------------------------------------------

# 46. Write a SQL query to find all employees whose department is located in London. Return first name, last name, salary, and department ID.
SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES
WHERE DEPARTMENT_ID = ALL (SELECT DEPARTMENT_ID FROM DEPARTMENTS
						   WHERE LOCATION_ID = (SELECT LOCATION_ID FROM LOCATIONS
												WHERE CITY='LONDON'));
---------------------------------------------------------------------------------------------------------------------------------------

# 47. Write a SQL query to find the city of the employee of ID 134. Return city.
SELECT CITY FROM LOCATIONS
WHERE LOCATION_ID = (SELECT LOCATION_ID FROM DEPARTMENTS
					 WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM EMPLOYEES
											WHERE EMPLOYEE_ID=134));
---------------------------------------------------------------------------------------------------------------------------------------

# 48. Write a SQL query to find those departments where maximum salary is 7000 and above.
	-- The employees worked in those departments have already completed one or more jobs.
	-- Return all the fields of the departments.
SELECT * FROM DEPARTMENTS
WHERE DEPARTMENT_ID = ALL (SELECT DEPARTMENT_ID FROM EMPLOYEES
					   WHERE SALARY > ALL (SELECT MAX(SALARY)>7000 FROM EMPLOYEES
									   WHERE EMPLOYEE_ID = ALL (SELECT EMPLOYEE_ID FROM JOB_HISTORY
															 WHERE END_DATE IS NOT NULL)));
---------------------------------------------------------------------------------------------------------------------------------------

# 49. Write a SQL query to find those departments where the starting salary is at least 8000. Return all the fields of departments.
SELECT * FROM DEPARTMENTS
WHERE DEPARTMENT_ID = ALL (SELECT DEPARTMENT_ID FROM JOBS
					  WHERE MIN_SALARY>=8000);
---------------------------------------------------------------------------------------------------------------------------------------

# 50. Write a SQL query to find those managers who supervise four or more employees. Return manager name, department ID.
SELECT CONCAT(FIRST_NAME," ",LAST_NAME) AS MANAGER_NAME, DEPARTMENT_ID FROM EMPLOYEES
WHERE EMPLOYEE_ID IN (SELECT MANAGER_ID FROM EMPLOYEES GROUP BY MANAGER_ID HAVING COUNT(EMPLOYEE_ID)>4);
---------------------------------------------------------------------------------------------------------------------------------------

# 51. Write a SQL query to find employees who have previously worked as 'Sales Representatives'. Return all the fields of jobs.
SELECT * FROM JOBS
WHERE JOB_ID IN (SELECT JOB_ID FROM EMPLOYEES
				 WHERE EMPLOYEE_ID IN (SELECT EMPLOYEE_ID FROM JOB_HISTORY
									   WHERE JOB_ID= 'SA_REP'));
---------------------------------------------------------------------------------------------------------------------------------------

# 52. Write a SQL query to find those employees who earn the second-lowest salary of all the employees. Return all the fields of employees.
SELECT * FROM EMPLOYEES AS E1
WHERE 2 = (SELECT COUNT( DISTINCT SALARY) FROM EMPLOYEES AS E2
				WHERE SALARY  <=E1.SALARY);
            
---------------------------------------------------------------------------------------------------------------------------------------
# 53. Write a SQL query to find the departments managed by Susan. Return all the fields of departments.
SELECT * FROM DEPARTMENTS
WHERE MANAGER_ID IN (SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE FIRST_NAME='SUSAN');
---------------------------------------------------------------------------------------------------------------------------------------

# 54. Write a SQL query to find those employees who earn the highest salary in a department. Return department ID, employee name, and salary.
SELECT DEPARTMENT_ID, EMPLOYEE_ID, SALARY FROM EMPLOYEES E1
WHERE SALARY IN (SELECT MAX(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID=E1.DEPARTMENT_ID);
---------------------------------------------------------------------------------------------------------------------------------------

# 55. Write a SQL query to find those employees who have not had a job in the past. Return all the fields of employees.
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID NOT IN (SELECT EMPLOYEE_ID FROM JOB_HISTORY);
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
