SELECT
    e.employee_id,
    e.employee_name,
    d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;


SELECT
    e.employee_id,
    e.employee_name
FROM employees e
LEFT JOIN employee_projects ep ON e.employee_id = ep.employee_id
WHERE ep.project_id IS NULL;


SELECT
    d.department_id,
    d.department_name,
    e.employee_name
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id;


SELECT
    e.employee_id,
    e.employee_name,
    p.project_name
FROM employees e
INNER JOIN employee_projects ep ON e.employee_id = ep.employee_id
INNER JOIN projects p ON ep.project_id = p.project_id;


SELECT
    e.employee_id,
    e.employee_name,
    s.salary
FROM employees e
INNER JOIN salaries s
    ON e.employee_id = s.employee_id
WHERE s.salary >
(
    SELECT AVG(salary)
    FROM salaries
);


SELECT
    d.department_name,
    COUNT(e.employee_id) AS total_employees
FROM departments d
INNER JOIN employees e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) > 5;


SELECT
    p.project_name,
    COUNT(ep.employee_id) AS total_employees
FROM projects p
LEFT JOIN employee_projects ep
    ON p.project_id = ep.project_id
GROUP BY p.project_id, p.project_name;




SELECT
    e.employee_name AS employee,
    e.hire_date AS empl_join_date,
    m.employee_name AS manager,
    m.hire_date AS manager_join_date
FROM employees e
INNER JOIN employees m
    ON e.manager_id = m.employee_id
WHERE e.hire_date > m.hire_date;



SELECT
    e.employee_name,
    p.project_name
FROM employees e
CROSS JOIN projects p;



SELECT
    d.department_name,
    e.employee_name,
    s.salary
FROM employees e
JOIN salaries s
    ON e.employee_id = s.employee_id
JOIN departments d
    ON e.department_id = d.department_id
WHERE (e.department_id, s.salary) IN
(
    SELECT
        e.department_id,
        MAX(s.salary)
    FROM employees e
    JOIN salaries s
        ON e.employee_id = s.employee_id
    GROUP BY e.department_id
);


SELECT
    d.department_name,
    AVG(s.salary) AS dept_avg_salary
FROM departments d
JOIN employees e
    ON d.department_id = e.department_id
JOIN salaries s
    ON e.employee_id = s.employee_id
GROUP BY
    d.department_id,
    d.department_name
HAVING AVG(s.salary) >
(
    SELECT AVG(salary)
    FROM salaries
);


SELECT
    e.employee_name AS employee,
    es.salary AS employee_salary,
    m.employee_name AS manager,
    ms.salary AS manager_salary
FROM employees e
INNER JOIN employees m
    ON e.manager_id = m.employee_id
INNER JOIN salaries es
    ON e.employee_id = es.employee_id
INNER JOIN salaries ms
    ON m.employee_id = ms.employee_id
WHERE es.salary > ms.salary;




SELECT
    employee_id,
    employee_name,
    status
FROM employees
WHERE status = 'Active'

UNION

SELECT
    employee_id,
    employee_name,
    status
FROM employees
WHERE status = 'Inactive';




SELECT
    e.employee_id,
    e.employee_name
FROM employees e
JOIN employee_projects ep
    ON e.employee_id = ep.employee_id
JOIN projects p
    ON ep.project_id = p.project_id
WHERE p.project_name IN 
(
    'Employee Management System',
    'Inventory Management'
)
GROUP BY
    e.employee_id,
    e.employee_name
HAVING COUNT(DISTINCT p.project_name)=2;



SELECT
    e.employee_id,
    e.employee_name
FROM employees e
JOIN employee_projects ep
    ON e.employee_id = ep.employee_id
JOIN projects p
    ON ep.project_id = p.project_id
WHERE p.project_name = 'Employee Management System'
AND NOT EXISTS
(
    SELECT 1
    FROM employee_projects ep2
    JOIN projects p2
        ON ep2.project_id = p2.project_id
    WHERE ep2.employee_id = e.employee_id
    AND p2.project_name = 'Inventory Management'
);


SELECT
    UPPER(employee_name) AS employee_name,
    YEAR(hire_date) AS joining_year
FROM employees;


SELECT
    employee_name,
    hire_date,
    FLOOR(DATEDIFF(CURDATE(), hire_date) / 365) AS tenure_years
FROM employees;



SELECT
    employee_name,
    CONCAT(
        LOWER(SUBSTRING_INDEX(employee_name,' ',1)),
        '.',
        LOWER(SUBSTRING_INDEX(employee_name,' ',-1)),
        '@company.com'
    ) AS generated_email
FROM employees;




SELECT
    e.employee_name,
    s.salary,
    CASE
        WHEN s.salary < 30000 THEN 'Low'
        WHEN s.salary BETWEEN 30000 AND 60000 THEN 'Medium'
        WHEN s.salary > 60000 THEN 'High'
    END AS salary_category
FROM employees e
JOIN salaries s
    ON e.employee_id = s.employee_id;



