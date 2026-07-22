// insert data

INSERT INTO roles
(
role_name,
description
)
VALUES
('ADMIN','System Administrator'),
('DOCTOR','Medical Doctor'),
('RECEPTIONIST','Hospital Receptionist'),
('PATIENT','Patient Role');

INSERT INTO roles
(
role_name,
description
)
VALUES
('CASHIER','Cashier');

select * from roles;


INSERT INTO users
(
    role_id,
    first_name,
    last_name,
    email,
    phone,
    password_hash
)
VALUES
('f8ab0531-85e3-11f1-beb2-489ebde94b09', 'Amit',   'Patel',    'amit.admin@hospital.com',    '9000000001', 'Admin@123'),
('f8ab0531-85e3-11f1-beb2-489ebde94b09', 'Neha',   'Shah',     'neha.admin@hospital.com',    '9000000002', 'Admin@123'),
('f8ab0531-85e3-11f1-beb2-489ebde94b09', 'Raj',    'Mehta',    'raj.admin@hospital.com',     '9000000003', 'Admin@123'),
('f8ab0531-85e3-11f1-beb2-489ebde94b09', 'Priya',  'Joshi',    'priya.admin@hospital.com',   '9000000004', 'Admin@123'),
('f8ab0531-85e3-11f1-beb2-489ebde94b09', 'Karan',  'Desai',    'karan.admin@hospital.com',   '9000000005', 'Admin@123');

INSERT INTO users
(
    role_id,
    first_name,
    last_name,
    email,
    phone,
    password_hash
)
VALUES
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Amit','Shah','amit.shah@hospital.com','9000001001','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Meera','Patel','meera.patel@hospital.com','9000001002','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Rajesh','Kumar','rajesh.kumar@hospital.com','9000001003','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Neha','Joshi','neha.joshi@hospital.com','9000001004','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Kunal','Desai','kunal.desai@hospital.com','9000001005','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Rakesh','Patel','rakesh.patel@hospital.com','9000001006','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Priyanka','Shah','priyanka.shah@hospital.com','9000001007','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Sanjay','Mehta','sanjay.mehta@hospital.com','9000001008','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Nikita','Trivedi','nikita.trivedi@hospital.com','9000001009','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Hardik','Bhatt','hardik.bhatt@hospital.com','9000001010','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Bhavesh','Modi','bhavesh.modi@hospital.com','9000001011','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Sneha','Pandya','sneha.pandya@hospital.com','9000001012','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Vivek','Raval','vivek.raval@hospital.com','9000001013','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Anjali','Parmar','anjali.parmar@hospital.com','9000001014','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Nirav','Dave','nirav.dave@hospital.com','9000001015','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Komal','Soni','komal.soni@hospital.com','9000001016','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Jignesh','Panchal','jignesh.panchal@hospital.com','9000001017','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Pooja','Chauhan','pooja.chauhan@hospital.com','9000001018','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Manish','Solanki','manish.solanki@hospital.com','9000001019','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Ritu','Kapoor','ritu.kapoor@hospital.com','9000001020','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Harsh','Patel','harsh.patel@hospital.com','9000001021','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Divya','Mistry','divya.mistry@hospital.com','9000001022','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Yash','Vyas','yash.vyas@hospital.com','9000001023','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Krunal','Thakkar','krunal.thakkar@hospital.com','9000001024','Doctor@123'),
('f8ac32aa-85e3-11f1-beb2-489ebde94b09','Mitali','Bhatt','mitali.bhatt@hospital.com','9000001025','Doctor@123');



INSERT INTO users
(role_id, first_name, last_name, email, phone, password_hash)
VALUES
('f8ac3861-85e3-11f1-beb2-489ebde94b09','Riya','Patel','riya.patel@hospital.com','9100001001','Reception@123'),
('f8ac3861-85e3-11f1-beb2-489ebde94b09','Kajal','Shah','kajal.shah@hospital.com','9100001002','Reception@123'),
('f8ac3861-85e3-11f1-beb2-489ebde94b09','Pooja','Joshi','pooja.joshi@hospital.com','9100001003','Reception@123'),
('f8ac3861-85e3-11f1-beb2-489ebde94b09','Anjali','Mehta','anjali.mehta@hospital.com','9100001004','Reception@123'),
('f8ac3861-85e3-11f1-beb2-489ebde94b09','Sneha','Desai','sneha.desai@hospital.com','9100001005','Reception@123'),
('f8ac3861-85e3-11f1-beb2-489ebde94b09','Komal','Patel','komal.patel@hospital.com','9100001006','Reception@123'),
('f8ac3861-85e3-11f1-beb2-489ebde94b09','Nisha','Trivedi','nisha.trivedi@hospital.com','9100001007','Reception@123'),
('f8ac3861-85e3-11f1-beb2-489ebde94b09','Bhavna','Sharma','bhavna.sharma@hospital.com','9100001008','Reception@123'),
('f8ac3861-85e3-11f1-beb2-489ebde94b09','Divya','Pandya','divya.pandya@hospital.com','9100001009','Reception@123'),
('f8ac3861-85e3-11f1-beb2-489ebde94b09','Mitali','Soni','mitali.soni@hospital.com','9100001010','Reception@123'),
('f8ac3861-85e3-11f1-beb2-489ebde94b09','Nehal','Raval','nehal.raval@hospital.com','9100001011','Reception@123'),
('f8ac3861-85e3-11f1-beb2-489ebde94b09','Krupa','Modi','krupa.modi@hospital.com','9100001012','Reception@123'),
('f8ac3861-85e3-11f1-beb2-489ebde94b09','Isha','Chauhan','isha.chauhan@hospital.com','9100001013','Reception@123'),
('f8ac3861-85e3-11f1-beb2-489ebde94b09','Priya','Bhatt','priya.bhatt@hospital.com','9100001014','Reception@123'),
('f8ac3861-85e3-11f1-beb2-489ebde94b09','Vaishali','Dave','vaishali.dave@hospital.com','9100001015','Reception@123'),
('f8ac3861-85e3-11f1-beb2-489ebde94b09','Nirali','Panchal','nirali.panchal@hospital.com','9100001016','Reception@123'),
('f8ac3861-85e3-11f1-beb2-489ebde94b09','Hetal','Parmar','hetal.parmar@hospital.com','9100001017','Reception@123'),
('f8ac3861-85e3-11f1-beb2-489ebde94b09','Rupal','Kapoor','rupal.kapoor@hospital.com','9100001018','Reception@123'),
('f8ac3861-85e3-11f1-beb2-489ebde94b09','Nidhi','Vyas','nidhi.vyas@hospital.com','9100001019','Reception@123'),
('f8ac3861-85e3-11f1-beb2-489ebde94b09','Aarti','Thakkar','aarti.thakkar@hospital.com','9100001020','Reception@123');


INSERT INTO users
(role_id, first_name, last_name, email, phone, password_hash)
VALUES
('93b93cb9-85e4-11f1-beb2-489ebde94b09','Rahul','Patel','rahul.cashier@hospital.com','9200001001','Cashier@123'),
('93b93cb9-85e4-11f1-beb2-489ebde94b09','Nikhil','Shah','nikhil.cashier@hospital.com','9200001002','Cashier@123'),
('93b93cb9-85e4-11f1-beb2-489ebde94b09','Karan','Joshi','karan.cashier@hospital.com','9200001003','Cashier@123'),
('93b93cb9-85e4-11f1-beb2-489ebde94b09','Jay','Mehta','jay.cashier@hospital.com','9200001004','Cashier@123'),
('93b93cb9-85e4-11f1-beb2-489ebde94b09','Rohit','Desai','rohit.cashier@hospital.com','9200001005','Cashier@123'),
('93b93cb9-85e4-11f1-beb2-489ebde94b09','Vishal','Patel','vishal.cashier@hospital.com','9200001006','Cashier@123'),
('93b93cb9-85e4-11f1-beb2-489ebde94b09','Hardik','Trivedi','hardik.cashier@hospital.com','9200001007','Cashier@123'),
('93b93cb9-85e4-11f1-beb2-489ebde94b09','Yash','Sharma','yash.cashier@hospital.com','9200001008','Cashier@123'),
('93b93cb9-85e4-11f1-beb2-489ebde94b09','Jignesh','Pandya','jignesh.cashier@hospital.com','9200001009','Cashier@123'),
('93b93cb9-85e4-11f1-beb2-489ebde94b09','Manish','Soni','manish.cashier@hospital.com','9200001010','Cashier@123'),
('93b93cb9-85e4-11f1-beb2-489ebde94b09','Bhavesh','Raval','bhavesh.cashier@hospital.com','9200001011','Cashier@123'),
('93b93cb9-85e4-11f1-beb2-489ebde94b09','Sagar','Modi','sagar.cashier@hospital.com','9200001012','Cashier@123'),
('93b93cb9-85e4-11f1-beb2-489ebde94b09','Akash','Chauhan','akash.cashier@hospital.com','9200001013','Cashier@123'),
('93b93cb9-85e4-11f1-beb2-489ebde94b09','Parth','Bhatt','parth.cashier@hospital.com','9200001014','Cashier@123'),
('93b93cb9-85e4-11f1-beb2-489ebde94b09','Nirav','Dave','nirav.cashier@hospital.com','9200001015','Cashier@123'),
('93b93cb9-85e4-11f1-beb2-489ebde94b09','Meet','Panchal','meet.cashier@hospital.com','9200001016','Cashier@123'),
('93b93cb9-85e4-11f1-beb2-489ebde94b09','Harsh','Parmar','harsh.cashier@hospital.com','9200001017','Cashier@123'),
('93b93cb9-85e4-11f1-beb2-489ebde94b09','Dhruv','Kapoor','dhruv.cashier@hospital.com','9200001018','Cashier@123'),
('93b93cb9-85e4-11f1-beb2-489ebde94b09','Kishan','Vyas','kishan.cashier@hospital.com','9200001019','Cashier@123'),
('93b93cb9-85e4-11f1-beb2-489ebde94b09','Rakesh','Thakkar','rakesh.cashier@hospital.com','9200001020','Cashier@123');


