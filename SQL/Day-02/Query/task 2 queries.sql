# 1. Display every employee with their department name.

select e.employee_id , 
	concat(e.first_name,' ',e.last_name) as employee_name , 
	d.department_name ,
    e.employee_role , e.status , d.location
from employees e
inner join departments d
on e.department_id = d.department_id;


# 2. Display employees who are not assigned to any project. 

select 
e.employee_id ,
concat(e.first_name,' ',e.last_name) as employee_name 
from employees e
left join employee_projects ep 
 ON e.employee_id = ep.employee_id
 WHERE ep.employee_id IS NULL;
 
 
 # 3. Display all departments even if they have no employees. 
 
 SELECT
    d.department_id,
    d.department_name,
    CONCAT(e.first_name,' ',e.last_name) AS employee_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
ORDER BY d.department_id;

# 4. Display every employee with all projects they are working on.

SELECT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    p.project_name,
    ep.assigned_date
FROM employees e
INNER JOIN employee_projects ep
    ON e.employee_id = ep.employee_id
INNER JOIN projects p
    ON ep.project_id = p.project_id
ORDER BY e.employee_id;


# 5. Find employees earning more than the average salary. (revise) 

WITH latest_salary AS
(
    SELECT
        employee_id,
        salary,
        ROW_NUMBER() OVER (
            PARTITION BY employee_id
            ORDER BY effective_date DESC
        ) AS rn
    FROM salaries
)
SELECT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    ls.salary
FROM employees e
JOIN latest_salary ls
    ON e.employee_id = ls.employee_id
WHERE ls.rn = 1
  AND ls.salary >
    (
        SELECT AVG(salary)
        FROM latest_salary
        WHERE rn = 1
    )
ORDER BY ls.salary DESC;


# 6. Find departments having more than five employees. 

SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees
FROM departments d
JOIN employees e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name
HAVING COUNT(e.employee_id) > 5;


# 7. Display project names with the number of assigned employees.

SELECT
    p.project_name,
    COUNT(ep.employee_id) AS total_employees
FROM projects p
LEFT JOIN employee_projects ep
    ON p.project_id = ep.project_id
GROUP BY
    p.project_id,
    p.project_name
ORDER BY
    p.project_id;
    
    
    
# 8. Find employees who belong to the same department and earn the same salary. (revise) 

WITH latest_salary AS
(
    SELECT
        employee_id,
        salary,
        ROW_NUMBER() OVER(
            PARTITION BY employee_id
            ORDER BY effective_date DESC
        ) AS rn
    FROM salaries
)

SELECT
    CONCAT(e1.first_name,' ',e1.last_name) AS employee_1,
    CONCAT(e2.first_name,' ',e2.last_name) AS employee_2,
    d.department_name,
    ls1.salary
FROM employees e1

JOIN employees e2
ON e1.department_id = e2.department_id
AND e1.employee_id < e2.employee_id

JOIN latest_salary ls1
ON e1.employee_id = ls1.employee_id

JOIN latest_salary ls2
ON e2.employee_id = ls2.employee_id

JOIN departments d
ON e1.department_id = d.department_id

WHERE
    ls1.rn = 1
AND ls2.rn = 1
AND ls1.salary = ls2.salary

ORDER BY
d.department_name,
ls1.salary;


# 9. Find all employees hired after their department manager joined. 

SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    e.hire_date AS employee_hire_date,

    CONCAT(m.first_name, ' ', m.last_name) AS manager_name,
    m.hire_date AS manager_hire_date

FROM employees e

INNER JOIN employees m
ON e.manager_id = m.employee_id

WHERE e.hire_date > m.hire_date

ORDER BY e.hire_date;



# 10. Display every possible Employee–Project combination.

SELECT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    p.project_id,
    p.project_name
FROM employees e
CROSS JOIN projects p
ORDER BY
    e.employee_id,
    p.project_id;
    
    
# 11. Find employees earning the highest salary in each department.

WITH latest_salary AS
(
    SELECT
        employee_id,
        salary,
        ROW_NUMBER() OVER
        (
            PARTITION BY employee_id
            ORDER BY effective_date DESC
        ) AS rn
    FROM salaries
),

