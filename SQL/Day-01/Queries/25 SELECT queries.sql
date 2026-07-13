select * from employees;
select * from departments;
select * from salaries;

select employee_name , email ,  hire_date from employees;

select * from employees where department_id = 2 ;

select * from employees where status = 'Active';

select employee_id from salaries where salary > 70000; 

select * from employees where employee_name like 'A%';

select * from employees where employee_name like '%Patel';

select * from employees where department_id IN (2,3,4);

select * from employees where department_id = 2 OR department_id = 3 OR department_id = 4;

select * from salaries where salary between 50000 AND 80000;

select * from employees where department_id = 2 AND status = 'Active';

select * from employees where employee_role = 1 OR employee_role = 3;

select * from employees where department_id != 2;

select * from employees order by employee_name ASC;

select * from employees limit 5;

select * from salaries order by salary DESC LIMIT 10;

select distinct department_id from employees;

select employee_name as Name, employee_role as Position from employees;

select * from employees where status = 'Active' AND employee_role LIKE '%Developer%';

select * from employees where hire_date > '2023-01-01';

select * from employees where year(hire_date) = 2022;

select * from employees where department_id = 2 AND gender = 'Female';

select * from employees where employee_role LIKE '%Developer%';

select * from employees where date_of_birth < '1998-01-01';

select * from employees order by hire_date DESC;

select * from employees where status = 'Active' AND department_id IN(2,3,5);






