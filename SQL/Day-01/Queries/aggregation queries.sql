select count(*) as total_emp from employees;

select count(*) as total_active_emp from employees where status = 'Active';

select count(phone) as total_phone from employees;

select SUM(salary) from salaries;

select SUM(salary) as total_salary from salaries where salary between 50000 AND 80000;

select AVG(salary) as avg_salary from salaries;

select AVG(salary) as avg_salary from salaries where salary > 60000;

select MAX(salary) as max_salary from salaries;

select MAX(salary) from salaries where salary < 90000;

select MIN(salary) from salaries;

select MIN(salary) from salaries where salary < 50000;

select
COUNT(*) AS total_records,
SUM(salary) AS total_salary,
AVG(salary) AS average_salary,
MIN(salary) AS minimum_salary,
MAX(salary) AS maximum_salary
from salaries;

select count(phone) from employees;

select count(gender) as total_male from employees where gender = 'Male';

select count(*) from employees where department_id = 2;

select count(*) from employees where hire_date > '2023-01-01';

select count(*) from employees where department_id IN(1,3,5);

select MIN(salary) from salaries where salary < 60000;

select MAX(salary) from salaries where salary > 80000;

select AVG(salary) from salaries where salary between 50000 AND 80000;