department_salary_rank AS
(
    SELECT
        e.employee_id,
        CONCAT(e.first_name,' ',e.last_name) AS employee_name,
        d.department_name,
        ls.salary,

        RANK() OVER
        (
            PARTITION BY e.department_id
            ORDER BY ls.salary DESC
        ) AS salary_rank

    FROM employees e

    JOIN departments d
        ON e.department_id = d.department_id

    JOIN latest_salary ls
        ON e.employee_id = ls.employee_id

    WHERE ls.rn = 1
)

SELECT
    department_name,
    employee_name,
    salary
FROM department_salary_rank
WHERE salary_rank = 1
ORDER BY department_name;


# 12. Find departments whose average salary is greater than the company average.

WITH latest_salary AS
(
    SELECT
        employee_id,
        salary,
        ROW_NUMBER() OVER
        (
            PARTITION BY employee_id
            ORDER BY effective_date DESC
        ) AS rn
    FROM salaries
)

SELECT
    d.department_name,
    ROUND(AVG(ls.salary),2) AS average_salary

FROM employees e

JOIN departments d
ON e.department_id = d.department_id

JOIN latest_salary ls
ON e.employee_id = ls.employee_id

WHERE ls.rn = 1

GROUP BY
d.department_id,
d.department_name

HAVING AVG(ls.salary) >
(
    SELECT AVG(salary)
    FROM latest_salary
    WHERE rn = 1
)

ORDER BY average_salary DESC;



# 13. Find employees working on more projects than the company average. 

SELECT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    COUNT(ep.project_id) AS total_projects
FROM employees e
JOIN employee_projects ep
    ON e.employee_id = ep.employee_id
GROUP BY
    e.employee_id,
    e.first_name,
    e.last_name
HAVING COUNT(ep.project_id) >
(
    SELECT AVG(project_count)
    FROM
    (
        SELECT
            COUNT(project_id) AS project_count
        FROM employee_projects
        GROUP BY employee_id
    ) AS employee_project_counts
)
ORDER BY total_projects DESC;



# 14. Find employees who worked on every project in their department.

SELECT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    d.department_name
FROM employees e

JOIN departments d
    ON e.department_id = d.department_id

JOIN employee_projects ep
    ON e.employee_id = ep.employee_id

JOIN projects p
    ON ep.project_id = p.project_id

WHERE p.department_id = e.department_id

GROUP BY
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name

HAVING COUNT(DISTINCT p.project_id) =
(
    SELECT COUNT(*)
    FROM projects p2
    WHERE p2.department_id = e.department_id
);


# 15. Display employees whose salary is greater than their managers salary. 

WITH latest_salary AS
(
    SELECT
        employee_id,
        salary,
        ROW_NUMBER() OVER
        (
            PARTITION BY employee_id
            ORDER BY effective_date DESC
        ) AS rn
    FROM salaries
)

SELECT
    CONCAT(e.first_name,' ',e.last_name) AS employee_name,
    ls_emp.salary AS employee_salary,

    CONCAT(m.first_name,' ',m.last_name) AS manager_name,
    ls_mgr.salary AS manager_salary

FROM employees e

JOIN employees m
ON e.manager_id = m.employee_id

JOIN latest_salary ls_emp
ON e.employee_id = ls_emp.employee_id

JOIN latest_salary ls_mgr
ON m.employee_id = ls_mgr.employee_id

WHERE
    ls_emp.rn = 1
AND ls_mgr.rn = 1
AND ls_emp.salary > ls_mgr.salary

ORDER BY
ls_emp.salary DESC;


# 16. Combine active and inactive employee lists. 

SELECT
    employee_id,
    CONCAT(first_name, ' ', last_name) AS employee_name,
    status
FROM employees
WHERE status = 'Active'

UNION

SELECT
    employee_id,
    CONCAT(first_name, ' ', last_name) AS employee_name,
    status
FROM employees
WHERE status = 'Inactive';



# 17. Find employees present in both Project A and Project B. 

SELECT
    e.employee_id,
    CONCAT(first_name, ' ', last_name) AS employee_name
FROM employees e
JOIN employee_projects ep
    ON e.employee_id = ep.employee_id
