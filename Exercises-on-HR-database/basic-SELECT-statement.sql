-- 1. display the names (first_name, last_name) using alias name "First Name", "Last Name"
SELECT first_name "First Name", last_name "Last Name" FROM employees;

-- 2. get unique department ID from employee table
SELECT DISTINCT department_id FROM employees;

-- 3. get the details of all employees according to first name in descending order.
SELECT * 
    FROM employees
    ORDER BY first_name DESC;

-- 4. get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary).
SELECT first_name, last_name, salary, salary*.15 PF
    FROM employees;

-- 5. get the employee ID, name (first_name, last_name), salary in ascending order of salary.
SELECT employee_id, first_name, last_name, salary
    FROM employees
    ORDER BY salary;

-- 6. get the total salaries payable to employees.
SELECT SUM(salary) FROM employees;

-- 7. get the maximum and minimum salary from employees table.
SELECT MAX(salary), MIN(salary) FROM employees;

-- 8. get the average salary and number of employees in the employees table.
SELECT AVG(salary), COUNT(*) FROM employees;

-- 9. get the number of employees working with the company
SELECT COUNT(*) FROM employees;

-- 10. get the number of designations available in the employees table.
SELECT COUNT(DISTINCT job_id) FROM employees;

-- 11. get all first name from employees table in upper case
SELECT UPPER(first_name) FROM employees;

-- 12. get the first three characters of first name of all employees
SELECT SUBSTRING(first_name, 1, 3) FROM employees;

-- 13. calculate 171*214+625
SELECT 171*214+625 Result;

-- 14. get the name (for example Ellen Abel, Sundar Ande etc.) of all the employees from employees table.
SELECT CONCAT(first_name,' ', last_name) 'Employee Name' FROM employees;

-- 15. get first name of all employees table after removing white spaces from both side.
SELECT TRIM(first_name) FROM employees;

-- 16. get the length of the employee names (first_name, last_name) from employees table.
SELECT first_name, last_name, LENGTH(first_name) + LENGTH(last_name) 'Length of Names' 
    FROM employees;

-- 17. check if the first_name fields of the employees table contains numbers.
SELECT * 
    FROM employees
    WHERE first_name REGEXP '[0-9]';

-- 18. query to select first 10 records from a table
SELECT employee_id, first_name 
    FROM employees LIMIT 10;

-- 19. get monthly salary (round 2 decimal places) of all employees
SELECT first_name, last_name, round(salary/12,2) as 'Monthly Salary' FROM employees;