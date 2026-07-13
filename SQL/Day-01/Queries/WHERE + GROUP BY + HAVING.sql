select department_id , count(*) as total_emp from employees group by department_id;

select gender , count(*) as count_gender from employees group by gender;

select status , count(status) from employees group by status;

select salary, COUNT(*) as employees from salaries group by salary;

select salary , count(*) as max_salary from salaries group by salary;

select year(hire_date) as year , count(*) from employees group by year(hire_date);

select year(date_of_birth) as year , count(*) from employees group by year(date_of_birth);

select department_id, COUNT(*) AS total_employees from employees GROUP BY department_id ORDER BY total_employees DESC;

select department_id , count(*) as total_emp from employees where status = 'Active'  group by department_id having count(*) > 5;

select department_id , count(*) as female_emp from employees where gender = 'Female'  group by department_id having count(*) >= 2;

select department_id , count(*) as male_emp from employees where gender = 'Male'  group by department_id having count(*) >= 3;


select year(hire_date) AS hire_year, count(*) AS total_employees from employees where status = 'Active' group by YEAR(hire_date) having COUNT(*) > 5;

select year(date_of_birth) AS birth_year, count(*) AS total_employees from employees where date_of_birth is not null group by year(date_of_birth) having COUNT(*) >= 3;

select department_id, count(*) AS total_employees from employees where hire_date >= '2023-01-01' group by department_id having COUNT(*) > 4;

SELECT e.department_id, avg(s.salary) AS department_average_salary from employees e
join salaries s ON e.employee_id = s.employee_id
group by e.department_id
having avg(s.salary) >
(
    select avg(salary)
    from salaries
);


select e.employee_id, e.employee_name, d.department_name, s.salary from employees e
join salaries s on e.employee_id = s.employee_id
join departments d on e.department_id = d.department_id
where s.salary > (
    select avg(s2.salary) * 1.5
    from employees e2
    join salaries s2 ON e2.employee_id = s2.employee_id
    where e2.department_id = e.department_id
);

select d.department_id, d.department_name, count(e.employee_id) AS headcount,
    SUM(s.salary) AS total_payroll,
    AVG(s.salary) AS average_salary,
    MIN(s.salary) AS minimum_salary,
    MAX(s.salary) AS maximum_salary
from departments d
join employees e ON d.department_id = e.department_id
join salaries s ON e.employee_id = s.employee_id
group by d.department_id, d.department_name
order by d.department_name;