INSERT INTO users
(role_id, first_name, last_name, email, phone, password_hash)
VALUES
('f8ac3af6-85e3-11f1-beb2-489ebde94b09','Rahul','Patel','rahul.patel@gmail.com','9300001001','Patient@123'),
('f8ac3af6-85e3-11f1-beb2-489ebde94b09','Priya','Sharma','priya.sharma@gmail.com','9300001002','Patient@123'),
('f8ac3af6-85e3-11f1-beb2-489ebde94b09','Amit','Joshi','amit.joshi@gmail.com','9300001003','Patient@123'),
('f8ac3af6-85e3-11f1-beb2-489ebde94b09','Sneha','Desai','sneha.desai@gmail.com','9300001004','Patient@123'),
('f8ac3af6-85e3-11f1-beb2-489ebde94b09','Karan','Mehta','karan.mehta@gmail.com','9300001005','Patient@123'),
('f8ac3af6-85e3-11f1-beb2-489ebde94b09','Nisha','Patel','nisha.patel@gmail.com','9300001006','Patient@123'),
('f8ac3af6-85e3-11f1-beb2-489ebde94b09','Vikas','Shah','vikas.shah@gmail.com','9300001007','Patient@123'),
('f8ac3af6-85e3-11f1-beb2-489ebde94b09','Ritu','Pandya','ritu.pandya@gmail.com','9300001008','Patient@123'),
('f8ac3af6-85e3-11f1-beb2-489ebde94b09','Manoj','Bhatt','manoj.bhatt@gmail.com','9300001009','Patient@123'),
('f8ac3af6-85e3-11f1-beb2-489ebde94b09','Pooja','Soni','pooja.soni@gmail.com','9300001010','Patient@123'),
('f8ac3af6-85e3-11f1-beb2-489ebde94b09','Ankit','Raval','ankit.raval@gmail.com','9300001011','Patient@123'),
('f8ac3af6-85e3-11f1-beb2-489ebde94b09','Divya','Modi','divya.modi@gmail.com','9300001012','Patient@123'),
('f8ac3af6-85e3-11f1-beb2-489ebde94b09','Jay','Parmar','jay.parmar@gmail.com','9300001013','Patient@123'),
('f8ac3af6-85e3-11f1-beb2-489ebde94b09','Mitali','Dave','mitali.dave@gmail.com','9300001014','Patient@123'),
('f8ac3af6-85e3-11f1-beb2-489ebde94b09','Harsh','Panchal','harsh.panchal@gmail.com','9300001015','Patient@123'),
('f8ac3af6-85e3-11f1-beb2-489ebde94b09','Komal','Kapoor','komal.kapoor@gmail.com','9300001016','Patient@123'),
('f8ac3af6-85e3-11f1-beb2-489ebde94b09','Nirav','Trivedi','nirav.trivedi@gmail.com','9300001017','Patient@123'),
('f8ac3af6-85e3-11f1-beb2-489ebde94b09','Bhavna','Chauhan','bhavna.chauhan@gmail.com','9300001018','Patient@123'),
('f8ac3af6-85e3-11f1-beb2-489ebde94b09','Suresh','Patel','suresh.patel@gmail.com','9300001019','Patient@123'),
('f8ac3af6-85e3-11f1-beb2-489ebde94b09','Rekha','Joshi','rekha.joshi@gmail.com','9300001020','Patient@123');


INSERT INTO departments
(
    department_name,
    description,
    is_active
)
VALUES
('Cardiology',        'Diagnosis and treatment of heart-related diseases.', TRUE),
('Neurology',         'Treatment of brain, spinal cord, and nervous system disorders.', TRUE),
('Orthopedics',       'Treatment of bones, joints, muscles, and ligaments.', TRUE),
('Pediatrics',        'Medical care for infants, children, and adolescents.', TRUE),
('Gynecology',        'Healthcare services for women and reproductive health.', TRUE),
('Dermatology',       'Diagnosis and treatment of skin, hair, and nail conditions.', TRUE),
('ENT',               'Ear, Nose, and Throat medical services.', TRUE),
('Radiology',         'Medical imaging and diagnostic radiology services.', TRUE),
('Emergency',         '24x7 emergency and trauma care services.', TRUE),
('General Medicine',  'Primary healthcare and general physician consultations.', TRUE);


INSERT INTO specializations
(
    specialization_name,
    description,
    is_active
)
VALUES
('Cardiologist', 'Specialist in heart and cardiovascular diseases.', TRUE),

('Neurologist', 'Specialist in brain, spinal cord, and nervous system disorders.', TRUE),

('Orthopedic Surgeon', 'Specialist in bone, joint, and muscle surgeries.', TRUE),

('Pediatrician', 'Specialist in child healthcare.', TRUE),

('Gynecologist', 'Specialist in women''s reproductive health.', TRUE),

('Dermatologist', 'Specialist in skin, hair, and nail diseases.', TRUE),

('ENT Specialist', 'Specialist in ear, nose, and throat disorders.', TRUE),

('Radiologist', 'Specialist in diagnostic imaging such as X-ray, CT, and MRI.', TRUE),

('Emergency Physician', 'Specialist in emergency and trauma care.', TRUE),

('General Physician', 'Primary care physician for common illnesses and preventive healthcare.', TRUE);


SELECT
    user_id,
    CONCAT(first_name,' ',last_name) AS doctor_name
FROM users
WHERE role_id = 'f8ac32aa-85e3-11f1-beb2-489ebde94b09'
ORDER BY first_name;


SELECT
    department_id,
    department_name
FROM departments
ORDER BY department_name;


INSERT INTO doctors
(
    user_id,
    department_id,
    qualification,
    experience_years,
    consultation_fee,
    joining_date,
    is_available
)
VALUES
('3db50768-85e5-11f1-beb2-489ebde94b09','61ac7960-85e6-11f1-beb2-489ebde94b09','MBBS, MD Cardiology',18,1800.00,'2015-03-15',TRUE),
('3dbacd44-85e5-11f1-beb2-489ebde94b09','61ac7960-85e6-11f1-beb2-489ebde94b09','MBBS, DM Cardiology',12,2200.00,'2018-06-10',TRUE),
('3dbad342-85e5-11f1-beb2-489ebde94b09','61ac84e2-85e6-11f1-beb2-489ebde94b09','MBBS, MD Neurology',15,2000.00,'2016-01-20',TRUE),
('3dbad935-85e5-11f1-beb2-489ebde94b09','61ac84e2-85e6-11f1-beb2-489ebde94b09','MBBS, DM Neurology',9,1900.00,'2020-02-12',TRUE),
('3dbae1e0-85e5-11f1-beb2-489ebde94b09','61ac8715-85e6-11f1-beb2-489ebde94b09','MBBS, MS Orthopedics',14,1700.00,'2017-07-18',TRUE),
('3dbae814-85e5-11f1-beb2-489ebde94b09','61ac8715-85e6-11f1-beb2-489ebde94b09','MBBS, MS Orthopedics',8,1500.00,'2021-04-05',TRUE),
('3dbaee00-85e5-11f1-beb2-489ebde94b09','61ac8897-85e6-11f1-beb2-489ebde94b09','MBBS, MD Pediatrics',11,1400.00,'2019-05-11',TRUE),
('3dbaf7f2-85e5-11f1-beb2-489ebde94b09','61ac8897-85e6-11f1-beb2-489ebde94b09','MBBS, DNB Pediatrics',6,1200.00,'2022-01-08',TRUE),
('3dbb00b6-85e5-11f1-beb2-489ebde94b09','61ac8a12-85e6-11f1-beb2-489ebde94b09','MBBS, MD Gynecology',13,1800.00,'2018-11-14',TRUE),
('3dbb0470-85e5-11f1-beb2-489ebde94b09','61ac8a12-85e6-11f1-beb2-489ebde94b09','MBBS, MS Gynecology',7,1600.00,'2021-09-01',TRUE),
('3dbb07c9-85e5-11f1-beb2-489ebde94b09','61ac8b86-85e6-11f1-beb2-489ebde94b09','MBBS, MD Dermatology',16,1700.00,'2014-12-20',TRUE),
('3dbb113b-85e5-11f1-beb2-489ebde94b09','61ac8b86-85e6-11f1-beb2-489ebde94b09','MBBS, DDVL',5,1200.00,'2023-03-01',TRUE),
('3dbb18b1-85e5-11f1-beb2-489ebde94b09','61ac8d7b-85e6-11f1-beb2-489ebde94b09','MBBS, MS ENT',17,1800.00,'2013-06-16',TRUE),
('3dbb21b5-85e5-11f1-beb2-489ebde94b09','61ac8d7b-85e6-11f1-beb2-489ebde94b09','MBBS, DLO',6,1300.00,'2022-07-01',TRUE),
('3dbb2bb9-85e5-11f1-beb2-489ebde94b09','61ac8ee0-85e6-11f1-beb2-489ebde94b09','MBBS, MD Radiology',19,2100.00,'2012-10-09',TRUE),
('3dbb301c-85e5-11f1-beb2-489ebde94b09','61ac8ee0-85e6-11f1-beb2-489ebde94b09','MBBS, DNB Radiology',8,1700.00,'2020-08-24',TRUE),
('3dbb36df-85e5-11f1-beb2-489ebde94b09','61ac92f0-85e6-11f1-beb2-489ebde94b09','MBBS, MD Emergency Medicine',12,1800.00,'2018-02-05',TRUE),
('3dbb392a-85e5-11f1-beb2-489ebde94b09','61ac92f0-85e6-11f1-beb2-489ebde94b09','MBBS, MEM',5,1400.00,'2023-01-15',TRUE),
('3dbb46a9-85e5-11f1-beb2-489ebde94b09','61ac946e-85e6-11f1-beb2-489ebde94b09','MBBS, MD General Medicine',20,2000.00,'2011-04-04',TRUE),
('3dbb49a1-85e5-11f1-beb2-489ebde94b09','61ac946e-85e6-11f1-beb2-489ebde94b09','MBBS, DNB General Medicine',10,1600.00,'2019-06-18',TRUE),
('3dbb4d26-85e5-11f1-beb2-489ebde94b09','61ac7960-85e6-11f1-beb2-489ebde94b09','MBBS, MD Cardiology',9,1900.00,'2020-09-09',TRUE),
('3dbb54a0-85e5-11f1-beb2-489ebde94b09','61ac84e2-85e6-11f1-beb2-489ebde94b09','MBBS, DM Neurology',7,1750.00,'2021-05-20',TRUE),
('3dbb5965-85e5-11f1-beb2-489ebde94b09','61ac946e-85e6-11f1-beb2-489ebde94b09','MBBS, MD General Medicine',4,1100.00,'2024-01-10',TRUE),
('3dbb5c5d-85e5-11f1-beb2-489ebde94b09','61ac8715-85e6-11f1-beb2-489ebde94b09','MBBS, MS Orthopedics',6,1450.00,'2022-03-28',TRUE),
('3dbb5db5-85e5-11f1-beb2-489ebde94b09','61ac8897-85e6-11f1-beb2-489ebde94b09','MBBS, MD Pediatrics',3,1000.00,'2024-06-01',TRUE);


SELECT
    d.doctor_id,
    CONCAT(u.first_name,' ',u.last_name) AS doctor_name
FROM doctors d
JOIN users u
    ON d.user_id = u.user_id
ORDER BY doctor_name;

SELECT
    specialization_id,
    specialization_name
FROM specializations
ORDER BY specialization_name;


INSERT INTO doctor_specializations
(
    doctor_id,
    specialization_id
)
VALUES

-- Cardiology
('fd74ec74-85e6-11f1-beb2-489ebde94b09','6ed6149d-85e6-11f1-beb2-489ebde94b09'),
('fd74ec74-85e6-11f1-beb2-489ebde94b09','6ed63bb3-85e6-11f1-beb2-489ebde94b09'),

('fd7510ef-85e6-11f1-beb2-489ebde94b09','6ed6149d-85e6-11f1-beb2-489ebde94b09'),

('fd7571a7-85e6-11f1-beb2-489ebde94b09','6ed6149d-85e6-11f1-beb2-489ebde94b09'),

-- Neurology
('fd751a67-85e6-11f1-beb2-489ebde94b09','6ed61f8c-85e6-11f1-beb2-489ebde94b09'),
('fd751a67-85e6-11f1-beb2-489ebde94b09','6ed63bb3-85e6-11f1-beb2-489ebde94b09'),

('fd75220f-85e6-11f1-beb2-489ebde94b09','6ed61f8c-85e6-11f1-beb2-489ebde94b09'),

('fd7573be-85e6-11f1-beb2-489ebde94b09','6ed61f8c-85e6-11f1-beb2-489ebde94b09'),

-- Orthopedics
('fd752a78-85e6-11f1-beb2-489ebde94b09','6ed622cc-85e6-11f1-beb2-489ebde94b09'),

