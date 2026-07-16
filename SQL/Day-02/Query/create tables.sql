CREATE DATABASE company;

USE company;

CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    department_code VARCHAR(10) NOT NULL UNIQUE,
    location VARCHAR(100),

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL DEFAULT NULL
);

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    gender ENUM('Male', 'Female', 'Other'),
    date_of_birth DATE,
    hire_date DATE NOT NULL,
    employee_role VARCHAR(100) NOT NULL,
    status ENUM('Active', 'Inactive') DEFAULT 'Active',
    department_id INT NOT NULL,
    manager_id INT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL DEFAULT NULL,

    CONSTRAINT fk_employee_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_employee_manager
        FOREIGN KEY (manager_id)
        REFERENCES employees(employee_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);


CREATE TABLE salaries (
    salary_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    effective_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT fk_salary_employee
        FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);



CREATE TABLE projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    department_id INT NOT NULL,
    status ENUM('Planned', 'Active', 'Completed') DEFAULT 'Active',
    start_date DATE,
    end_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_project_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);



CREATE TABLE employee_projects (
    employee_project_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL,
    project_id INT NOT NULL,
    assigned_date DATE,
    removed_date DATE,

    CONSTRAINT fk_ep_employee
        FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_ep_project
        FOREIGN KEY (project_id)
        REFERENCES projects(project_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    UNIQUE (employee_id, project_id)	
);


select * from departments;
select * from employee_projects;
select * from projects;
select * from salaries;
select * from employees;