WHERE ep.project_id IN (1, 2)
GROUP BY
    e.employee_id
HAVING COUNT(DISTINCT ep.project_id) = 2;


# 18. Find employees assigned to Project A but not Project B. 

SELECT
    e.employee_id,
    CONCAT(first_name, ' ', last_name) AS employee_name
FROM employees e
JOIN employee_projects ep
    ON e.employee_id = ep.employee_id
WHERE ep.project_id = 1
AND NOT EXISTS
(
    SELECT 1
    FROM employee_projects ep2
    WHERE ep2.employee_id = e.employee_id
      AND ep2.project_id = 2
);


# 19. Display employee names in uppercase with their joining year. 

SELECT
    UPPER(CONCAT(first_name, ' ', last_name)) AS employee_name,
    YEAR(hire_date) AS joining_year
FROM employees
ORDER BY hire_date;


# 20. Calculate each employees tenure in years. 

SELECT
    CONCAT(first_name, ' ', last_name) AS employee_name,
    hire_date,
    TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS tenure_years
FROM employees
ORDER BY tenure_years DESC;


# 21. Create employee email IDs using first name and last name. 

SELECT
    first_name,
    last_name,
    LOWER(CONCAT(first_name, '.', last_name, '@company.com')) AS email_id
FROM employees;


# 22. 

SELECT
    e.employee_id,
    CONCAT(first_name, ' ', last_name) AS employee_name,
    s.salary,

    CASE
        WHEN s.salary < 30000 THEN 'Low'
        WHEN s.salary BETWEEN 30000 AND 60000 THEN 'Medium'
        ELSE 'High'
    END AS salary_category

FROM employees e
JOIN salaries s
ON e.employee_id = s.employee_id

ORDER BY s.salary DESC;


# 23. Rank employees by salary within each department.

SELECT
    CONCAT(first_name, ' ', last_name) AS employee_name,
    d.department_name,
    s.salary,
    RANK() OVER(
        PARTITION BY e.department_id
        ORDER BY s.salary DESC
    ) AS salary_rank
FROM employees e
JOIN salaries s
    ON e.employee_id = s.employee_id
JOIN departments d
    ON e.department_id = d.department_id;
    
    
    
# 24. Find the second highest salary in every department using a Window Function.

WITH salary_rank AS
(
    SELECT
        e.employee_id,
        CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
        d.department_name,
        s.salary,

        DENSE_RANK() OVER
        (
            PARTITION BY e.department_id
            ORDER BY s.salary DESC
        ) AS salary_rank

    FROM employees e

    JOIN salaries s
        ON e.employee_id = s.employee_id

    JOIN departments d
        ON e.department_id = d.department_id
)

SELECT
    employee_id,
    employee_name,
    department_name,
    salary
FROM salary_rank
WHERE salary_rank = 2
ORDER BY department_name;


# 25. Generate a Department Analytics Report. ( Department Expense Running Total , Salary Quartile using NTILE(4) X )


WITH employee_salary_rank AS
(
    SELECT
        e.employee_id,
        e.department_id,
        CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
        s.salary,

        RANK() OVER
        (
            PARTITION BY e.department_id
            ORDER BY s.salary DESC
        ) AS salary_rank,

        NTILE(4) OVER
        (
            PARTITION BY e.department_id
            ORDER BY s.salary
        ) AS salary_quartile

    FROM employees e
    JOIN salaries s
        ON e.employee_id = s.employee_id
),

department_summary AS
(
    SELECT
        d.department_id,
        d.department_name,

        COUNT(DISTINCT e.employee_id) AS total_employees,

        ROUND(AVG(s.salary),2) AS average_salary,

        MAX(s.salary) AS highest_salary,

        MIN(s.salary) AS lowest_salary,

        COUNT(DISTINCT p.project_id) AS number_of_projects,

        COUNT(DISTINCT
            CASE
                WHEN ep.employee_id IS NULL
                THEN e.employee_id
            END
        ) AS employees_without_projects

    FROM departments d

    LEFT JOIN employees e
        ON d.department_id = e.department_id

    LEFT JOIN salaries s
        ON e.employee_id = s.employee_id

    LEFT JOIN employee_projects ep
        ON e.employee_id = ep.employee_id

    LEFT JOIN projects p
        ON ep.project_id = p.project_id

    GROUP BY
        d.department_id,
        d.department_name
)