('fd752df2-85e6-11f1-beb2-489ebde94b09','6ed622cc-85e6-11f1-beb2-489ebde94b09'),

('fd7577b8-85e6-11f1-beb2-489ebde94b09','6ed622cc-85e6-11f1-beb2-489ebde94b09'),
('fd7577b8-85e6-11f1-beb2-489ebde94b09','6ed63bb3-85e6-11f1-beb2-489ebde94b09'),

-- Pediatrics
('fd75336d-85e6-11f1-beb2-489ebde94b09','6ed625f0-85e6-11f1-beb2-489ebde94b09'),

('fd753b73-85e6-11f1-beb2-489ebde94b09','6ed625f0-85e6-11f1-beb2-489ebde94b09'),

('fd7579fb-85e6-11f1-beb2-489ebde94b09','6ed625f0-85e6-11f1-beb2-489ebde94b09'),

-- Gynecology
('fd753f56-85e6-11f1-beb2-489ebde94b09','6ed62db4-85e6-11f1-beb2-489ebde94b09'),

('fd7541f4-85e6-11f1-beb2-489ebde94b09','6ed62db4-85e6-11f1-beb2-489ebde94b09'),

-- Dermatology
('fd754495-85e6-11f1-beb2-489ebde94b09','6ed631dc-85e6-11f1-beb2-489ebde94b09'),

('fd754e64-85e6-11f1-beb2-489ebde94b09','6ed631dc-85e6-11f1-beb2-489ebde94b09'),

-- ENT
('fd7552eb-85e6-11f1-beb2-489ebde94b09','6ed635c4-85e6-11f1-beb2-489ebde94b09'),

('fd755bab-85e6-11f1-beb2-489ebde94b09','6ed635c4-85e6-11f1-beb2-489ebde94b09'),

-- Radiology
('fd755fc0-85e6-11f1-beb2-489ebde94b09','6ed63729-85e6-11f1-beb2-489ebde94b09'),

('fd7562b1-85e6-11f1-beb2-489ebde94b09','6ed63729-85e6-11f1-beb2-489ebde94b09'),

-- Emergency
('fd75676a-85e6-11f1-beb2-489ebde94b09','6ed63a76-85e6-11f1-beb2-489ebde94b09'),

('fd756975-85e6-11f1-beb2-489ebde94b09','6ed63a76-85e6-11f1-beb2-489ebde94b09'),

-- General Medicine
('fd756afb-85e6-11f1-beb2-489ebde94b09','6ed63bb3-85e6-11f1-beb2-489ebde94b09'),

('fd756d1e-85e6-11f1-beb2-489ebde94b09','6ed63bb3-85e6-11f1-beb2-489ebde94b09'),

('fd7575bc-85e6-11f1-beb2-489ebde94b09','6ed63bb3-85e6-11f1-beb2-489ebde94b09'),

-- Additional Specializations
('fd7510ef-85e6-11f1-beb2-489ebde94b09','6ed63729-85e6-11f1-beb2-489ebde94b09'),
('fd75220f-85e6-11f1-beb2-489ebde94b09','6ed63a76-85e6-11f1-beb2-489ebde94b09'),
('fd75336d-85e6-11f1-beb2-489ebde94b09','6ed63bb3-85e6-11f1-beb2-489ebde94b09'),
('fd754495-85e6-11f1-beb2-489ebde94b09','6ed63bb3-85e6-11f1-beb2-489ebde94b09'),
('fd7552eb-85e6-11f1-beb2-489ebde94b09','6ed63a76-85e6-11f1-beb2-489ebde94b09'),
('fd7562b1-85e6-11f1-beb2-489ebde94b09','6ed63bb3-85e6-11f1-beb2-489ebde94b09'),
('fd75676a-85e6-11f1-beb2-489ebde94b09','6ed63729-85e6-11f1-beb2-489ebde94b09');


INSERT INTO doctor_schedules
(
    doctor_id,
    day_of_week,
    start_time,
    end_time,
   slot_duration,
    is_active
)
SELECT doctor_id,'Monday','09:00:00','17:00:00',20,TRUE FROM doctors

UNION ALL
SELECT doctor_id,'Tuesday','09:00:00','17:00:00',20,TRUE FROM doctors

UNION ALL
SELECT doctor_id,'Wednesday','09:00:00','17:00:00',20,TRUE FROM doctors

UNION ALL
SELECT doctor_id,'Thursday','09:00:00','17:00:00',20,TRUE FROM doctors

UNION ALL
SELECT doctor_id,'Friday','09:00:00','17:00:00',20,TRUE FROM doctors

UNION ALL
SELECT doctor_id,'Saturday','09:00:00','13:00:00',12,TRUE FROM doctors;


INSERT INTO patients
(
    user_id,
    first_name,
    last_name,
    gender,
    date_of_birth,
    blood_group,
    phone,
    email,
    emergency_contact_name,
    emergency_contact_phone
)
VALUES
((SELECT user_id FROM users WHERE email='rahul.patel@gmail.com'),'Rahul','Patel','Male','1994-05-12','B+','9300001001','rahul.patel@gmail.com','Mahesh Patel','9800000001'),

((SELECT user_id FROM users WHERE email='priya.sharma@gmail.com'),'Priya','Sharma','Female','1998-03-18','A+','9300001002','priya.sharma@gmail.com','Ramesh Sharma','9800000002'),

((SELECT user_id FROM users WHERE email='amit.joshi@gmail.com'),'Amit','Joshi','Male','1990-09-22','O+','9300001003','amit.joshi@gmail.com','Sunita Joshi','9800000003'),

((SELECT user_id FROM users WHERE email='sneha.desai@gmail.com'),'Sneha','Desai','Female','1996-01-11','AB+','9300001004','sneha.desai@gmail.com','Kiran Desai','9800000004'),

((SELECT user_id FROM users WHERE email='karan.mehta@gmail.com'),'Karan','Mehta','Male','1992-07-28','B-','9300001005','karan.mehta@gmail.com','Suresh Mehta','9800000005'),

((SELECT user_id FROM users WHERE email='nisha.patel@gmail.com'),'Nisha','Patel','Female','1997-11-09','O-','9300001006','nisha.patel@gmail.com','Rina Patel','9800000006'),

((SELECT user_id FROM users WHERE email='vikas.shah@gmail.com'),'Vikas','Shah','Male','1989-04-16','A-','9300001007','vikas.shah@gmail.com','Dinesh Shah','9800000007'),

((SELECT user_id FROM users WHERE email='ritu.pandya@gmail.com'),'Ritu','Pandya','Female','1995-02-13','B+','9300001008','ritu.pandya@gmail.com','Mahendra Pandya','9800000008'),

((SELECT user_id FROM users WHERE email='manoj.bhatt@gmail.com'),'Manoj','Bhatt','Male','1988-08-04','AB-','9300001009','manoj.bhatt@gmail.com','Kalpesh Bhatt','9800000009'),

((SELECT user_id FROM users WHERE email='pooja.soni@gmail.com'),'Pooja','Soni','Female','1993-10-25','O+','9300001010','pooja.soni@gmail.com','Nitin Soni','9800000010'),

((SELECT user_id FROM users WHERE email='ankit.raval@gmail.com'),'Ankit','Raval','Male','1991-12-15','A+','9300001011','ankit.raval@gmail.com','Bhavesh Raval','9800000011'),

((SELECT user_id FROM users WHERE email='divya.modi@gmail.com'),'Divya','Modi','Female','1999-06-05','B+','9300001012','divya.modi@gmail.com','Harsh Modi','9800000012'),

((SELECT user_id FROM users WHERE email='jay.parmar@gmail.com'),'Jay','Parmar','Male','1994-09-30','O+','9300001013','jay.parmar@gmail.com','Rajesh Parmar','9800000013'),

((SELECT user_id FROM users WHERE email='mitali.dave@gmail.com'),'Mitali','Dave','Female','1996-04-17','A-','9300001014','mitali.dave@gmail.com','Nilesh Dave','9800000014'),

((SELECT user_id FROM users WHERE email='harsh.panchal@gmail.com'),'Harsh','Panchal','Male','1992-02-20','B+','9300001015','harsh.panchal@gmail.com','Vijay Panchal','9800000015'),

((SELECT user_id FROM users WHERE email='komal.kapoor@gmail.com'),'Komal','Kapoor','Female','1998-07-07','AB+','9300001016','komal.kapoor@gmail.com','Rakesh Kapoor','9800000016'),

((SELECT user_id FROM users WHERE email='nirav.trivedi@gmail.com'),'Nirav','Trivedi','Male','1987-03-14','O-','9300001017','nirav.trivedi@gmail.com','Jignesh Trivedi','9800000017'),

((SELECT user_id FROM users WHERE email='bhavna.chauhan@gmail.com'),'Bhavna','Chauhan','Female','1995-05-23','A+','9300001018','bhavna.chauhan@gmail.com','Mukesh Chauhan','9800000018'),

((SELECT user_id FROM users WHERE email='suresh.patel@gmail.com'),'Suresh','Patel','Male','1986-11-19','B-','9300001019','suresh.patel@gmail.com','Nilesh Patel','9800000019'),

((SELECT user_id FROM users WHERE email='rekha.joshi@gmail.com'),'Rekha','Joshi','Female','1994-08-10','O+','9300001020','rekha.joshi@gmail.com','Anil Joshi','9800000020');



INSERT INTO patients
(
    first_name,
    last_name,
    phone,
    date_of_birth,
    gender,
    blood_group
)
VALUES
('Rahul','Patel','8000001001','1995-05-12','MALE','B+'),
('Priya','Sharma','8000001002','1998-08-25','FEMALE','O+'),
('Amit','Joshi','8000001003','1988-01-10','MALE','A+'),
('Sneha','Desai','8000001004','1993-07-14','FEMALE','AB+'),
('Karan','Mehta','8000001005','1990-11-22','MALE','O-'),
('Nisha','Patel','8000001006','1999-03-18','FEMALE','B-'),
('Vikas','Shah','8000001007','1985-12-05','MALE','A-'),
('Ritu','Pandya','8000001008','1994-09-27','FEMALE','O+'),
('Manoj','Bhatt','8000001009','1978-04-08','MALE','B+'),
('Pooja','Soni','8000001010','1996-06-19','FEMALE','A+'),
('Ankit','Raval','8000001011','1992-02-14','MALE','AB-'),
('Divya','Modi','8000001012','2000-10-03','FEMALE','B+'),
('Jay','Parmar','8000001013','1989-01-29','MALE','O+'),
('Mitali','Dave','8000001014','1997-12-18','FEMALE','A-'),
('Harsh','Panchal','8000001015','1991-05-21','MALE','B-'),
('Komal','Kapoor','8000001016','1995-07-30','FEMALE','AB+'),
('Nirav','Trivedi','8000001017','1987-03-12','MALE','O-'),
('Bhavna','Chauhan','8000001018','1999-11-09','FEMALE','A+'),
('Suresh','Patel','8000001019','1975-08-15','MALE','B+'),
('Rekha','Joshi','8000001020','1983-04-01','FEMALE','O+'),
('Rohan','Shukla','8000001021','2001-09-11','MALE','A+'),
('Khushi','Patel','8000001022','2003-02-28','FEMALE','B+'),
('Yash','Thakkar','8000001023','1994-06-17','MALE','AB+'),
('Neha','Vyas','8000001024','1998-01-06','FEMALE','O-'),
('Parth','Solanki','8000001025','1990-10-22','MALE','A+');


