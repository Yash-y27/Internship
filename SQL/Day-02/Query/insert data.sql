INSERT INTO departments
(department_name, department_code, location)
VALUES
('Human Resources', 'HR', 'Ahmedabad'),
('Information Technology', 'IT', 'Ahmedabad'),
('Finance', 'FIN', 'Vadodara'),
('Sales', 'SAL', 'Surat'),
('Marketing', 'MKT', 'Rajkot');


INSERT INTO employees
(first_name, last_name, email, phone, gender, date_of_birth, hire_date, employee_role, status, department_id, manager_id)
VALUES
('Aarav','Sharma','aarav.sharma@company.com','9000000001','Male','1985-03-15','2012-06-15','HR Manager','Active',1,NULL),
('Vivaan','Patel','vivaan.patel@company.com','9000000002','Male','1990-07-12','2016-04-10','HR Executive','Active',1,NULL),
('Diya','Shah','diya.shah@company.com','9000000003','Female','1994-01-20','2019-09-05','HR Executive','Active',1,NULL),
('Riya','Mehta','riya.mehta@company.com','9000000004','Female','1996-08-18','2021-01-12','Recruiter','Active',1,NULL),
('Karan','Joshi','karan.joshi@company.com','9000000005','Male','1995-04-11','2020-11-02','Recruiter','Inactive',1,NULL),

('Raj','Patel','raj.patel@company.com','9000000006','Male','1984-05-10','2010-02-18','IT Manager','Active',2,NULL),
('Neha','Patel','neha.patel@company.com','9000000007','Female','1991-09-21','2017-08-14','Senior Developer','Active',2,NULL),
('Yash','Patel','yash.patel@company.com','9000000008','Male','1998-05-01','2024-07-01','Software Developer','Active',2,NULL),
('Priya','Desai','priya.desai@company.com','9000000009','Female','1995-12-11','2020-03-16','Software Developer','Active',2,NULL),
('Rohan','Shah','rohan.shah@company.com','9000000010','Male','1993-10-09','2018-06-20','Software Developer','Active',2,NULL),

('Sneha','Patel','sneha.patel@company.com','9000000011','Female','1996-02-15','2021-05-05','QA Engineer','Active',2,NULL),
('Harsh','Trivedi','harsh.trivedi@company.com','9000000012','Male','1994-04-28','2019-02-01','QA Engineer','Active',2,NULL),
('Anjali','Joshi','anjali.joshi@company.com','9000000013','Female','1997-06-14','2022-01-10','UI Developer','Active',2,NULL),
('Mihir','Dave','mihir.dave@company.com','9000000014','Male','1992-01-01','2018-09-17','Backend Developer','Active',2,NULL),
('Krishna','Patel','krishna.patel@company.com','9000000015','Male','1999-11-05','2023-08-21','Intern','Active',2,NULL),

('Amit','Shah','amit.shah@company.com','9000000016','Male','1986-08-30','2011-04-04','Finance Manager','Active',3,NULL),
('Nidhi','Patel','nidhi.patel@company.com','9000000017','Female','1992-02-17','2018-12-01','Accountant','Active',3,NULL),
('Parth','Mehta','parth.mehta@company.com','9000000018','Male','1993-03-09','2019-10-15','Accountant','Active',3,NULL),
('Komal','Shah','komal.shah@company.com','9000000019','Female','1997-07-22','2022-04-11','Finance Executive','Active',3,NULL),
('Jay','Patel','jay.patel@company.com','9000000020','Male','1995-05-30','2020-06-18','Finance Executive','Inactive',3,NULL),

('Sanjay','Patel','sanjay.patel@company.com','9000000021','Male','1983-09-12','2009-01-14','Sales Manager','Active',4,NULL),
('Pooja','Sharma','pooja.sharma@company.com','9000000022','Female','1993-11-25','2019-07-01','Sales Executive','Active',4,NULL),
('Rahul','Joshi','rahul.joshi@company.com','9000000023','Male','1992-12-08','2018-08-08','Sales Executive','Active',4,NULL),
('Isha','Patel','isha.patel@company.com','9000000024','Female','1996-10-20','2021-09-15','Sales Executive','Active',4,NULL),
('Dev','Shah','dev.shah@company.com','9000000025','Male','1998-06-05','2023-02-10','Sales Associate','Active',4,NULL),