SELECT

    ds.department_name,

    ds.total_employees,

    ds.average_salary,

    ds.highest_salary,

    ds.lowest_salary,

    ds.number_of_projects,

    ds.employees_without_projects,

    esr.employee_name AS highest_paid_employee,

    esr.salary_rank,

    esr.salary_quartile

FROM department_summary ds

JOIN employee_salary_rank esr
    ON ds.department_id = esr.department_id

WHERE esr.salary_rank = 1

ORDER BY ds.department_name;



# 1. Employees who worked on every project in their department.

SELECT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    d.department_name
FROM employees e

JOIN departments d
    ON e.department_id = d.department_id

JOIN employee_projects ep
    ON e.employee_id = ep.employee_id

JOIN projects p
    ON ep.project_id = p.project_id

WHERE p.department_id = e.department_id

GROUP BY
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name,
    e.department_id

HAVING COUNT(DISTINCT p.project_id) =
(
    SELECT COUNT(*)
    FROM projects p2
    WHERE p2.department_id = e.department_id
);


# 2. Projects with zero employees assigned.

SELECT
    p.project_id,
    p.project_name
FROM projects p

LEFT JOIN employee_projects ep
    ON p.project_id = ep.project_id

WHERE ep.employee_id IS NULL;


# 3. Employees with zero assigned projects.

SELECT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    e.employee_role,
    d.department_name
FROM employees e

LEFT JOIN employee_projects ep
    ON e.employee_id = ep.employee_id

LEFT JOIN departments d
    ON e.department_id = d.department_id

WHERE ep.employee_id IS NULL;


# 4. Find salary decreases using LAG().

SELECT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    s.effective_date,
    s.salary,
    LAG(s.salary) OVER (
        PARTITION BY s.employee_id
        ORDER BY s.effective_date
    ) AS previous_salary
FROM salaries s
JOIN employees e
    ON s.employee_id = e.employee_id;
    
    

# 5. Running monthly department expense using SUM() OVER(). (need payroll_month DATE ) 

WITH monthly_expense AS
(
    SELECT
        d.department_name,
        DATE_FORMAT(p.payroll_month, '%Y-%m') AS payroll_month,
        SUM(p.salary) AS monthly_expense

    FROM payroll p

    JOIN employees e
        ON p.employee_id = e.employee_id

    JOIN departments d
        ON e.department_id = d.department_id

    GROUP BY
        d.department_name,
        DATE_FORMAT(p.payroll_month, '%Y-%m')
)

SELECT
    department_name,
    payroll_month,
    monthly_expense,

    SUM(monthly_expense)
    OVER
    (
        PARTITION BY department_name
        ORDER BY payroll_month
    ) AS running_total

FROM monthly_expense

ORDER BY
department_name,
payroll_month;


# 6. Find consecutive salary increase streaks (Gaps & Islands).

WITH salary_history AS
(
    SELECT
        employee_id,
        effective_date,
        salary,

        LAG(salary) OVER
        (
            PARTITION BY employee_id
            ORDER BY effective_date
        ) AS previous_salary

    FROM salaries
),

salary_groups AS
(
    SELECT
        *,
        SUM(
            CASE
                WHEN previous_salary IS NULL
                     OR salary <= previous_salary
                THEN 1
                ELSE 0
            END
        ) OVER
        (
            PARTITION BY employee_id
            ORDER BY effective_date
        ) AS streak_group

    FROM salary_history
)

SELECT
    employee_id,
    MIN(effective_date) AS streak_start,
    MAX(effective_date) AS streak_end,
    COUNT(*) AS records_in_streak
FROM salary_groups
GROUP BY
    employee_id,
    streak_group
HAVING COUNT(*) > 1;



# 7. Divide employees into salary quartiles using NTILE(4).

SELECT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    d.department_name,
    s.salary,

    NTILE(4) OVER (
        ORDER BY s.salary
    ) AS salary_quartile