INSERT INTO patients
(
    first_name,
    last_name,
    phone,
    date_of_birth,
    gender,
    blood_group
)
VALUES
('Akash','Patel','8000001026','1993-04-18','MALE','B+'),
('Riya','Shah','8000001027','1997-11-23','FEMALE','O+'),
('Deepak','Mehta','8000001028','1986-07-15','MALE','A+'),
('Isha','Desai','8000001029','1999-09-02','FEMALE','AB+'),
('Vimal','Joshi','8000001030','1984-12-11','MALE','O-'),
('Krupa','Patel','8000001031','1996-03-28','FEMALE','B-'),
('Nilesh','Modi','8000001032','1979-08-07','MALE','A-'),
('Sonal','Trivedi','8000001033','1992-01-17','FEMALE','O+'),
('Hemant','Bhatt','8000001034','1988-05-26','MALE','B+'),
('Pallavi','Soni','8000001035','1995-10-30','FEMALE','A+'),
('Chirag','Raval','8000001036','1991-06-14','MALE','AB-'),
('Nidhi','Pandya','8000001037','2002-02-05','FEMALE','B+'),
('Kishan','Parmar','8000001038','1987-09-12','MALE','O+'),
('Vaishali','Dave','8000001039','1994-12-19','FEMALE','A-'),
('Jatin','Panchal','8000001040','1990-07-04','MALE','B-'),
('Mona','Kapoor','8000001041','1998-04-29','FEMALE','AB+'),
('Alpesh','Chauhan','8000001042','1985-11-18','MALE','O-'),
('Heena','Vyas','8000001043','1997-08-09','FEMALE','A+'),
('Mahesh','Patel','8000001044','1976-01-13','MALE','B+'),
('Shilpa','Joshi','8000001045','1982-06-25','FEMALE','O+'),
('Dhruv','Shukla','8000001046','2000-03-21','MALE','A+'),
('Priti','Solanki','8000001047','1993-09-16','FEMALE','B+'),
('Nitin','Thakkar','8000001048','1989-10-05','MALE','AB+'),
('Asha','Rathod','8000001049','1996-02-27','FEMALE','O-'),
('Tushar','Mistry','8000001050','1991-05-08','MALE','A+');


SELECT
    patient_id,
    CONCAT(first_name, ' ', last_name) AS patient_name
FROM patients
ORDER BY first_name, last_name;


INSERT INTO patient_addresses
(
    patient_id,
    address_type,
    address_line_1,
    address_line_2,
    city,
    state,
    country,
    postal_code,
    is_primary
)
VALUES
('fcc2297e-85e8-11f1-beb2-489ebde94b09','HOME','101 Shree Residency','Near Iscon Mall','Ahmedabad','Gujarat','India','380015',TRUE),
('fcc265cf-85e8-11f1-beb2-489ebde94b09','HOME','22 Green Park','Sector 8','Gandhinagar','Gujarat','India','382008',TRUE),
('da5e2118-85e8-11f1-beb2-489ebde94b09','HOME','15 Patel Society',NULL,'Surat','Gujarat','India','395007',TRUE),
('da5e3162-85e8-11f1-beb2-489ebde94b09','HOME','12 Silver Heights','Pal','Surat','Gujarat','India','395009',TRUE),
('fcc281d6-85e8-11f1-beb2-489ebde94b09','HOME','88 Shanti Nagar',NULL,'Vadodara','Gujarat','India','390001',TRUE),
('da5e3f06-85e8-11f1-beb2-489ebde94b09','HOME','31 Sunrise Residency','Vesu','Surat','Gujarat','India','395007',TRUE),
('fcc25491-85e8-11f1-beb2-489ebde94b09','HOME','45 Raj Empire',NULL,'Rajkot','Gujarat','India','360001',TRUE),
('fcc23cf4-85e8-11f1-beb2-489ebde94b09','HOME','17 Lake View','Satellite','Ahmedabad','Gujarat','India','380015',TRUE),
('fcc2703a-85e8-11f1-beb2-489ebde94b09','HOME','54 Akshar Villa',NULL,'Anand','Gujarat','India','388001',TRUE),
('da5e33a8-85e8-11f1-beb2-489ebde94b09','HOME','11 Shiv Residency','City Light','Surat','Gujarat','India','395007',TRUE),
('da5e3a0d-85e8-11f1-beb2-489ebde94b09','HOME','90 Krishna Park',NULL,'Bhavnagar','Gujarat','India','364001',TRUE),
('fcc2684c-85e8-11f1-beb2-489ebde94b09','HOME','65 Nilkanth Society',NULL,'Mehsana','Gujarat','India','384001',TRUE),
('fcc24eb3-85e8-11f1-beb2-489ebde94b09','HOME','201 Orchid Heights','Alkapuri','Vadodara','Gujarat','India','390007',TRUE),
('fcc23ffe-85e8-11f1-beb2-489ebde94b09','HOME','78 Galaxy Residency',NULL,'Ahmedabad','Gujarat','India','380061',TRUE),
('fcc260bd-85e8-11f1-beb2-489ebde94b09','HOME','33 Royal Homes',NULL,'Jamnagar','Gujarat','India','361001',TRUE),
('da5e3651-85e8-11f1-beb2-489ebde94b09','HOME','27 Shubh Residency',NULL,'Surat','Gujarat','India','395003',TRUE),
('da5e24da-85e8-11f1-beb2-489ebde94b09','HOME','104 Lotus Heights',NULL,'Ahmedabad','Gujarat','India','380054',TRUE),
('da5e4740-85e8-11f1-beb2-489ebde94b09','HOME','14 Aashirwad Society',NULL,'Navsari','Gujarat','India','396445',TRUE),
('fcc259d6-85e8-11f1-beb2-489ebde94b09','HOME','61 Om Residency',NULL,'Rajkot','Gujarat','India','360005',TRUE),
('da5e3ba8-85e8-11f1-beb2-489ebde94b09','HOME','18 Palm Residency',NULL,'Surat','Gujarat','India','395004',TRUE),
('fcc24653-85e8-11f1-beb2-489ebde94b09','HOME','205 Shyam Villa',NULL,'Anand','Gujarat','India','388001',TRUE),
('fcc26b09-85e8-11f1-beb2-489ebde94b09','HOME','75 Harmony Homes',NULL,'Vadodara','Gujarat','India','390020',TRUE),
('da5e2bf7-85e8-11f1-beb2-489ebde94b09','HOME','89 Silver Nest',NULL,'Ahmedabad','Gujarat','India','380009',TRUE),
('da5e3863-85e8-11f1-beb2-489ebde94b09','HOME','50 River View',NULL,'Surat','Gujarat','India','395006',TRUE),
('fcc26359-85e8-11f1-beb2-489ebde94b09','HOME','39 Green City',NULL,'Gandhinagar','Gujarat','India','382421',TRUE),
('da5e4a47-85e8-11f1-beb2-489ebde94b09','HOME','99 Royal Park',NULL,'Rajkot','Gujarat','India','360007',TRUE),
('fcc2574a-85e8-11f1-beb2-489ebde94b09','HOME','25 Umiya Nagar',NULL,'Mehsana','Gujarat','India','384002',TRUE),
('fcc2491e-85e8-11f1-beb2-489ebde94b09','HOME','80 Crystal Avenue',NULL,'Bhavnagar','Gujarat','India','364002',TRUE),
('da5e3d54-85e8-11f1-beb2-489ebde94b09','HOME','13 Shiv Park',NULL,'Surat','Gujarat','India','395002',TRUE),
('da5e26ac-85e8-11f1-beb2-489ebde94b09','HOME','41 Raj Residency',NULL,'Ahmedabad','Gujarat','India','380013',TRUE),
('fcc27a45-85e8-11f1-beb2-489ebde94b09','HOME','112 Ganesh Heights',NULL,'Vadodara','Gujarat','India','390015',TRUE),
('fcc251b7-85e8-11f1-beb2-489ebde94b09','HOME','63 Green Valley',NULL,'Rajkot','Gujarat','India','360004',TRUE),
('da5e4bd3-85e8-11f1-beb2-489ebde94b09','HOME','23 Sai Residency',NULL,'Anand','Gujarat','India','388120',TRUE),
('da5e2d93-85e8-11f1-beb2-489ebde94b09','HOME','7 Akash Complex',NULL,'Surat','Gujarat','India','395001',TRUE),
('fcc2729b-85e8-11f1-beb2-489ebde94b09','HOME','93 Nilgiri Society',NULL,'Ahmedabad','Gujarat','India','380008',TRUE),
('da5e1ce9-85e8-11f1-beb2-489ebde94b09','HOME','51 Happy Home','Adajan','Surat','Gujarat','India','395009',TRUE),
('da5e04bd-85e8-11f1-beb2-489ebde94b09','HOME','19 Shree Hari Residency','Vastrapur','Ahmedabad','Gujarat','India','380015',TRUE),
('da5e4397-85e8-11f1-beb2-489ebde94b09','HOME','27 Shivam Park',NULL,'Vadodara','Gujarat','India','390019',TRUE),
('da5e29f8-85e8-11f1-beb2-489ebde94b09','HOME','10 Diamond Residency',NULL,'Surat','Gujarat','India','395007',TRUE),
('fcc23913-85e8-11f1-beb2-489ebde94b09','HOME','72 Silver Stone',NULL,'Ahmedabad','Gujarat','India','380060',TRUE),
('da5e45a9-85e8-11f1-beb2-489ebde94b09','HOME','28 Royal Avenue',NULL,'Rajkot','Gujarat','India','360002',TRUE),
('fcc26dcf-85e8-11f1-beb2-489ebde94b09','HOME','15 Green Villa',NULL,'Bhavnagar','Gujarat','India','364003',TRUE),
('da5e230e-85e8-11f1-beb2-489ebde94b09','HOME','101 Rose Residency',NULL,'Surat','Gujarat','India','395010',TRUE),
('fcc24bf0-85e8-11f1-beb2-489ebde94b09','HOME','55 Lotus Enclave',NULL,'Anand','Gujarat','India','388001',TRUE),
('da5e40a6-85e8-11f1-beb2-489ebde94b09','HOME','9 Green Avenue',NULL,'Ahmedabad','Gujarat','India','380052',TRUE),
('fcc283ba-85e8-11f1-beb2-489ebde94b09','HOME','32 Shanti Residency',NULL,'Jamnagar','Gujarat','India','361002',TRUE),
('fcc25df5-85e8-11f1-beb2-489ebde94b09','HOME','76 Sapphire Residency',NULL,'Vadodara','Gujarat','India','390021',TRUE),
('da5e285b-85e8-11f1-beb2-489ebde94b09','HOME','87 Shiv Shakti Society',NULL,'Surat','Gujarat','India','395004',TRUE),
('fcc24374-85e8-11f1-beb2-489ebde94b09','HOME','16 Omkar Residency',NULL,'Mehsana','Gujarat','India','384170',TRUE),
('da5e48ca-85e8-11f1-beb2-489ebde94b09','HOME','24 Raj Palace',NULL,'Ahmedabad','Gujarat','India','380058',TRUE);



