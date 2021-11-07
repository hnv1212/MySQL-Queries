-- 1. display the names (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000
SELECT first_name, last_name, salary 
FROM employees
WHERE salary NOT BETWEEN 10000 AND 15000;

-- 2. display the name (first_name, last_name) and department ID of all employees in department 30 or 100 in ascendinng order.
SELECT first_name, last_name, department_id
FROM employees
WHERE department_id IN (30, 100)
ORDER BY department_id ASC;

-- 3. display the name (first_name, last_name) and salary for all employees whose salary is not in range $10,000 through $15,000 and are in department 30 or 100.
SELECT first_name, last_name, salary, department_id 
FROM employees
WHERE salary NOT BETWEEN 10000 AND 15000
AND department_id IN (30, 100);

-- 4. display the name (first_name, last_name) and hire date for all employees who were hired in 1987.
SELECT first_name, last_name, hire_date
FROM employees
WHERE YEAR(hire_date) LIKE '1987%'

-- 5. display the first_name of all employees who have both 'b' and 'c' in their first name.
SELECT first_name
FROM employees
WHERE first_name LIKE '%b%' AND first_name LIKE '%c%';

-- 6. display the last name, job, and salary for all employees whose job is that of a Programmer or a Shippinng Clerk, and salary is not equal to $4,500, $10,000, or $15,000
SELECT last_name, job_id, salary
FROM employees 
WHERE job_id IN ('IT_PROG', 'SH_CLERK')
AND salary NOT IN (4500, 10000, 15000)

-- 7. display the last name of employees whose name have exactly 6 characters.
SELECT last_name FROM employees WHERE last_name LIKE '______';

-- 8. display the last name of employees having 'e' as the third character.
SELECT last_name FROM employees WHERE last_name LIKE '__e%';

-- 9. display the jobs/designations available in the employees table.
SELECT DISTINCT job_id FROM employees;

-- 10. display the name (first_name, last_name), salary and PF (15% of salary) of all employees.
SELECT first_name, last_name, salary, salary * .15 PF from employees;

-- 11. select all records from employees where last name in 'JONES', 'BLAKE', 'SCOTT', 'KING' and 'FORD'.
SELECT *
FROM employees
WHERE last_name IN('JONES', 'BLAKE', 'SCOTT', 'KING', 'FORD');