('Rakesh','Mehta','rakesh.mehta@company.com','9000000026','Male','1982-07-18','2008-05-20','Marketing Manager','Active',5,NULL),
('Heena','Patel','heena.patel@company.com','9000000027','Female','1991-09-09','2017-04-25','Marketing Executive','Active',5,NULL),
('Viral','Shah','viral.shah@company.com','9000000028','Male','1994-05-16','2020-02-12','Marketing Executive','Active',5,NULL),
('Mansi','Joshi','mansi.joshi@company.com','9000000029','Female','1996-03-11','2021-06-30','SEO Specialist','Active',5,NULL),
('Nirav','Patel','nirav.patel@company.com','9000000030','Male','1997-01-23','2022-10-18','Content Writer','Active',5,NULL),

('Akash','Patel','akash.patel@company.com','9000000031','Male','1994-04-10','2020-01-20','Developer','Active',2,NULL),
('Bhavin','Shah','bhavin.shah@company.com','9000000032','Male','1995-05-15','2020-08-01','Developer','Active',2,NULL),
('Chirag','Patel','chirag.patel@company.com','9000000033','Male','1996-06-11','2021-02-12','Developer','Active',2,NULL),
('Deep','Joshi','deep.joshi@company.com','9000000034','Male','1997-07-21','2022-04-05','Developer','Active',2,NULL),
('Ekta','Patel','ekta.patel@company.com','9000000035','Female','1998-08-19','2023-03-10','QA Engineer','Active',2,NULL),

('Falguni','Shah','falguni.shah@company.com','9000000036','Female','1993-09-09','2019-11-01','HR Executive','Active',1,NULL),
('Gaurav','Patel','gaurav.patel@company.com','9000000037','Male','1992-10-10','2018-05-14','Recruiter','Active',1,NULL),
('Hiral','Mehta','hiral.mehta@company.com','9000000038','Female','1995-11-11','2020-09-09','Recruiter','Active',1,NULL),
('Jignesh','Patel','jignesh.patel@company.com','9000000039','Male','1994-12-12','2019-01-07','HR Executive','Active',1,NULL),
('Khushi','Shah','khushi.shah@company.com','9000000040','Female','1999-01-13','2024-01-08','Intern','Active',1,NULL),

('Lalit','Patel','lalit.patel@company.com','9000000041','Male','1993-02-02','2019-06-11','Accountant','Active',3,NULL),
('Monika','Joshi','monika.joshi@company.com','9000000042','Female','1994-03-03','2020-02-18','Finance Executive','Active',3,NULL),
('Nilesh','Shah','nilesh.shah@company.com','9000000043','Male','1995-04-04','2021-04-20','Accountant','Active',3,NULL),
('Ojas','Patel','ojas.patel@company.com','9000000044','Male','1996-05-05','2022-07-15','Finance Executive','Active',3,NULL),
('Pallavi','Mehta','pallavi.mehta@company.com','9000000045','Female','1997-06-06','2023-01-12','Intern','Active',3,NULL),

('Qadir','Shaikh','qadir.shaikh@company.com','9000000046','Male','1992-07-07','2018-03-05','Sales Executive','Active',4,NULL),
('Rutu','Patel','rutu.patel@company.com','9000000047','Female','1995-08-08','2020-05-19','Sales Associate','Active',4,NULL),
('Smit','Shah','smit.shah@company.com','9000000048','Male','1996-09-09','2021-08-08','Sales Associate','Active',4,NULL),
('Tanvi','Joshi','tanvi.joshi@company.com','9000000049','Female','1998-10-10','2023-02-14','Sales Executive','Active',4,NULL),
('Uday','Patel','uday.patel@company.com','9000000050','Male','1999-11-11','2024-04-01','Intern','Active',4,NULL);


SET SQL_SAFE_UPDATES = 0;