INSERT INTO insurance_policies
(
    patient_id,
    provider_name,
    company_name,
    policy_number,
    coverage_percentage,
    start_date,
    end_date
)
VALUES
('da5e04bd-85e8-11f1-beb2-489ebde94b09','Star Health','Star Health Insurance','STAR100001',80.00,'2025-01-01','2026-12-31'),
('da5e1ce9-85e8-11f1-beb2-489ebde94b09','HDFC ERGO','HDFC ERGO General Insurance','HDFC100002',90.00,'2025-02-15','2027-02-14'),
('da5e2118-85e8-11f1-beb2-489ebde94b09','Niva Bupa','Niva Bupa Health Insurance','NIVA100003',75.00,'2025-03-01','2026-02-28'),
('da5e230e-85e8-11f1-beb2-489ebde94b09','Care Health','Care Health Insurance','CARE100004',85.00,'2025-01-10','2026-01-09'),
('da5e24da-85e8-11f1-beb2-489ebde94b09','ICICI Lombard','ICICI Lombard','ICICI100005',70.00,'2025-04-01','2027-03-31'),
('da5e26ac-85e8-11f1-beb2-489ebde94b09','Star Health','Star Health Insurance','STAR100006',100.00,'2025-05-15','2026-05-14'),
('da5e285b-85e8-11f1-beb2-489ebde94b09','HDFC ERGO','HDFC ERGO General Insurance','HDFC100007',80.00,'2025-01-20','2026-01-19'),
('da5e29f8-85e8-11f1-beb2-489ebde94b09','Niva Bupa','Niva Bupa Health Insurance','NIVA100008',60.00,'2025-06-01','2027-05-31'),
('da5e2bf7-85e8-11f1-beb2-489ebde94b09','Care Health','Care Health Insurance','CARE100009',95.00,'2025-02-01','2026-01-31'),
('da5e2d93-85e8-11f1-beb2-489ebde94b09','ICICI Lombard','ICICI Lombard','ICICI100010',85.00,'2025-03-20','2026-03-19'),
('da5e3162-85e8-11f1-beb2-489ebde94b09','Star Health','Star Health Insurance','STAR100011',75.00,'2025-04-15','2026-04-14'),
('da5e33a8-85e8-11f1-beb2-489ebde94b09','HDFC ERGO','HDFC ERGO General Insurance','HDFC100012',90.00,'2025-02-10','2027-02-09'),
('da5e3651-85e8-11f1-beb2-489ebde94b09','Niva Bupa','Niva Bupa Health Insurance','NIVA100013',80.00,'2025-01-01','2026-12-31'),
('da5e3863-85e8-11f1-beb2-489ebde94b09','Care Health','Care Health Insurance','CARE100014',70.00,'2025-05-01','2027-04-30'),
('da5e3a0d-85e8-11f1-beb2-489ebde94b09','ICICI Lombard','ICICI Lombard','ICICI100015',85.00,'2025-06-15','2026-06-14'),
('da5e3ba8-85e8-11f1-beb2-489ebde94b09','Star Health','Star Health Insurance','STAR100016',90.00,'2025-02-01','2026-01-31'),
('da5e3d54-85e8-11f1-beb2-489ebde94b09','HDFC ERGO','HDFC ERGO General Insurance','HDFC100017',80.00,'2025-01-05','2027-01-04'),
('da5e3f06-85e8-11f1-beb2-489ebde94b09','Niva Bupa','Niva Bupa Health Insurance','NIVA100018',75.00,'2025-03-15','2026-03-14'),
('da5e40a6-85e8-11f1-beb2-489ebde94b09','Care Health','Care Health Insurance','CARE100019',100.00,'2025-04-01','2027-03-31'),
('da5e4397-85e8-11f1-beb2-489ebde94b09','ICICI Lombard','ICICI Lombard','ICICI100020',65.00,'2025-02-20','2026-02-19'),
('da5e45a9-85e8-11f1-beb2-489ebde94b09','Star Health','Star Health Insurance','STAR100021',80.00,'2025-05-10','2027-05-09'),
('da5e4740-85e8-11f1-beb2-489ebde94b09','HDFC ERGO','HDFC ERGO General Insurance','HDFC100022',90.00,'2025-01-01','2026-12-31'),
('da5e48ca-85e8-11f1-beb2-489ebde94b09','Niva Bupa','Niva Bupa Health Insurance','NIVA100023',85.00,'2025-03-01','2027-02-28'),
('da5e4a47-85e8-11f1-beb2-489ebde94b09','Care Health','Care Health Insurance','CARE100024',75.00,'2025-06-01','2026-05-31'),
('da5e4bd3-85e8-11f1-beb2-489ebde94b09','ICICI Lombard','ICICI Lombard','ICICI100025',80.00,'2025-02-15','2027-02-14'),
('fcc2297e-85e8-11f1-beb2-489ebde94b09','Star Health','Star Health Insurance','STAR100026',90.00,'2025-01-01','2026-12-31'),
('fcc23913-85e8-11f1-beb2-489ebde94b09','HDFC ERGO','HDFC ERGO General Insurance','HDFC100027',70.00,'2025-04-01','2026-03-31'),
('fcc23cf4-85e8-11f1-beb2-489ebde94b09','Niva Bupa','Niva Bupa Health Insurance','NIVA100028',80.00,'2025-05-01','2027-04-30'),
('fcc24374-85e8-11f1-beb2-489ebde94b09','Care Health','Care Health Insurance','CARE100029',95.00,'2025-02-01','2026-01-31'),
('fcc24653-85e8-11f1-beb2-489ebde94b09','ICICI Lombard','ICICI Lombard','ICICI100030',85.00,'2025-03-01','2027-02-28'),
('fcc2491e-85e8-11f1-beb2-489ebde94b09','Star Health','Star Health Insurance','STAR100031',80.00,'2025-01-15','2026-01-14'),
('fcc24bf0-85e8-11f1-beb2-489ebde94b09','HDFC ERGO','HDFC ERGO General Insurance','HDFC100032',90.00,'2025-06-01','2027-05-31'),
('fcc24eb3-85e8-11f1-beb2-489ebde94b09','Niva Bupa','Niva Bupa Health Insurance','NIVA100033',70.00,'2025-02-20','2026-02-19'),
('fcc251b7-85e8-11f1-beb2-489ebde94b09','Care Health','Care Health Insurance','CARE100034',85.00,'2025-04-10','2027-04-09'),
('fcc25491-85e8-11f1-beb2-489ebde94b09','ICICI Lombard','ICICI Lombard','ICICI100035',75.00,'2025-05-01','2026-04-30');



INSERT INTO room_types
(
    room_type_name,
    description
)
VALUES
('General Ward','Shared ward with multiple beds'),
('Semi-Private','Shared room with two beds'),
('Private','Single occupancy private room'),
('Deluxe','Premium private room with additional facilities'),
('ICU','Intensive Care Unit'),
('VIP Suite','Luxury suite with premium amenities');


SELECT room_type_id, room_type_name
FROM room_types;


INSERT INTO rooms
(
    room_number,
    room_type_id,
    floor_number,
    daily_charge,
    is_available
)
VALUES

-- ===========================
-- General Ward (15)
-- ===========================
('GW101','95c0e2d6-85ea-11f1-beb2-489ebde94b09',1,1500,TRUE),
('GW102','95c0e2d6-85ea-11f1-beb2-489ebde94b09',1,1500,TRUE),
('GW103','95c0e2d6-85ea-11f1-beb2-489ebde94b09',1,1500,FALSE),
('GW104','95c0e2d6-85ea-11f1-beb2-489ebde94b09',1,1500,TRUE),
('GW105','95c0e2d6-85ea-11f1-beb2-489ebde94b09',1,1500,TRUE),
('GW106','95c0e2d6-85ea-11f1-beb2-489ebde94b09',1,1500,FALSE),
('GW107','95c0e2d6-85ea-11f1-beb2-489ebde94b09',1,1500,TRUE),
('GW108','95c0e2d6-85ea-11f1-beb2-489ebde94b09',1,1500,TRUE),
('GW109','95c0e2d6-85ea-11f1-beb2-489ebde94b09',1,1500,TRUE),
('GW110','95c0e2d6-85ea-11f1-beb2-489ebde94b09',1,1500,TRUE),
('GW111','95c0e2d6-85ea-11f1-beb2-489ebde94b09',1,1500,FALSE),
('GW112','95c0e2d6-85ea-11f1-beb2-489ebde94b09',1,1500,TRUE),
('GW113','95c0e2d6-85ea-11f1-beb2-489ebde94b09',1,1500,TRUE),
('GW114','95c0e2d6-85ea-11f1-beb2-489ebde94b09',1,1500,TRUE),
('GW115','95c0e2d6-85ea-11f1-beb2-489ebde94b09',1,1500,TRUE),

-- ===========================
-- Semi Private (10)
-- ===========================
('SP201','95c64836-85ea-11f1-beb2-489ebde94b09',2,2500,TRUE),
('SP202','95c64836-85ea-11f1-beb2-489ebde94b09',2,2500,TRUE),
('SP203','95c64836-85ea-11f1-beb2-489ebde94b09',2,2500,FALSE),
('SP204','95c64836-85ea-11f1-beb2-489ebde94b09',2,2500,TRUE),
('SP205','95c64836-85ea-11f1-beb2-489ebde94b09',2,2500,TRUE),
('SP206','95c64836-85ea-11f1-beb2-489ebde94b09',2,2500,TRUE),
('SP207','95c64836-85ea-11f1-beb2-489ebde94b09',2,2500,FALSE),
('SP208','95c64836-85ea-11f1-beb2-489ebde94b09',2,2500,TRUE),
('SP209','95c64836-85ea-11f1-beb2-489ebde94b09',2,2500,TRUE),
('SP210','95c64836-85ea-11f1-beb2-489ebde94b09',2,2500,TRUE),

-- ===========================
-- Private (10)
-- ===========================
('PR301','95c64b0f-85ea-11f1-beb2-489ebde94b09',3,4000,TRUE),
('PR302','95c64b0f-85ea-11f1-beb2-489ebde94b09',3,4000,FALSE),
('PR303','95c64b0f-85ea-11f1-beb2-489ebde94b09',3,4000,TRUE),
('PR304','95c64b0f-85ea-11f1-beb2-489ebde94b09',3,4000,TRUE),
('PR305','95c64b0f-85ea-11f1-beb2-489ebde94b09',3,4000,TRUE),
('PR306','95c64b0f-85ea-11f1-beb2-489ebde94b09',3,4000,FALSE),
('PR307','95c64b0f-85ea-11f1-beb2-489ebde94b09',3,4000,TRUE),
('PR308','95c64b0f-85ea-11f1-beb2-489ebde94b09',3,4000,TRUE),
('PR309','95c64b0f-85ea-11f1-beb2-489ebde94b09',3,4000,TRUE),
('PR310','95c64b0f-85ea-11f1-beb2-489ebde94b09',3,4000,TRUE),

-- ===========================
-- Deluxe (8)
-- ===========================
('DL401','95c64d26-85ea-11f1-beb2-489ebde94b09',4,6000,TRUE),
('DL402','95c64d26-85ea-11f1-beb2-489ebde94b09',4,6000,TRUE),
('DL403','95c64d26-85ea-11f1-beb2-489ebde94b09',4,6000,FALSE),
('DL404','95c64d26-85ea-11f1-beb2-489ebde94b09',4,6000,TRUE),
('DL405','95c64d26-85ea-11f1-beb2-489ebde94b09',4,6000,TRUE),
('DL406','95c64d26-85ea-11f1-beb2-489ebde94b09',4,6000,TRUE),
('DL407','95c64d26-85ea-11f1-beb2-489ebde94b09',4,6000,TRUE),
('DL408','95c64d26-85ea-11f1-beb2-489ebde94b09',4,6000,FALSE),

