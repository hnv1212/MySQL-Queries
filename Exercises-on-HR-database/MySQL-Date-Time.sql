-- 1. display the first day of the month (in datetime format) three months before the current month.
SELECT date(((PERIOD_ADD(EXTRACT(YEAR_MONTH FROM CURDATE()), -3) *100) +1));

-- 2. display the last day of the month (in datetime format) three months before the current month.
SELECT (SUBDATE(ADDDATE(CURDATE(), INTERVAL 1 MONTH), INTERVAL DAYOFMONTH(CURDATE())DAY)) AS LastDayOfTheMonth;

-- 3. get the distinct Mondays from hire_date in employees tables.
SELECT DISTINCT(STR_TO_DATE(CONCAT(YEARWEEK(hire_date), '1'), '%x%v%w')) FROM employees;

-- 4. get the first day of the current year.
SELECT MAKEDATE(EXTRACT(YEAR FROM CURDATE()), 1);

-- 5. get the last day of the current year.
SELECT STR_TO_DATE(CONCAT(12, 31, EXTRACT(YEAR FROM CURDATE())), '%m%d%Y');

-- 6. calculate the age in year.
SELECT YEAR(CURRENT_TIMESTAMP) - YEAR("1967-06-08") - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT("1967-06-08", 5)) as age;

-- 7. get the current date in spacific format: September 4, 2014
SELECT DATE_FORMAT(CURDATE(), '%M %e, %Y') AS 'Current_date';

-- 8. get the current date in Thursday September 2014 format.
SELECT DATE_FORMAT(NOW(), '%W %M %Y');

-- 9. extract the year from the current date.
SELECT EXTRACT(YEAR FROM NOW());

-- 10. get the DATE value from a given day (number in N).
SELECT FROM_DAYS(730677);

-- 11. get the first name and hire date from employees table where hire date between '1987-06-01' and '1987-07-30'.
SELECT FIRST_NAME, HIRE_DATE 
    FROM employees
        WHERE HIRE_DATE 
            BETWEEN '1987-06-01 00:00:00'
                AND '1987-07-30  23:59:59';

-- 12. display the current date in the specific format: Wednesday 30th August 2017 :00:00
SELECT date_format(CURDATE(), '%W %D %M %Y %T');

-- 13. display the current date in a given format: 05/09/2014
SELECT date_format(CURDATE(), '%d/%m/%Y');

-- 14. display the current date in the specified format: 12:00 AM Aug 30, 2017
SELECT date_format(CURDATE(), '%l:%i %p %b %e, %Y');

-- 15. get the firstname, lastname who joined in the month of June.
SELECT first_name, last_name
    FROM employees WHERE MONTH(HIRE_DATE) = 6;

-- 16. get the years in which more thann 10 employees joined.
SELECT DATE_FORMAT(HIRE_DATE, '%Y')
    FROM employees
        GROUP BY DATE_FORMAT(HIRE_DATE, '%Y')
            HAVING COUNT(employee_id) > 10;

-- 17. get the first name of employees who joined in 1987.
SELECT FIRST_NAME, HIRE_DATE 
    FROM employees
    WHERE YEAR(HIRE_DATE)=1987;

-- 18. get department name, manager name, and salary of the manager for all managers whose experience is more than 5 years.
SELECT department_name, first_name, salary
FROM departments D
JOIN employees E 
ON (D.manager_id=E.manager_id)
WHERE (SYSDATE()-HIRE_DATE)/365 > 5;

-- 19. get employee ID, last name, and date of first salary of the employees.
SELECT employee_id, last_name, hire_date, LAST_DAY(hire_date)
FROM employees;

-- 20. get first name, hire date and experience of the employees.
SELECT FIRST_NAME, SYSDATE(), HIRE_DATE, DATEDIFF(SYSDATE(), hire_date)/365
FROM employees;

-- 21. get the department ID, year, and number of employees joined.
SELECT department_id, DATE_FORMAT(hire_date, '%Y'), 
    COUNT(employee_id)
     FROM employees
        GROUP BY department_id, DATE_FORMAT(hire_date, '%Y')
            ORDER BY department_id;