UPDATE employees
SET manager_id =
CASE
    -- HR
    WHEN employee_id IN (2,3,4,5,36,37,38,39,40) THEN 1

    -- IT
    WHEN employee_id IN (7,8,9,10,11,12,13,14,15,31,32,33,34,35) THEN 6

    -- Finance
    WHEN employee_id IN (17,18,19,20,41,42,43,44,45) THEN 16

    -- Sales
    WHEN employee_id IN (22,23,24,25,46,47,48,49,50) THEN 21

    -- Marketing
    WHEN employee_id IN (27,28,29,30) THEN 26

    ELSE NULL
END;

SET SQL_SAFE_UPDATES = 1;


INSERT INTO salaries (employee_id, salary, effective_date) VALUES
(1,70000,'2024-01-01'),
(1,75000,'2025-01-01'),
(2,45000,'2024-01-01'),
(2,48000,'2025-01-01'),
(3,43000,'2024-01-01'),
(3,46000,'2025-01-01'),
(4,35000,'2024-01-01'),
(4,38000,'2025-01-01'),
(5,32000,'2024-01-01'),
(5,34000,'2025-01-01'),

(6,90000,'2024-01-01'),
(6,95000,'2025-01-01'),
(7,75000,'2024-01-01'),
(7,80000,'2025-01-01'),
(8,50000,'2024-01-01'),
(8,55000,'2025-01-01'),
(9,48000,'2024-01-01'),
(9,52000,'2025-01-01'),
(10,47000,'2024-01-01'),
(10,50000,'2025-01-01'),

(11,42000,'2024-01-01'),
(11,45000,'2025-01-01'),
(12,41000,'2024-01-01'),
(12,44000,'2025-01-01'),
(13,46000,'2024-01-01'),
(13,49000,'2025-01-01'),
(14,65000,'2024-01-01'),
(14,70000,'2025-01-01'),
(15,25000,'2024-01-01'),
(15,28000,'2025-01-01'),

(16,85000,'2024-01-01'),
(16,90000,'2025-01-01'),
(17,50000,'2024-01-01'),
(17,54000,'2025-01-01'),
(18,48000,'2024-01-01'),
(18,51000,'2025-01-01'),
(19,38000,'2024-01-01'),
(19,41000,'2025-01-01'),
(20,36000,'2024-01-01'),
(20,39000,'2025-01-01'),

(21,80000,'2024-01-01'),
(21,85000,'2025-01-01'),
(22,45000,'2024-01-01'),
(22,48000,'2025-01-01'),
(23,43000,'2024-01-01'),
(23,47000,'2025-01-01'),
(24,42000,'2024-01-01'),
(24,45000,'2025-01-01'),
(25,30000,'2024-01-01'),
(25,33000,'2025-01-01');



INSERT INTO salaries (employee_id, salary, effective_date) VALUES
(26,78000,'2024-01-01'),
(26,83000,'2025-01-01'),
(27,46000,'2024-01-01'),
(27,49000,'2025-01-01'),
(28,44000,'2024-01-01'),
(28,47000,'2025-01-01'),
(29,40000,'2024-01-01'),
(29,43000,'2025-01-01'),
(30,35000,'2024-01-01'),
(30,38000,'2025-01-01'),

(31,52000,'2024-01-01'),
(31,56000,'2025-01-01'),
(32,51000,'2024-01-01'),
(32,55000,'2025-01-01'),
(33,49000,'2024-01-01'),
(33,53000,'2025-01-01'),
(34,47000,'2024-01-01'),
(34,51000,'2025-01-01'),
(35,39000,'2024-01-01'),
(35,42000,'2025-01-01'),

(36,44000,'2024-01-01'),
(36,47000,'2025-01-01'),
(37,41000,'2024-01-01'),
(37,44000,'2025-01-01'),
(38,39000,'2024-01-01'),
(38,42000,'2025-01-01'),
(39,43000,'2024-01-01'),
(39,46000,'2025-01-01'),
(40,25000,'2024-01-01'),
(40,28000,'2025-01-01'),

(41,50000,'2024-01-01'),
(41,54000,'2025-01-01'),
(42,42000,'2024-01-01'),
(42,45000,'2025-01-01'),
(43,46000,'2024-01-01'),
(43,49000,'2025-01-01'),
(44,40000,'2024-01-01'),
(44,43000,'2025-01-01'),
(45,26000,'2024-01-01'),
(45,29000,'2025-01-01'),