-- ===========================
-- ICU (5)
-- ===========================
('ICU01','95c671c3-85ea-11f1-beb2-489ebde94b09',5,10000,TRUE),
('ICU02','95c671c3-85ea-11f1-beb2-489ebde94b09',5,10000,FALSE),
('ICU03','95c671c3-85ea-11f1-beb2-489ebde94b09',5,10000,TRUE),
('ICU04','95c671c3-85ea-11f1-beb2-489ebde94b09',5,10000,TRUE),
('ICU05','95c671c3-85ea-11f1-beb2-489ebde94b09',5,10000,TRUE),

-- ===========================
-- VIP Suite (2)
-- ===========================
('VIP01','95c673f7-85ea-11f1-beb2-489ebde94b09',6,15000,TRUE),
('VIP02','95c673f7-85ea-11f1-beb2-489ebde94b09',6,15000,FALSE);



SELECT
    room_id,
    room_number
FROM rooms
ORDER BY room_number;

SELECT
    user_id,
    CONCAT(first_name,' ',last_name) AS name
FROM users
WHERE role_id = 'f8ac3861-85e3-11f1-beb2-489ebde94b09'   -- Receptionist
ORDER BY first_name;



INSERT INTO admissions
(
    patient_id,
    room_id,
    admitted_by,
    admit_date,
    discharge_date,
    admission_reason
)
VALUES
('da5e04bd-85e8-11f1-beb2-489ebde94b09','cf04e340-85ea-11f1-beb2-489ebde94b09','3d1acd2a-85e6-11f1-beb2-489ebde94b09','2026-01-05 09:00:00','2026-01-08 11:30:00','High Fever'),

('da5e1ce9-85e8-11f1-beb2-489ebde94b09','cf053d0c-85ea-11f1-beb2-489ebde94b09','3d1aca99-85e6-11f1-beb2-489ebde94b09','2026-01-08 10:15:00','2026-01-12 10:00:00','Dengue'),

('da5e2118-85e8-11f1-beb2-489ebde94b09','cf0556f5-85ea-11f1-beb2-489ebde94b09','3d1ad21a-85e6-11f1-beb2-489ebde94b09','2026-01-10 08:30:00','2026-01-15 14:00:00','Appendicitis'),

('da5e230e-85e8-11f1-beb2-489ebde94b09','cf05586f-85ea-11f1-beb2-489ebde94b09','3d1acf72-85e6-11f1-beb2-489ebde94b09','2026-01-15 09:45:00','2026-01-18 12:00:00','Food Poisoning'),

('da5e24da-85e8-11f1-beb2-489ebde94b09','cf056600-85ea-11f1-beb2-489ebde94b09','3d1ae23a-85e6-11f1-beb2-489ebde94b09','2026-01-18 11:00:00','2026-01-22 15:30:00','Heart Checkup'),

('da5e26ac-85e8-11f1-beb2-489ebde94b09','cf0567b1-85ea-11f1-beb2-489ebde94b09','3d1ae6c6-85e6-11f1-beb2-489ebde94b09','2026-01-22 08:00:00','2026-01-25 10:00:00','Pneumonia'),

('da5e285b-85e8-11f1-beb2-489ebde94b09','cf057bf4-85ea-11f1-beb2-489ebde94b09','3d1af6b2-85e6-11f1-beb2-489ebde94b09','2026-02-01 10:30:00','2026-02-06 09:30:00','Diabetes Observation'),

('da5e29f8-85e8-11f1-beb2-489ebde94b09','cf05a0df-85ea-11f1-beb2-489ebde94b09','3d1aec4c-85e6-11f1-beb2-489ebde94b09','2026-02-04 02:00:00','2026-02-09 12:00:00','Heart Attack'),

('da5e2bf7-85e8-11f1-beb2-489ebde94b09','cf05aa4e-85ea-11f1-beb2-489ebde94b09','3d1afd61-85e6-11f1-beb2-489ebde94b09','2026-02-10 09:00:00','2026-02-15 13:00:00','Executive Health Package'),

('da5e2d93-85e8-11f1-beb2-489ebde94b09','cf0540ef-85ea-11f1-beb2-489ebde94b09','3d1ae509-85e6-11f1-beb2-489ebde94b09','2026-02-12 07:30:00','2026-02-16 11:00:00','Typhoid'),

('da5e3162-85e8-11f1-beb2-489ebde94b09','cf0542d6-85ea-11f1-beb2-489ebde94b09','3d1afae6-85e6-11f1-beb2-489ebde94b09','2026-02-18 09:30:00','2026-02-20 10:00:00','Migraine'),

('da5e33a8-85e8-11f1-beb2-489ebde94b09','cf0545d1-85ea-11f1-beb2-489ebde94b09','3d1ae87a-85e6-11f1-beb2-489ebde94b09','2026-02-21 08:00:00','2026-02-26 09:00:00','Asthma'),

('da5e3651-85e8-11f1-beb2-489ebde94b09','cf0547fc-85ea-11f1-beb2-489ebde94b09','3d1ae6c6-85e6-11f1-beb2-489ebde94b09','2026-03-01 10:00:00','2026-03-04 10:30:00','Kidney Stone'),

('da5e3863-85e8-11f1-beb2-489ebde94b09','cf0549c9-85ea-11f1-beb2-489ebde94b09','3d1aea3d-85e6-11f1-beb2-489ebde94b09','2026-03-05 08:30:00','2026-03-09 09:15:00','Viral Infection'),

('da5e3a0d-85e8-11f1-beb2-489ebde94b09','cf054b61-85ea-11f1-beb2-489ebde94b09','3d1acd2a-85e6-11f1-beb2-489ebde94b09','2026-03-09 11:00:00','2026-03-13 10:00:00','Chest Pain'),

('da5e3ba8-85e8-11f1-beb2-489ebde94b09','cf054ca5-85ea-11f1-beb2-489ebde94b09','3d1ad447-85e6-11f1-beb2-489ebde94b09','2026-03-15 09:00:00','2026-03-17 09:30:00','Allergy'),

('da5e3d54-85e8-11f1-beb2-489ebde94b09','cf054db1-85ea-11f1-beb2-489ebde94b09','3d1af0c1-85e6-11f1-beb2-489ebde94b09','2026-03-20 07:30:00',NULL,'Observation'),

('da5e3f06-85e8-11f1-beb2-489ebde94b09','cf054ecc-85ea-11f1-beb2-489ebde94b09','3d1ae509-85e6-11f1-beb2-489ebde94b09','2026-03-25 09:15:00',NULL,'Pregnancy Care'),

('da5e40a6-85e8-11f1-beb2-489ebde94b09','cf0550c4-85ea-11f1-beb2-489ebde94b09','3d1aec4c-85e6-11f1-beb2-489ebde94b09','2026-04-01 08:45:00',NULL,'Blood Pressure'),

('da5e4397-85e8-11f1-beb2-489ebde94b09','cf055214-85ea-11f1-beb2-489ebde94b09','3d1afd61-85e6-11f1-beb2-489ebde94b09','2026-04-03 10:30:00',NULL,'Stroke Recovery'),

('da5e45a9-85e8-11f1-beb2-489ebde94b09','cf05532f-85ea-11f1-beb2-489ebde94b09','3d1ae23a-85e6-11f1-beb2-489ebde94b09','2026-04-07 09:30:00',NULL,'Fracture'),

('da5e4740-85e8-11f1-beb2-489ebde94b09','cf05558f-85ea-11f1-beb2-489ebde94b09','3d1ae6c6-85e6-11f1-beb2-489ebde94b09','2026-04-10 08:00:00',NULL,'Delivery'),

('da5e48ca-85e8-11f1-beb2-489ebde94b09','cf0559bf-85ea-11f1-beb2-489ebde94b09','3d1aea3d-85e6-11f1-beb2-489ebde94b09','2026-04-12 09:00:00','2026-04-15 10:00:00','Malaria'),

('da5e4a47-85e8-11f1-beb2-489ebde94b09','cf055b6f-85ea-11f1-beb2-489ebde94b09','3d1af6b2-85e6-11f1-beb2-489ebde94b09','2026-04-15 07:45:00','2026-04-18 09:00:00','Gall Bladder Surgery'),

('da5e4bd3-85e8-11f1-beb2-489ebde94b09','cf055cbd-85ea-11f1-beb2-489ebde94b09','3d1aca99-85e6-11f1-beb2-489ebde94b09','2026-04-18 10:00:00','2026-04-21 11:30:00','Back Pain'),

('fcc2297e-85e8-11f1-beb2-489ebde94b09','cf055dec-85ea-11f1-beb2-489ebde94b09','3d1acf72-85e6-11f1-beb2-489ebde94b09','2026-04-22 09:30:00','2026-04-25 09:00:00','Dehydration'),

('fcc23913-85e8-11f1-beb2-489ebde94b09','cf055fef-85ea-11f1-beb2-489ebde94b09','3d1ad21a-85e6-11f1-beb2-489ebde94b09','2026-04-24 08:15:00','2026-04-28 12:00:00','Eye Infection'),

('fcc23cf4-85e8-11f1-beb2-489ebde94b09','cf0561b3-85ea-11f1-beb2-489ebde94b09','3d1ae87a-85e6-11f1-beb2-489ebde94b09','2026-05-01 10:30:00','2026-05-05 10:00:00','Skin Infection'),

('fcc24374-85e8-11f1-beb2-489ebde94b09','cf056379-85ea-11f1-beb2-489ebde94b09','3d1afae6-85e6-11f1-beb2-489ebde94b09','2026-05-04 08:45:00','2026-05-08 09:15:00','Arthritis'),

('fcc24653-85e8-11f1-beb2-489ebde94b09','cf056486-85ea-11f1-beb2-489ebde94b09','3d1ae509-85e6-11f1-beb2-489ebde94b09','2026-05-10 09:00:00','2026-05-14 11:00:00','Post Surgery Recovery');



INSERT INTO medicines
(
    medicine_name,
    manufacturer,
    unit_price,
    quantity,
    expiry_date
)
VALUES
('Paracetamol 500mg','Sun Pharma',2.50,500,'2028-12-31'),
('Crocin 650mg','GSK',3.20,400,'2028-10-31'),
('Dolo 650','Micro Labs',3.00,600,'2029-01-31'),
('Azithromycin 500mg','Cipla',18.50,250,'2028-08-31'),
('Amoxicillin 500mg','Mankind',12.00,350,'2028-11-30'),
('Augmentin 625','GSK',28.00,200,'2028-09-30'),
('Pantoprazole 40mg','Sun Pharma',7.50,300,'2028-12-31'),
('Omeprazole 20mg','Cipla',6.00,350,'2028-07-31'),
('Cetirizine 10mg','Dr. Reddy''s',2.80,450,'2029-03-31'),
('Levocetirizine 5mg','Cipla',4.20,300,'2028-12-31'),

('Metformin 500mg','Sun Pharma',2.60,500,'2029-05-31'),
('Glimipride 2mg','Torrent Pharma',5.50,250,'2028-11-30'),
('Telmisartan 40mg','Lupin',8.50,280,'2028-10-31'),
('Amlodipine 5mg','Cipla',3.50,320,'2028-12-31'),
('Atorvastatin 10mg','Sun Pharma',9.00,240,'2028-09-30'),
('Ecosprin 75mg','USV',2.00,600,'2029-02-28'),
('Clopidogrel 75mg','Lupin',6.80,220,'2028-08-31'),
('Insulin Injection','Novo Nordisk',550.00,80,'2027-12-31'),
('Vitamin D3 Capsule','Mankind',9.50,250,'2029-01-31'),
('Calcium Tablet','Cipla',5.00,300,'2029-04-30'),

