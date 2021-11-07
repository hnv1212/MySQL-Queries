-- 1. get the job_id and related employee's id.
SELECT job_id, GROUP_CONCAT(employee_id, ' ') 'Employees ID'
FROM employees GROUP BY job_id;

-- 2. update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'.
UPDATE employees
SET phone_number = REPLACE(phone_number, '124', '999')
WHERE phone_number LIKE '%124%';

-- 3. get the details of the employees where the length of the first name greater thann or equal to 8.
SELECT * 
FROM employees
WHERE LENGTH(first_name) >= 8;

-- 4. display leading zeroes before maximum and minimum salary.
SELECT job_id, LPAD(max_salary, 7, '0') 'Max Salary',
LPAD(min_salary, 7, '0') 'Min Salary'
FROM jobs;

-- 5. append '@example.com' to email field.
UPDATE employees SET email = CONCAT(email, '@example.com');

-- 6. get the employee id, first name and hire month.
SELECT employee_id, first_name, MID(hire_date, 6, 2) as hire_month FROM employees;

-- 7. get the employee id, email id (discard the last three characters).
SELECT employee_id, REVERSE(SUBSTR(REVERSE(email), 4)) as Email_ID
FROM employees;

-- 8. find all employees where first name are in upper case.
SELECT * FROM employees
WHERE first_name = BINARY UPPER(first_name);

-- 9. extract the last 4 character of phone numbers.
SELECT RIGHT(phone_number, 4) as 'Ph.No.' FROM employees;

-- 10. get the last word of the street address.
SELECT location_id, street_address, 
SUBSTRING_INDEX(REPLACE(REPLACE(REPLACE(street_address,',',' '),')', ' '),'(', ' '),' ',-1)
AS 'Last--word-of-street_address'
FROM locations;

-- 11. get the locations that have minimum street length.
SELECT * FROM locations
WHERE LENGTH(street_address) <= (SELECT MIN(LENGTH(street_address))
FROM locations);

-- 12. display the first word from those job titles which contains more than one words.
SELECT job_title, SUBSTR(job_title, 1, INSTR(job_title, ' ')-1)
FROM jobs;

-- 13. display the length of first name for employees where last name contain character 'c' after 2nd position.
SELECT first_name, last_name FROM employees WHERE INSTR(last_name, 'C') > 2;

-- 14. display the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the employees' first names.
SELECT first_name "Name",
LENGTH(first_name) "Length"
FROM employees
WHERE first_name LIKE 'J%'
OR first_name LIKE 'M%'
OR first_name LIKE 'A%'
ORDER BY first_name;

-- 15. display the first name and salary for all employees. Format the salary to be 10 characters long, left padded with th $ symbol. Label the column SALARY.
SELECT first_name, 
LPAD(salary, 10, '$') SALARY
FROM employees;

-- 16. display the first eight characters of the employees' first names and indicates the amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. Sort the data in descending order of salary.
SELECT left(first_name, 8),
REPEAT('$', FLOOR(salary/1000))
'SALARY($)', salary 
FROM employees
ORDER BY salary DESC;

-- 17. display the employees with their code, first name, last name and hire date who hired either on seventh day of any month in any year.
SELECT employee_id, first_name, last_name, hire_date
FROM employees
WHERE POSITION("07" IN DATE_FORMAT(hire_date, '%d %m %Y')) > 0;