(46,44000,'2024-01-01'),
(46,47000,'2025-01-01'),
(47,32000,'2024-01-01'),
(47,35000,'2025-01-01'),
(48,34000,'2024-01-01'),
(48,37000,'2025-01-01'),
(49,43000,'2024-01-01'),
(49,46000,'2025-01-01'),
(50,24000,'2024-01-01'),
(50,27000,'2025-01-01');


INSERT INTO projects
(project_name, department_id, status, start_date, end_date)
VALUES
-- Human Resources
('Employee Recruitment System', 1, 'Active', '2024-01-10', '2024-12-31'),
('Employee Training Portal', 1, 'Completed', '2023-02-01', '2023-11-30'),

-- Information Technology
('Inventory Management System', 2, 'Active', '2024-03-01', '2025-06-30'),
('Customer Relationship Management', 2, 'Active', '2024-05-15', '2025-12-31'),

-- Finance
('Payroll Automation', 3, 'Completed', '2023-01-15', '2023-10-31'),
('Budget Planning System', 3, 'Planned', '2025-01-01', '2025-12-31'),

-- Sales
('Sales Dashboard', 4, 'Active', '2024-04-01', '2025-03-31'),
('Customer Lead Tracker', 4, 'Completed', '2023-06-01', '2024-01-31'),

-- Marketing
('Digital Marketing Campaign', 5, 'Active', '2024-02-15', '2025-02-28'),
('Social Media Analytics', 5, 'Planned', '2025-04-01', '2025-12-31');




INSERT INTO employee_projects
(employee_id, project_id, assigned_date)
VALUES
(1,1,'2024-01-15'),
(1,2,'2024-02-01'),
(2,1,'2024-01-20'),
(3,1,'2024-01-22'),
(3,2,'2024-02-10'),
(4,2,'2024-02-15'),
(5,1,'2024-03-01'),

(36,1,'2024-03-05'),
(36,2,'2024-03-15'),
(37,2,'2024-04-01'),
(38,1,'2024-04-10'),
(39,1,'2024-04-20'),
(39,2,'2024-05-01'),

(6,3,'2024-03-01'),
(6,4,'2024-03-10'),
(7,3,'2024-03-05'),
(7,4,'2024-03-15'),
(8,3,'2024-03-12'),
(9,4,'2024-03-20'),
(10,3,'2024-03-25'),


(11,3,'2024-04-01'),
(12,4,'2024-04-05'),
(13,3,'2024-04-10'),
(13,4,'2024-04-15'),
(14,3,'2024-04-20'),
(14,4,'2024-04-25'),
(15,3,'2024-05-01'),

(31,3,'2024-05-10'),
(32,4,'2024-05-15'),
(33,3,'2024-05-20'),
(33,4,'2024-05-25'),
(34,3,'2024-06-01'),

(16,5,'2024-01-15'),
(16,6,'2024-02-01'),
(17,5,'2024-01-20'),
(18,5,'2024-02-05'),
(18,6,'2024-02-15'),
(19,6,'2024-03-01'),
(20,5,'2024-03-10'),

(41,5,'2024-03-15'),
(41,6,'2024-03-20'),
(42,6,'2024-04-01'),
(43,5,'2024-04-10'),
(44,5,'2024-04-20'),
(44,6,'2024-05-01'),

(21,7,'2024-04-01'),
(21,8,'2024-04-10'),
(22,7,'2024-04-05'),
(23,7,'2024-04-12'),
(23,8,'2024-04-18'),
(24,8,'2024-04-25'),
(25,7,'2024-05-01'),


(46,7,'2024-05-10'),
(46,8,'2024-05-15'),
(47,8,'2024-05-20'),
(48,7,'2024-05-25'),
(49,7,'2024-06-01'),
(49,8,'2024-06-10');



INSERT INTO employee_projects
(employee_id, project_id, assigned_date)
VALUES
(26,9,'2024-02-15'),
(27,9,'2024-02-20'),
(28,9,'2024-03-01'),
(29,9,'2024-03-10');



select * from departments;

select * from employee_projects;

select * from employees;

select * from salaries;

select * from projects;