('ORS Powder','FDC',22.00,150,'2028-06-30'),
('Electral Powder','FDC',25.00,180,'2028-11-30'),
('Benadryl Syrup','Johnson & Johnson',95.00,120,'2028-08-31'),
('Ascoril Syrup','Glenmark',110.00,140,'2028-12-31'),
('Cofsils Cough Syrup','Cipla',90.00,100,'2028-09-30'),
('Digene Gel','Abbott',145.00,110,'2028-10-31'),
('Gelusil Syrup','Pfizer',135.00,100,'2028-12-31'),
('Volini Spray','Sun Pharma',220.00,90,'2028-11-30'),
('Moov Cream','Reckitt',160.00,120,'2028-08-31'),
('Soframycin Cream','Sanofi',72.00,130,'2028-07-31'),

('Betadine Ointment','Win Medicare',95.00,120,'2028-09-30'),
('Burnol Cream','Dr. Morepen',82.00,100,'2028-10-31'),
('Eye Drop Ciplox','Cipla',58.00,150,'2028-12-31'),
('Refresh Tears','Allergan',180.00,90,'2028-08-31'),
('Ear Drop Otofree','Mankind',72.00,100,'2028-09-30'),
('Nasal Spray Otrivin','GSK',145.00,110,'2028-11-30'),
('Asthalin Inhaler','Cipla',185.00,95,'2028-12-31'),
('Budecort Inhaler','Cipla',295.00,70,'2028-10-31'),
('Diclofenac Injection','Abbott',28.00,200,'2028-07-31'),
('Ceftriaxone Injection','Pfizer',125.00,180,'2028-11-30'),

('Rabeprazole 20mg','Torrent Pharma',7.20,260,'2028-12-31'),
('Domperidone 10mg','Sun Pharma',3.90,320,'2028-09-30'),
('Loperamide 2mg','Cipla',2.80,280,'2028-10-31'),
('Ondansetron 4mg','Emcure',6.20,260,'2028-12-31'),
('Ibuprofen 400mg','Abbott',4.80,300,'2028-08-31'),
('Aceclofenac 100mg','Lupin',8.20,220,'2028-11-30'),
('Multivitamin Capsule','Zydus',5.50,350,'2029-02-28'),
('Iron Tablet','Cipla',3.20,300,'2029-01-31'),
('Folic Acid Tablet','Sun Pharma',2.40,350,'2029-03-31'),
('Zinc Tablet','Mankind',3.80,250,'2029-04-30');





SELECT
    appointment_id,
    patient_id,
    doctor_id,
    appointment_date
FROM appointments
ORDER BY appointment_date;


SELECT
    schedule_id,
    doctor_id,
    day_of_week
    start_time,
    end_time
FROM doctor_schedules
ORDER BY day_of_week, start_time;

SELECT appointment_id
FROM appointments
ORDER BY appointment_id;


INSERT INTO appointment_status_history
(
    appointment_id,
    old_status,
    new_status,
    changed_by,
    remarks
)
VALUES
(
'00c0ff4e-85ed-11f1-beb2-489ebde94b09',
NULL,
'BOOKED',
'3d1b0012-85e6-11f1-beb2-489ebde94b09',
'Appointment created'
),
(
'00c25ba7-85ed-11f1-beb2-489ebde94b09',
'BOOKED',
'COMPLETED',
'3d1acd2a-85e6-11f1-beb2-489ebde94b09',
'Consultation completed successfully'
),
(
'00c261a5-85ed-11f1-beb2-489ebde94b09',
'BOOKED',
'CANCELLED',
'3d1ad96d-85e6-11f1-beb2-489ebde94b09',
'Cancelled by patient'
),
(
'00c26563-85ed-11f1-beb2-489ebde94b09',
'BOOKED',
'NO_SHOW',
'3d1ae23a-85e6-11f1-beb2-489ebde94b09',
'Patient did not arrive'
),
(
'00c26834-85ed-11f1-beb2-489ebde94b09',
NULL,
'BOOKED',
'3d1af6b2-85e6-11f1-beb2-489ebde94b09',
'Appointment booked online'
),
(
'00c26c33-85ed-11f1-beb2-489ebde94b09',
'BOOKED',
'COMPLETED',
'3d1aea3d-85e6-11f1-beb2-489ebde94b09',
'Treatment completed successfully'
),
(
'00c26f24-85ed-11f1-beb2-489ebde94b09',
NULL,
'BOOKED',
'3d1ac5bd-85e6-11f1-beb2-489ebde94b09',
'Appointment booked by reception'
),
(
'00c2719d-85ed-11f1-beb2-489ebde94b09',
'BOOKED',
'CANCELLED',
'3d1ad21a-85e6-11f1-beb2-489ebde94b09',
'Doctor unavailable'
),
(
'00c27459-85ed-11f1-beb2-489ebde94b09',
'BOOKED',
'COMPLETED',
'3d1ae87a-85e6-11f1-beb2-489ebde94b09',
'Routine follow-up completed'
),
(
'00c27a68-85ed-11f1-beb2-489ebde94b09',
'BOOKED',
'NO_SHOW',
'3d1ae509-85e6-11f1-beb2-489ebde94b09',
'Patient absent without prior notice'
);


INSERT INTO prescriptions
(
    appointment_id,
    doctor_id,
    patient_id,
    prescription_date,
    notes
)
VALUES
-- 1
(
    '00c0ff4e-85ed-11f1-beb2-489ebde94b09',
    'fd74ec74-85e6-11f1-beb2-489ebde94b09',
    'da5e04bd-85e8-11f1-beb2-489ebde94b09',
    '2026-08-28 09:30:00',
    'High blood pressure. Reduce salt intake and monitor BP daily.'
),

-- 2
(
    '00c25ba7-85ed-11f1-beb2-489ebde94b09',
    'fd7510ef-85e6-11f1-beb2-489ebde94b09',
    'da5e1ce9-85e8-11f1-beb2-489ebde94b09',
    '2026-08-28 10:00:00',
    'Migraine symptoms. Avoid stress and maintain proper sleep.'
),

-- 3
(
    '00c261a5-85ed-11f1-beb2-489ebde94b09',
    'fd751a67-85e6-11f1-beb2-489ebde94b09',
    'da5e2118-85e8-11f1-beb2-489ebde94b09',
    '2026-08-28 10:30:00',
    'Routine health checkup. Continue current medications.'
),

-- 4
(
    '00c26563-85ed-11f1-beb2-489ebde94b09',
    'fd75220f-85e6-11f1-beb2-489ebde94b09',
    'da5e230e-85e8-11f1-beb2-489ebde94b09',
    '2026-08-28 11:00:00',
    'Skin allergy. Avoid dust exposure and use prescribed cream.'
),

-- 5
(
    '00c26834-85ed-11f1-beb2-489ebde94b09',
    'fd752a78-85e6-11f1-beb2-489ebde94b09',
    'da5e24da-85e8-11f1-beb2-489ebde94b09',
    '2026-08-28 11:30:00',
    'Joint pain. Physiotherapy recommended for two weeks.'
),

-- 6
(
    '00c26c33-85ed-11f1-beb2-489ebde94b09',
    'fd752df2-85e6-11f1-beb2-489ebde94b09',
    'da5e26ac-85e8-11f1-beb2-489ebde94b09',
    '2026-08-28 12:00:00',
    'Fever with viral infection. Drink plenty of fluids.'
),

-- 7
(
    '00c26f24-85ed-11f1-beb2-489ebde94b09',
    'fd75336d-85e6-11f1-beb2-489ebde94b09',
    'da5e285b-85e8-11f1-beb2-489ebde94b09',
    '2026-08-28 12:30:00',
    'Dental pain. Refer to dental specialist for further evaluation.'
),

-- 8
(
    '00c2719d-85ed-11f1-beb2-489ebde94b09',
    'fd753b73-85e6-11f1-beb2-489ebde94b09',
    'da5e29f8-85e8-11f1-beb2-489ebde94b09',
    '2026-08-28 13:00:00',
    'Diabetes follow-up. Continue insulin and monitor sugar levels.'
),

-- 9
(
    '00c27459-85ed-11f1-beb2-489ebde94b09',
    'fd753f56-85e6-11f1-beb2-489ebde94b09',
    'da5e2bf7-85e8-11f1-beb2-489ebde94b09',
    '2026-08-28 13:30:00',
    'Eye irritation. Use lubricating eye drops for seven days.'
),

-- 10
(
    '00c27a68-85ed-11f1-beb2-489ebde94b09',
    'fd7541f4-85e6-11f1-beb2-489ebde94b09',
    'da5e2d93-85e8-11f1-beb2-489ebde94b09',
    '2026-08-28 14:00:00',
    'Seasonal cold and cough. Take rest and complete medication course.'
);



INSERT INTO prescription_items
(
    prescription_id,
    medicine_id,
    quantity,
    duration_days,
    instructions
)
VALUES

-- Prescription 1
('49c922bb-85ee-11f1-beb2-489ebde94b09','b8464d8a-85eb-11f1-beb2-489ebde94b09',10,5,'Take 1 tablet twice daily after meals.'),
('49c922bb-85ee-11f1-beb2-489ebde94b09','b8469256-85eb-11f1-beb2-489ebde94b09',5,5,'Take 1 tablet at bedtime.'),

-- Prescription 2
('49c976fc-85ee-11f1-beb2-489ebde94b09','b8469469-85eb-11f1-beb2-489ebde94b09',14,7,'Take after breakfast.'),
('49c976fc-85ee-11f1-beb2-489ebde94b09','b84695da-85eb-11f1-beb2-489ebde94b09',7,7,'Take before sleeping.'),

-- Prescription 3
('49c97c07-85ee-11f1-beb2-489ebde94b09','b8469729-85eb-11f1-beb2-489ebde94b09',6,3,'Take after lunch.'),
('49c97c07-85ee-11f1-beb2-489ebde94b09','b846988d-85eb-11f1-beb2-489ebde94b09',6,3,'Drink plenty of water.'),

-- Prescription 4
('49c98040-85ee-11f1-beb2-489ebde94b09','b8469a35-85eb-11f1-beb2-489ebde94b09',10,5,'Take after meals.'),
('49c98040-85ee-11f1-beb2-489ebde94b09','b8469b50-85eb-11f1-beb2-489ebde94b09',10,5,'Apply as directed.'),

-- Prescription 5
('49c99639-85ee-11f1-beb2-489ebde94b09','b8469c6e-85eb-11f1-beb2-489ebde94b09',20,10,'Take morning and evening.'),
('49c99639-85ee-11f1-beb2-489ebde94b09','b8469d35-85eb-11f1-beb2-489ebde94b09',10,10,'Take after dinner.'),

-- Prescription 6
('49c99d7f-85ee-11f1-beb2-489ebde94b09','b8469df7-85eb-11f1-beb2-489ebde94b09',15,5,'Take every 8 hours.'),
('49c99d7f-85ee-11f1-beb2-489ebde94b09','b8469eb9-85eb-11f1-beb2-489ebde94b09',5,5,'Take before breakfast.'),