FROM employees e

JOIN salaries s
    ON e.employee_id = s.employee_id

JOIN departments d
    ON e.department_id = d.department_id

ORDER BY s.salary;


# 8. Compare JOIN vs EXISTS Performance. ( Find employees who are assigned to at least one project. )

SELECT DISTINCT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name
FROM employees e
JOIN employee_projects ep
    ON e.employee_id = ep.employee_id;
    
    
SELECT
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name
FROM employees e
WHERE EXISTS
(
    SELECT 1
    FROM employee_projects ep
    WHERE ep.employee_id = e.employee_id
);



# 9. Rewrite five subqueries using joins.

# 1. Employees earning more than the average salary

SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    s.salary
FROM employees e
JOIN salaries s
    ON e.employee_id = s.employee_id
JOIN
(
    SELECT AVG(salary) AS avg_salary
    FROM salaries
) avg_table
ON s.salary > avg_table.avg_salary;


# 2. Departments whose average salary is greater than the company average.alter

SELECT
    d.department_name,
    AVG(s.salary) AS average_salary
FROM departments d
JOIN employees e
    ON d.department_id = e.department_id
JOIN salaries s
    ON e.employee_id = s.employee_id
GROUP BY d.department_id, d.department_name
HAVING AVG(s.salary) >
(
    SELECT AVG(salary)
    FROM salaries
);


# 3. Employees assigned to at least one project

SELECT DISTINCT
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name
FROM employees e
JOIN employee_projects ep
    ON e.employee_id = ep.employee_id;
    
    
# 4. Employees not assigned to any project

SELECT
    CONCAT(first_name, ' ', last_name) AS employee_name
FROM employees e
WHERE NOT EXISTS
(
    SELECT 1
    FROM employee_projects ep
    WHERE ep.employee_id = e.employee_id
);


# 5. Highest-paid employee in each department.

SELECT
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    d.department_name,
    s.salary
FROM employees e
JOIN salaries s
    ON e.employee_id = s.employee_id
JOIN departments d
    ON e.department_id = d.department_id
JOIN
(
    SELECT
        e.department_id,
        MAX(s.salary) AS max_salary
    FROM employees e
    JOIN salaries s
        ON e.employee_id = s.employee_id
    GROUP BY e.department_id
) max_salary_table
ON e.department_id = max_salary_table.department_id
AND s.salary = max_salary_table.max_salary;


# 10. Build a complete Department Dashboard using a single SQL query.

WITH ranked_employees AS
(
    SELECT
        e.employee_id,
        e.department_id,
        CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
        s.salary,

        RANK() OVER
        (
            PARTITION BY e.department_id
            ORDER BY s.salary DESC
        ) AS salary_rank

    FROM employees e

    JOIN salaries s
        ON e.employee_id = s.employee_id
)

SELECT

    d.department_name,

    COUNT(DISTINCT e.employee_id) AS total_employees,

    ROUND(AVG(s.salary),2) AS average_salary,

    MAX(s.salary) AS highest_salary,

    MIN(s.salary) AS lowest_salary,

    SUM(s.salary) AS total_payroll,

    COUNT(DISTINCT p.project_id) AS number_of_projects,

    COUNT(DISTINCT CASE
            WHEN ep.employee_id IS NULL
            THEN e.employee_id
        END) AS employees_without_projects,

    (
        SELECT re.employee_name
        FROM ranked_employees re
        WHERE re.department_id = d.department_id
          AND re.salary_rank = 1
        LIMIT 1
    ) AS highest_paid_employee,

    (
        SELECT re.salary_rank
        FROM ranked_employees re
        WHERE re.department_id = d.department_id
          AND re.salary_rank = 1
        LIMIT 1
    ) AS salary_rank

FROM departments d

LEFT JOIN employees e
    ON d.department_id = e.department_id

LEFT JOIN salaries s
    ON e.employee_id = s.employee_id

LEFT JOIN employee_projects ep
    ON e.employee_id = ep.employee_id

LEFT JOIN projects p
    ON ep.project_id = p.project_id

GROUP BY
    d.department_id,
    d.department_name

ORDER BY
    d.department_name;
    
    

    
    

