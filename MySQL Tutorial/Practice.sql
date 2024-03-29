USE NEW_HR;

SELECT * FROM emp_details_view;

SELECT * FROM employees;

SELECT * FROM countries;

SELECT * FROM departments;

SELECT * FROM job_history;

SELECT * FROM JOBS;

SELECT * FROM locations;

SELECT * FROM regions;


SELECT * FROM employees;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, COMMISSION_PCT FROM EMPLOYEES;

SELECT EMPLOYEE_ID EMP_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, COMMISSION_PCT FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, CONCAT(FIRST_NAME, " ", LAST_NAME) AS FULL_NAME, JOB_ID, SALARY, COMMISSION_PCT FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, CONCAT(FIRST_NAME, " ", LAST_NAME) AS FULL_NAME, JOB_ID, SALARY FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, COMMISSION_PCT FROM EMPLOYEES WHERE SALARY >5000;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES WHERE SALARY >20000;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY FROM EMPLOYEES WHERE SALARY BETWEEN 15000 AND 25000;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID BETWEEN 150 AND 160;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG' AND SALARY>8000;

SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES WHERE SALARY BETWEEN 5000 AND 10000 AND EMPLOYEE_ID BETWEEN 100 AND 200;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, COMMISSION_PCT FROM EMPLOYEES WHERE COMMISSION_PCT IS NULL;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, COMMISSION_PCT FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY FROM EMPLOYEES WHERE JOB_ID LIKE 'IT%';

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID FROM EMPLOYEES WHERE FIRST_NAME LIKE 'B%';

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID FROM EMPLOYEES WHERE JOB_ID LIKE 'ST%';

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID FROM EMPLOYEES WHERE JOB_ID LIKE '%RK';

SELECT EMPLOYEE_ID EMP_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, COMMISSION_PCT FROM EMPLOYEES WHERE FIRST_NAME LIKE 'S_E%';

SELECT EMPLOYEE_ID EMP_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, COMMISSION_PCT FROM EMPLOYEES ORDER BY SALARY;

SELECT EMPLOYEE_ID EMP_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, COMMISSION_PCT FROM EMPLOYEES ORDER BY SALARY DESC;

SELECT EMPLOYEE_ID EMP_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, COMMISSION_PCT FROM EMPLOYEES ORDER BY SALARY LIMIT 6;

SELECT EMPLOYEE_ID EMP_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, COMMISSION_PCT FROM EMPLOYEES ORDER BY SALARY DESC LIMIT 4;

SELECT EMPLOYEE_ID EMP_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, COMMISSION_PCT FROM EMPLOYEES ORDER BY SALARY DESC LIMIT 5;

SELECT EMPLOYEE_ID EMP_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, COMMISSION_PCT FROM EMPLOYEES ORDER BY JOB_ID, SALARY;

SELECT EMPLOYEE_ID EMP_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, COMMISSION_PCT FROM EMPLOYEES ORDER BY JOB_ID, SALARY DESC;

SELECT EMPLOYEE_ID EMP_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, COMMISSION_PCT FROM EMPLOYEES ORDER BY JOB_ID DESC, SALARY;

SELECT EMPLOYEE_ID EMP_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, COMMISSION_PCT FROM EMPLOYEES ORDER BY JOB_ID DESC, SALARY DESC;

SELECT EMPLOYEE_ID EMP_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, COMMISSION_PCT FROM EMPLOYEES ORDER BY 4;

SELECT * FROM EMPLOYEES ORDER BY 6;

SELECT EMPLOYEE_ID EMP_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, COMMISSION_PCT FROM EMPLOYEES WHERE JOB_ID IN ('IT_PROG','ST_MAN','SA_MAN');

SELECT EMPLOYEE_ID EMP_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, COMMISSION_PCT FROM EMPLOYEES WHERE JOB_ID NOT IN ('IT_PROG','ST_MAN','SA_MAN');

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, COMMISSION_PCT,
CASE WHEN EMPLOYEE_ID > 190 THEN SALARY*10+SALARY
ELSE SALARY
END UPDATED_SALARIES
FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, COMMISSION_PCT,
CASE JOB_ID WHEN 'ST_CLERK' THEN SALARY+10000
ELSE SALARY
END UPDATED_SALARIES
FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, COMMISSION_PCT,
CASE WHEN JOB_ID = 'SA_MAN' THEN SALARY*2+SALARY
WHEN EMPLOYEE_ID = 101 THEN SALARY+1000
ELSE SALARY
END UPDATED_SALARIES
FROM EMPLOYEES;