-- Prescription 7
('49c9a182-85ee-11f1-beb2-489ebde94b09','b846a03b-85eb-11f1-beb2-489ebde94b09',10,5,'Take after food.'),
('49c9a182-85ee-11f1-beb2-489ebde94b09','b846a147-85eb-11f1-beb2-489ebde94b09',10,5,'Avoid spicy food.'),

-- Prescription 8
('49c9a606-85ee-11f1-beb2-489ebde94b09','b846a2fc-85eb-11f1-beb2-489ebde94b09',14,7,'Take every morning.'),
('49c9a606-85ee-11f1-beb2-489ebde94b09','b846a3e0-85eb-11f1-beb2-489ebde94b09',14,7,'Take before meals.'),

-- Prescription 9
('49c9aa3d-85ee-11f1-beb2-489ebde94b09','b846a4a7-85eb-11f1-beb2-489ebde94b09',21,7,'Take three times a day.'),
('49c9aa3d-85ee-11f1-beb2-489ebde94b09','b846a573-85eb-11f1-beb2-489ebde94b09',7,7,'Apply twice daily.'),

-- Prescription 10
('49c9b0c2-85ee-11f1-beb2-489ebde94b09','b846a64c-85eb-11f1-beb2-489ebde94b09',10,5,'Take after breakfast.'),
('49c9b0c2-85ee-11f1-beb2-489ebde94b09','b846a789-85eb-11f1-beb2-489ebde94b09',5,5,'Take before bedtime.');



INSERT INTO bills
(
    appointment_id,
    patient_id,
    consultation_fee,
    medicine_charge,
    room_charge,
    tax_percentage,
    insurance_discount,
    total_amount,
    bill_date
)
VALUES

(
'00c0ff4e-85ed-11f1-beb2-489ebde94b09',
'da5e04bd-85e8-11f1-beb2-489ebde94b09',
800.00,
350.00,
0.00,
18.00,
100.00,
1257.00,
'2026-08-28 09:45:00'
),

(
'00c25ba7-85ed-11f1-beb2-489ebde94b09',
'da5e1ce9-85e8-11f1-beb2-489ebde94b09',
1000.00,
500.00,
0.00,
18.00,
200.00,
1570.00,
'2026-08-28 10:15:00'
),

(
'00c261a5-85ed-11f1-beb2-489ebde94b09',
'da5e2118-85e8-11f1-beb2-489ebde94b09',
700.00,
250.00,
0.00,
18.00,
50.00,
1071.00,
'2026-08-28 10:45:00'
),

(
'00c26563-85ed-11f1-beb2-489ebde94b09',
'da5e230e-85e8-11f1-beb2-489ebde94b09',
900.00,
600.00,
1500.00,
18.00,
500.00,
3040.00,
'2026-08-28 11:15:00'
),

(
'00c26834-85ed-11f1-beb2-489ebde94b09',
'da5e24da-85e8-11f1-beb2-489ebde94b09',
1200.00,
450.00,
2000.00,
18.00,
700.00,
3477.00,
'2026-08-28 11:45:00'
),

(
'00c26c33-85ed-11f1-beb2-489ebde94b09',
'da5e26ac-85e8-11f1-beb2-489ebde94b09',
800.00,
300.00,
0.00,
18.00,
100.00,
1198.00,
'2026-08-28 12:15:00'
),

(
'00c26f24-85ed-11f1-beb2-489ebde94b09',
'da5e285b-85e8-11f1-beb2-489ebde94b09',
950.00,
550.00,
2500.00,
18.00,
400.00,
4329.00,
'2026-08-28 12:45:00'
),

(
'00c2719d-85ed-11f1-beb2-489ebde94b09',
'da5e29f8-85e8-11f1-beb2-489ebde94b09',
1000.00,
400.00,
0.00,
18.00,
150.00,
1502.00,
'2026-08-28 13:15:00'
),

(
'00c27459-85ed-11f1-beb2-489ebde94b09',
'da5e2bf7-85e8-11f1-beb2-489ebde94b09',
850.00,
350.00,
1000.00,
18.00,
250.00,
2332.00,
'2026-08-28 13:45:00'
),

(
'00c27a68-85ed-11f1-beb2-489ebde94b09',
'da5e2d93-85e8-11f1-beb2-489ebde94b09',
750.00,
200.00,
0.00,
18.00,
50.00,
1071.00,
'2026-08-28 14:15:00'
);



SELECT bill_id, appointment_id, total_amount
FROM bills;

INSERT INTO payments
(
    bill_id,
    payment_method,
    payment_status,
    amount,
    payment_date
)
VALUES
(
    '023ef08d-85ef-11f1-beb2-489ebde94b09',
    'UPI',
    'SUCCESS',
    1257.00,
    '2026-08-28 10:00:00'
),
(
    '023f13f4-85ef-11f1-beb2-489ebde94b09',
    'CARD',
    'SUCCESS',
    1570.00,
    '2026-08-28 10:30:00'
),
(
    '023f16c9-85ef-11f1-beb2-489ebde94b09',
    'CASH',
    'SUCCESS',
    1071.00,
    '2026-08-28 11:00:00'
),
(
    '023f18e0-85ef-11f1-beb2-489ebde94b09',
    'CARD',
    'SUCCESS',
    3040.00,
    '2026-08-28 11:30:00'
),
(
    '023f1ab9-85ef-11f1-beb2-489ebde94b09',
    'UPI',
    'FAILED',
    3477.00,
    '2026-08-28 12:00:00'
),
(
    '023f1cb8-85ef-11f1-beb2-489ebde94b09',
    'UPI',
    'SUCCESS',
    1198.00,
    '2026-08-28 12:30:00'
),
(
    '023f1e73-85ef-11f1-beb2-489ebde94b09',
    'CARD',
    'SUCCESS',
    4329.00,
    '2026-08-28 13:00:00'
),
(
    '023f203d-85ef-11f1-beb2-489ebde94b09',
    'CASH',
    'SUCCESS',
    1502.00,
    '2026-08-28 13:30:00'
),
(
    '023f2232-85ef-11f1-beb2-489ebde94b09',
    'UPI',
    'FAILED',
    2332.00,
    '2026-08-28 14:00:00'
),
(
    '023f23d6-85ef-11f1-beb2-489ebde94b09',
    'CARD',
    'SUCCESS',
    1071.00,
    '2026-08-28 14:30:00'
);


INSERT INTO patient_medical_records
(
    patient_id,
    appointment_id,
    admission_id,
    prescription_id,
    bill_id,
    payment_id,
    rating_id
)
VALUES
(
    'fcc2297e-85e8-11f1-beb2-489ebde94b09',
    '00c0ff4e-85ed-11f1-beb2-489ebde94b09',
    '7fc4a1c0-85eb-11f1-beb2-489ebde94b09',
    '49c922bb-85ee-11f1-beb2-489ebde94b09',
    '023ef08d-85ef-11f1-beb2-489ebde94b09',
    (SELECT payment_id FROM payments WHERE bill_id='023ef08d-85ef-11f1-beb2-489ebde94b09'),
    NULL
),
(
    'fcc265cf-85e8-11f1-beb2-489ebde94b09',
    '00c25ba7-85ed-11f1-beb2-489ebde94b09',
    '7fc4f70c-85eb-11f1-beb2-489ebde94b09',
    '49c976fc-85ee-11f1-beb2-489ebde94b09',
    '023f13f4-85ef-11f1-beb2-489ebde94b09',
    (SELECT payment_id FROM payments WHERE bill_id='023f13f4-85ef-11f1-beb2-489ebde94b09'),
    NULL
),
(
    'da5e2118-85e8-11f1-beb2-489ebde94b09',
    '00c261a5-85ed-11f1-beb2-489ebde94b09',
    '7fc4fbbe-85eb-11f1-beb2-489ebde94b09',
    '49c97c07-85ee-11f1-beb2-489ebde94b09',
    '023f16c9-85ef-11f1-beb2-489ebde94b09',
    (SELECT payment_id FROM payments WHERE bill_id='023f16c9-85ef-11f1-beb2-489ebde94b09'),
    NULL
),
(
    'da5e3162-85e8-11f1-beb2-489ebde94b09',
    '00c26563-85ed-11f1-beb2-489ebde94b09',
    '7fc4fde9-85eb-11f1-beb2-489ebde94b09',
    '49c98040-85ee-11f1-beb2-489ebde94b09',
    '023f18e0-85ef-11f1-beb2-489ebde94b09',
    (SELECT payment_id FROM payments WHERE bill_id='023f18e0-85ef-11f1-beb2-489ebde94b09'),
    NULL
),
(
    'fcc281d6-85e8-11f1-beb2-489ebde94b09',
    '00c26834-85ed-11f1-beb2-489ebde94b09',
    '7fc5023d-85eb-11f1-beb2-489ebde94b09',
    '49c99639-85ee-11f1-beb2-489ebde94b09',
    '023f1ab9-85ef-11f1-beb2-489ebde94b09',
    (SELECT payment_id FROM payments WHERE bill_id='023f1ab9-85ef-11f1-beb2-489ebde94b09'),
    NULL
),
(
    'da5e3f06-85e8-11f1-beb2-489ebde94b09',
    '00c26c33-85ed-11f1-beb2-489ebde94b09',
    '7fc50705-85eb-11f1-beb2-489ebde94b09',
    '49c99d7f-85ee-11f1-beb2-489ebde94b09',
    '023f1cb8-85ef-11f1-beb2-489ebde94b09',
    (SELECT payment_id FROM payments WHERE bill_id='023f1cb8-85ef-11f1-beb2-489ebde94b09'),
    NULL
),
(
    'fcc25491-85e8-11f1-beb2-489ebde94b09',
    '00c26f24-85ed-11f1-beb2-489ebde94b09',
    '7fc50a9d-85eb-11f1-beb2-489ebde94b09',
    '49c9a182-85ee-11f1-beb2-489ebde94b09',
    '023f1e73-85ef-11f1-beb2-489ebde94b09',
    (SELECT payment_id FROM payments WHERE bill_id='023f1e73-85ef-11f1-beb2-489ebde94b09'),
    NULL
),
(
    'fcc23cf4-85e8-11f1-beb2-489ebde94b09',
    '00c2719d-85ed-11f1-beb2-489ebde94b09',
    '7fc50d65-85eb-11f1-beb2-489ebde94b09',
    '49c9a606-85ee-11f1-beb2-489ebde94b09',
    '023f203d-85ef-11f1-beb2-489ebde94b09',
    (SELECT payment_id FROM payments WHERE bill_id='023f203d-85ef-11f1-beb2-489ebde94b09'),
    NULL
),
(
    'fcc2703a-85e8-11f1-beb2-489ebde94b09',
    '00c27459-85ed-11f1-beb2-489ebde94b09',
    '7fc51084-85eb-11f1-beb2-489ebde94b09',
    '49c9aa3d-85ee-11f1-beb2-489ebde94b09',
    '023f2232-85ef-11f1-beb2-489ebde94b09',
    (SELECT payment_id FROM payments WHERE bill_id='023f2232-85ef-11f1-beb2-489ebde94b09'),
    NULL
),
(
    'da5e33a8-85e8-11f1-beb2-489ebde94b09',
    '00c27a68-85ed-11f1-beb2-489ebde94b09',
    '7fc5135d-85eb-11f1-beb2-489ebde94b09',
    '49c9b0c2-85ee-11f1-beb2-489ebde94b09',
    '023f23d6-85ef-11f1-beb2-489ebde94b09',
    (SELECT payment_id FROM payments WHERE bill_id='023f23d6-85ef-11f1-beb2-489ebde94b09'),
    NULL
);