-- JOIN
-- INNER JOIN
-- OUTER JOIN
-- LEFT OUTER JOIN
-- RIGHT OUTER JOIN
-- FULL OUTER JOIN
-- CROSS JOIN
-- SELF JOIN


-- INNER JOIN(ONLY THOSE COLUMN WILL RESULTS WHICH ARE COMMON)

USE HR;

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

SELECT * FROM EMPLOYEES INNER JOIN DEPARTMENTS USING(DEPARTMENT_ID);

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, DEPARTMENT_ID, DEPARTMENT_NAME FROM EMPLOYEES
INNER JOIN 
DEPARTMENTS
USING (DEPARTMENT_ID);

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, DEPARTMENT_ID, DEPARTMENT_NAME FROM EMPLOYEES
JOIN 
DEPARTMENTS
USING (DEPARTMENT_ID);


SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, MANAGER_ID FROM EMPLOYEES
INNER JOIN
DEPARTMENTS
USING(MANAGER_ID);


-- OUTER JOIN
-- LEFT OUTER JOIN (RESULTS ALL COLUMNS FROM LEFT TABLE AND ONLY COMMON FROM RIGHT TABLE)

SELECT concat(FIRST_NAME, " ", LAST_NAME) AS FULL_NAME, employee_id, department_id, department_name, salary FROM EMPLOYEES 
LEFT JOIN DEPARTMENTS USING (DEPARTMENT_ID);

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, DEPARTMENT_ID, DEPARTMENT_NAME FROM EMPLOYEES
LEFT JOIN 
DEPARTMENTS
USING (DEPARTMENT_ID);

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, MANAGER_ID FROM EMPLOYEES
LEFT JOIN
DEPARTMENTS
USING(MANAGER_ID);


-- RIGHT OUTER JOIN (RESULTS ALL COLUMNS FROM RIGHT TABLE AND ONLY COMMON FROM LEFT TABLE)

SELECT * FROM EMPLOYEES RIGHT JOIN DEPARTMENTS USING (DEPARTMENT_ID);

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, DEPARTMENT_ID, DEPARTMENT_NAME FROM EMPLOYEES
RIGHT JOIN 
DEPARTMENTS
USING (DEPARTMENT_ID);

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, MANAGER_ID FROM EMPLOYEES
RIGHT JOIN
DEPARTMENTS
USING(MANAGER_ID);


-- FULL OUTER JOIN (LEFT JOIN + RIGHT JOIN)

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, DEPARTMENT_ID, DEPARTMENT_NAME FROM EMPLOYEES
LEFT JOIN 
DEPARTMENTS
USING (DEPARTMENT_ID)
UNION
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, DEPARTMENT_ID, DEPARTMENT_NAME FROM EMPLOYEES
RIGHT JOIN 
DEPARTMENTS
USING (DEPARTMENT_ID);


-- USING ELIAS FOR TABLBE NAME AND COLUMN NAME
ALTER TABLE DEPARTMENTS RENAME COLUMN DEPARTMENT_ID TO DEPT_ID;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, DEPARTMENT_NAME, DEPARTMENT_ID FROM EMPLOYEES
INNER JOIN 
DEPARTMENTS
ON (EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPT_ID);

ALTER TABLE DEPARTMENTS RENAME COLUMN DEPARTMENT_ID TO DEPT_ID;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, DEPARTMENT_ID, DEPARTMENT_NAME FROM EMPLOYEES E
INNER JOIN 
DEPARTMENTS D
ON (E.DEPARTMENT_ID = D.DEPT_ID);

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, DEPARTMENT_ID, DEPARTMENT_NAME FROM EMPLOYEES E
INNER JOIN 
DEPARTMENTS D
ON (E.DEPARTMENT_ID = D.DEPT_ID);


-- CROSS JOIN

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, DEPARTMENT_ID, DEPARTMENT_NAME FROM EMPLOYEES E
CROSS JOIN
DEPARTMENTS;


-- SELF JOIN

SELECT A.EMPLOYEE_ID, CONCAT(A.FIRST_NAME, A.LAST_NAME) EMPLOYEE_NAME, A.MANAGER_ID, CONCAT(B.FIRST_NAME, B.LAST_NAME) MANAGER_NAME
FROM EMPLOYEES A
JOIN
EMPLOYEES B
ON (B.EMPLOYEE_ID = A.MANAGER_ID);

SELECT A.DEPT_ID, A.DEPARTMENT_NAME, B.MANAGER_ID, B.LOCATION_ID
FROM DEPARTMENTS A 
JOIN
DEPARTMENTS B
ON (A.DEPT_ID = B.MANAGER_ID);
