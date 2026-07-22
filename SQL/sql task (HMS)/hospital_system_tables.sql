CREATE DATABASE hospital_system_db;

USE hospital_system_db;

SELECT 
    payment_date,
    amount
FROM payments;

CREATE TABLE roles
(
    role_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    role_name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL DEFAULT NULL,
    created_by CHAR(36) NULL,
    updated_by CHAR(36) NULL,
    deleted_by CHAR(36) NULL,
    is_deleted BOOLEAN DEFAULT FALSE
);


CREATE TABLE users
(
    user_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    role_id CHAR(36) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    last_login DATETIME NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL DEFAULT NULL,
    created_by CHAR(36) NULL,
    updated_by CHAR(36) NULL,
    deleted_by CHAR(36) NULL,

    CONSTRAINT fk_users_role
        FOREIGN KEY (role_id)
        REFERENCES roles(role_id)
        ON DELETE RESTRICT
);

select * from users;


ALTER TABLE roles
ADD CONSTRAINT fk_roles_created_by
FOREIGN KEY (created_by)
REFERENCES users(user_id)
ON DELETE SET NULL;

ALTER TABLE roles
ADD CONSTRAINT fk_roles_updated_by
FOREIGN KEY (updated_by)
REFERENCES users(user_id)
ON DELETE SET NULL;

ALTER TABLE roles
ADD CONSTRAINT fk_roles_deleted_by
FOREIGN KEY (deleted_by)
REFERENCES users(user_id)
ON DELETE SET NULL;


ALTER TABLE users
ADD CONSTRAINT fk_users_created_by
FOREIGN KEY (created_by)
REFERENCES users(user_id)
ON DELETE SET NULL;

ALTER TABLE users
ADD CONSTRAINT fk_users_updated_by
FOREIGN KEY (updated_by)
REFERENCES users(user_id)
ON DELETE SET NULL;

ALTER TABLE users
ADD CONSTRAINT fk_users_deleted_by
FOREIGN KEY (deleted_by)
REFERENCES users(user_id)
ON DELETE SET NULL;



CREATE TABLE patients
(
    patient_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL UNIQUE,
    date_of_birth DATE NOT NULL,
    gender ENUM ( 'MALE', 'FEMALE') NOT NULL,
    blood_group CHAR(3),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL DEFAULT NULL,
    created_by CHAR(36) NULL,
    updated_by CHAR(36) NULL,
    deleted_by CHAR(36) NULL,
    is_deleted BOOLEAN DEFAULT FALSE,

    CONSTRAINT fk_patients_created_by
        FOREIGN KEY (created_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_patients_updated_by
        FOREIGN KEY (updated_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_patients_deleted_by
        FOREIGN KEY (deleted_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL
);

select * from patients;

CREATE TABLE patient_addresses
(
    address_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    patient_id CHAR(36) NOT NULL,
    address_type ENUM ( 'HOME', 'OFFICE', 'TEMPORARY') NOT NULL,
    address_line_1 VARCHAR(255) NOT NULL,
    address_line_2 VARCHAR(255),
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    is_primary BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL DEFAULT NULL,
    created_by CHAR(36) NULL,
    updated_by CHAR(36) NULL,
    deleted_by CHAR(36) NULL,
    is_deleted BOOLEAN DEFAULT FALSE,

    CONSTRAINT fk_patient_addresses_patient
        FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_patient_addresses_created_by
        FOREIGN KEY (created_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_patient_addresses_updated_by
        FOREIGN KEY (updated_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_patient_addresses_deleted_by
        FOREIGN KEY (deleted_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL
);


CREATE TABLE insurance_policies
(
    policy_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    patient_id CHAR(36) NOT NULL,
    provider_name VARCHAR(150) NOT NULL,
    company_name VARCHAR(150),
    policy_number VARCHAR(100) NOT NULL UNIQUE,
    coverage_percentage DECIMAL(5,2) NOT NULL CHECK ( coverage_percentage BETWEEN 0 AND 100),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL DEFAULT NULL,
    created_by CHAR(36) NULL,
    updated_by CHAR(36) NULL,
    deleted_by CHAR(36) NULL,
    is_deleted BOOLEAN DEFAULT FALSE,

    CONSTRAINT fk_insurance_patient
        FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_insurance_created_by
        FOREIGN KEY (created_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_insurance_updated_by
        FOREIGN KEY (updated_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_insurance_deleted_by
        FOREIGN KEY (deleted_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL
);


CREATE TABLE departments
(
    department_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    department_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    head_doctor_id CHAR(36) NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL DEFAULT NULL,
    created_by CHAR(36) NULL,
    updated_by CHAR(36) NULL,
    deleted_by CHAR(36) NULL,

    CONSTRAINT fk_departments_created_by
        FOREIGN KEY (created_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_departments_updated_by
        FOREIGN KEY (updated_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_departments_deleted_by
        FOREIGN KEY (deleted_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL
);


CREATE TABLE doctors
(
    doctor_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    user_id CHAR(36) NOT NULL UNIQUE,
    department_id CHAR(36) NOT NULL,
    qualification VARCHAR(150) NOT NULL,
    experience_years INT DEFAULT 0,
    consultation_fee DECIMAL(10,2) NOT NULL,
    joining_date DATE NOT NULL,
    is_available BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL DEFAULT NULL,
    created_by CHAR(36) NULL,
    updated_by CHAR(36) NULL,
    deleted_by CHAR(36) NULL,

    CONSTRAINT chk_consultation_fee
        CHECK (consultation_fee >= 0),

    CONSTRAINT chk_experience
        CHECK (experience_years >= 0),

    CONSTRAINT fk_doctors_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_doctors_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_doctors_created_by
        FOREIGN KEY (created_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_doctors_updated_by
        FOREIGN KEY (updated_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_doctors_deleted_by
        FOREIGN KEY (deleted_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL
);

select * from doctors;

ALTER TABLE departments
ADD CONSTRAINT fk_departments_head_doctor
FOREIGN KEY (head_doctor_id)
REFERENCES doctors(doctor_id)
ON DELETE SET NULL;


CREATE TABLE specializations
(
    specialization_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    specialization_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL DEFAULT NULL,
    created_by CHAR(36) NULL,
    updated_by CHAR(36) NULL,
    deleted_by CHAR(36) NULL,

    CONSTRAINT fk_specializations_created_by
        FOREIGN KEY (created_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_specializations_updated_by
        FOREIGN KEY (updated_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_specializations_deleted_by
        FOREIGN KEY (deleted_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL
);

select * from specializations;

select * from doctor_specializations;

CREATE TABLE doctor_specializations
(
    doctor_specialization_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    doctor_id CHAR(36) NOT NULL,
    specialization_id CHAR(36) NOT NULL,
    CONSTRAINT uq_doctor_specialization
        UNIQUE ( doctor_id, specialization_id ),

    CONSTRAINT fk_doctor_specializations_doctor
        FOREIGN KEY (doctor_id)
        REFERENCES doctors(doctor_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_doctor_specializations_specialization
        FOREIGN KEY (specialization_id)
        REFERENCES specializations(specialization_id)
        ON DELETE RESTRICT
);



CREATE TABLE doctor_schedules
(
    schedule_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    doctor_id CHAR(36) NOT NULL,
    day_of_week ENUM
    (
        'MONDAY',
        'TUESDAY',
        'WEDNESDAY',
        'THURSDAY',
        'FRIDAY',
        'SATURDAY',
        'SUNDAY'
    ) NOT NULL,

    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    slot_duration INT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL DEFAULT NULL,
    created_by CHAR(36) NULL,
    updated_by CHAR(36) NULL,
    deleted_by CHAR(36) NULL,

    CONSTRAINT fk_doctor_schedule_doctor
        FOREIGN KEY (doctor_id)
        REFERENCES doctors(doctor_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_doctor_schedule_created_by
        FOREIGN KEY (created_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_doctor_schedule_updated_by
        FOREIGN KEY (updated_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_doctor_schedule_deleted_by
        FOREIGN KEY (deleted_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL
);

select * from doctor_schedules;

CREATE TABLE appointments 
(
    appointment_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    patient_id CHAR(36) NOT NULL,
    doctor_id CHAR(36) NOT NULL,
    schedule_id CHAR(36) NULL,
    appointment_date DATE NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    appointment_status ENUM
    (
        'BOOKED',
        'COMPLETED',
        'CANCELLED',
        'NO_SHOW'
    ) DEFAULT 'BOOKED',

    booked_by CHAR(36) NOT NULL,
    remarks TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL DEFAULT NULL,
    created_by CHAR(36) NULL,
    updated_by CHAR(36) NULL,
    deleted_by CHAR(36) NULL,
    is_deleted BOOLEAN DEFAULT FALSE,

    CONSTRAINT chk_appointment_time
        CHECK (end_time > start_time),

    # Prevents one doctor from being booked twice in the same slot 
    CONSTRAINT uq_doctor_slot
        UNIQUE
        (
            doctor_id,
            appointment_date,
            start_time
        ),

    CONSTRAINT fk_appointments_patient
        FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_appointments_doctor
        FOREIGN KEY (doctor_id)
        REFERENCES doctors(doctor_id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_appointments_schedule
        FOREIGN KEY (schedule_id)
        REFERENCES doctor_schedules(schedule_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_appointments_booked_by
        FOREIGN KEY (booked_by)
        REFERENCES users(user_id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_appointments_created_by
        FOREIGN KEY (created_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_appointments_updated_by
        FOREIGN KEY (updated_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_appointments_deleted_by
        FOREIGN KEY (deleted_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL
);

ALTER TABLE appointments 
MODIFY COLUMN appointment_status ENUM('BOOKED',
        'COMPLETED',
        'CANCELLED',
        'NO_SHOW', 'WAIT') NOT NULL DEFAULT 'BOOKED';
        
        
ALTER TABLE appointments
DROP FOREIGN KEY fk_appointments_booked_by;

ALTER TABLE appointments
DROP COLUMN booked_by;

select * from appointments;


CREATE TABLE appointment_status_history
(
    history_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    appointment_id CHAR(36) NOT NULL,
    old_status ENUM
    (
        'BOOKED',
        'COMPLETED',
        'CANCELLED',
        'NO_SHOW'
    ),
    new_status ENUM
    (
        'BOOKED',
        'COMPLETED',
        'CANCELLED',
        'NO_SHOW'
    ) NOT NULL,

    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    changed_by CHAR(36) NOT NULL,
    remarks TEXT,

    CONSTRAINT fk_status_history_appointment
        FOREIGN KEY (appointment_id)
        REFERENCES appointments(appointment_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_status_history_changed_by
        FOREIGN KEY (changed_by)
        REFERENCES users(user_id)
        ON DELETE RESTRICT
);


CREATE TABLE room_types
(
    room_type_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    room_type_name VARCHAR(50) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL DEFAULT NULL,
    created_by CHAR(36) NULL,
    updated_by CHAR(36) NULL,
    deleted_by CHAR(36) NULL,
    is_deleted BOOLEAN DEFAULT FALSE,

    CONSTRAINT fk_room_types_created_by
        FOREIGN KEY (created_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_room_types_updated_by
        FOREIGN KEY (updated_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_room_types_deleted_by
        FOREIGN KEY (deleted_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL
);

select * from room_types;

	CREATE TABLE rooms
	(
		room_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
		room_number VARCHAR(20) NOT NULL UNIQUE,
		room_type_id CHAR(36) NOT NULL,
		floor_number INT,
		daily_charge DECIMAL(10,2) NOT NULL,
		is_available BOOLEAN DEFAULT TRUE,
		is_active BOOLEAN DEFAULT TRUE,
		created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
		deleted_at TIMESTAMP NULL DEFAULT NULL,
		created_by CHAR(36) NULL,
		updated_by CHAR(36) NULL,
		deleted_by CHAR(36) NULL,
		is_deleted BOOLEAN DEFAULT FALSE,

		CONSTRAINT fk_rooms_room_type
			FOREIGN KEY (room_type_id)
			REFERENCES room_types(room_type_id)
			ON DELETE RESTRICT,

		CONSTRAINT fk_rooms_created_by
			FOREIGN KEY (created_by)
			REFERENCES users(user_id)
			ON DELETE SET NULL,

		CONSTRAINT fk_rooms_updated_by
			FOREIGN KEY (updated_by)
			REFERENCES users(user_id)
			ON DELETE SET NULL,

		CONSTRAINT fk_rooms_deleted_by
			FOREIGN KEY (deleted_by)
			REFERENCES users(user_id)
			ON DELETE SET NULL
	);



CREATE TABLE admissions
(
    admission_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    patient_id CHAR(36) NOT NULL,
    room_id CHAR(36) NOT NULL,
    admitted_by CHAR(36) NOT NULL,
    admit_date DATETIME NOT NULL,
    discharge_date DATETIME NULL,
    admission_reason TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL DEFAULT NULL,
    created_by CHAR(36) NULL,
    updated_by CHAR(36) NULL,
    deleted_by CHAR(36) NULL,
    is_deleted BOOLEAN DEFAULT FALSE,

    CONSTRAINT fk_admissions_patient
        FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_admissions_room
        FOREIGN KEY (room_id)
        REFERENCES rooms(room_id)
        ON DELETE RESTRICT,
        
    CONSTRAINT fk_admissions_admitted_by
        FOREIGN KEY (admitted_by)
        REFERENCES users(user_id)
        ON DELETE RESTRICT,
        
    CONSTRAINT fk_admissions_created_by
        FOREIGN KEY (created_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,
        
    CONSTRAINT fk_admissions_updated_by
        FOREIGN KEY (updated_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_admissions_deleted_by
        FOREIGN KEY (deleted_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL
);

ALTER TABLE admissions
ADD CONSTRAINT chk_admission_dates
CHECK
(
    discharge_date IS NULL
    OR discharge_date >= admit_date
);


	CREATE TABLE medicines
	(
		medicine_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
		medicine_name VARCHAR(150) NOT NULL UNIQUE,
		manufacturer VARCHAR(150),
		unit_price DECIMAL(10,2) NOT NULL CHECK(unit_price >= 0),
		quantity INT NOT NULL CHECK(quantity >= 0),
		expiry_date DATE NULL,
		created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
		updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
		deleted_at TIMESTAMP NULL DEFAULT NULL,
		created_by CHAR(36) NULL,
		updated_by CHAR(36) NULL,
		deleted_by CHAR(36) NULL,
		is_deleted BOOLEAN DEFAULT FALSE,

		CONSTRAINT fk_medicines_created_by
			FOREIGN KEY(created_by)
			REFERENCES users(user_id)
			ON DELETE SET NULL,

		CONSTRAINT fk_medicines_updated_by
			FOREIGN KEY(updated_by)
			REFERENCES users(user_id)
			ON DELETE SET NULL,

		CONSTRAINT fk_medicines_deleted_by
			FOREIGN KEY(deleted_by)
			REFERENCES users(user_id)
			ON DELETE SET NULL
	);



CREATE TABLE prescriptions
(
    prescription_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    appointment_id CHAR(36) NOT NULL UNIQUE,
    doctor_id CHAR(36) NOT NULL,
    patient_id CHAR(36) NOT NULL,
	prescription_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL DEFAULT NULL,
    created_by CHAR(36) NULL,
    updated_by CHAR(36) NULL,
    deleted_by CHAR(36) NULL,
    is_deleted BOOLEAN DEFAULT FALSE,

    CONSTRAINT fk_prescriptions_appointment
        FOREIGN KEY(appointment_id)
        REFERENCES appointments(appointment_id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_prescriptions_doctor
        FOREIGN KEY(doctor_id)
        REFERENCES doctors(doctor_id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_prescriptions_patient
        FOREIGN KEY(patient_id)
        REFERENCES patients(patient_id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_prescriptions_created_by
        FOREIGN KEY(created_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,
        
    CONSTRAINT fk_prescriptions_updated_by
        FOREIGN KEY(updated_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_prescriptions_deleted_by
        FOREIGN KEY(deleted_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL
);


CREATE TABLE prescription_items
(
    prescription_item_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    prescription_id CHAR(36) NOT NULL,
    medicine_id CHAR(36) NOT NULL,
    quantity INT NOT NULL,
    duration_days INT NULL,
    instructions TEXT,

    CONSTRAINT chk_prescription_quantity CHECK(quantity > 0),				
    CONSTRAINT chk_duration_days
        CHECK
        (
            duration_days IS NULL
            OR duration_days > 0
        ),


    CONSTRAINT fk_prescription_items_prescription
        FOREIGN KEY(prescription_id)
        REFERENCES prescriptions(prescription_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_prescription_items_medicine
        FOREIGN KEY(medicine_id)
        REFERENCES medicines(medicine_id)
        ON DELETE RESTRICT
);


CREATE TABLE bills
(
    bill_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    appointment_id CHAR(36) NOT NULL UNIQUE,
    patient_id CHAR(36) NOT NULL,
    consultation_fee DECIMAL(10,2) NOT NULL,
    medicine_charge DECIMAL(10,2) DEFAULT 0,
    room_charge DECIMAL(10,2) DEFAULT 0,
    tax_percentage DECIMAL(5,2) DEFAULT 18.00,
    insurance_discount DECIMAL(10,2) DEFAULT 0,
    total_amount DECIMAL(12,2) NOT NULL,
    bill_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL DEFAULT NULL,
    created_by CHAR(36) NULL,
    updated_by CHAR(36) NULL,
    deleted_by CHAR(36) NULL,
    is_deleted BOOLEAN DEFAULT FALSE,

    CONSTRAINT chk_consultation_fee_bill
        CHECK(consultation_fee >= 0),

    CONSTRAINT chk_medicine_charge_bill
        CHECK(medicine_charge >= 0),

    CONSTRAINT chk_room_charge_bill
        CHECK(room_charge >= 0),
        
    CONSTRAINT chk_tax_percentage_bill
        CHECK(tax_percentage >= 0),

    CONSTRAINT chk_insurance_discount
        CHECK(insurance_discount >= 0),

    CONSTRAINT chk_total_amount_bill
        CHECK(total_amount >= 0),

    CONSTRAINT fk_bills_appointment
        FOREIGN KEY(appointment_id)
        REFERENCES appointments(appointment_id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_bills_patient
        FOREIGN KEY(patient_id)
        REFERENCES patients(patient_id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_bills_created_by
        FOREIGN KEY(created_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_bills_updated_by
        FOREIGN KEY(updated_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_bills_deleted_by
        FOREIGN KEY(deleted_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL
);


CREATE TABLE payments
(
    payment_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    bill_id CHAR(36) NOT NULL,
    payment_method ENUM
    (
        'UPI',
        'CARD',
        'CASH'
    ) NOT NULL,
    payment_status ENUM
    (
        'SUCCESS',
        'FAILED'
    ) NOT NULL,
	amount DECIMAL(12,2) NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL DEFAULT NULL,
	created_by CHAR(36) NULL,
    updated_by CHAR(36) NULL,
    deleted_by CHAR(36) NULL,
    is_deleted BOOLEAN DEFAULT FALSE,

    CONSTRAINT chk_payment_amount
        CHECK(amount > 0),

    CONSTRAINT fk_payments_bill
        FOREIGN KEY(bill_id)
        REFERENCES bills(bill_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_payments_created_by
        FOREIGN KEY(created_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

	CONSTRAINT fk_payments_updated_by
        FOREIGN KEY(updated_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_payments_deleted_by
        FOREIGN KEY(deleted_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL
);



CREATE TABLE patient_ratings
(
    rating_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    appointment_id CHAR(36) NOT NULL UNIQUE,
    patient_id CHAR(36) NOT NULL,
    doctor_id CHAR(36) NOT NULL,
    rating TINYINT NOT NULL CHECK ( rating BETWEEN 1 AND 5),
    review TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP NULL DEFAULT NULL,
    created_by CHAR(36) NULL,
    updated_by CHAR(36) NULL,
    deleted_by CHAR(36) NULL,
    is_deleted BOOLEAN DEFAULT FALSE,
 
    CONSTRAINT fk_patient_ratings_appointment
        FOREIGN KEY(appointment_id)
        REFERENCES appointments(appointment_id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_patient_ratings_patient
        FOREIGN KEY(patient_id)
        REFERENCES patients(patient_id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_patient_ratings_doctor
        FOREIGN KEY(doctor_id)
        REFERENCES doctors(doctor_id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_patient_ratings_created_by
        FOREIGN KEY(created_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_patient_ratings_updated_by
        FOREIGN KEY(updated_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL,

    CONSTRAINT fk_patient_ratings_deleted_by
        FOREIGN KEY(deleted_by)
        REFERENCES users(user_id)
        ON DELETE SET NULL
);

select * from patients;


CREATE TABLE patient_medical_records
(
    record_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    patient_id CHAR(36) NOT NULL,
    appointment_id CHAR(36) NULL,
    admission_id CHAR(36) NULL,
    prescription_id CHAR(36) NULL,
    bill_id CHAR(36) NULL,
    payment_id CHAR(36) NULL,
    rating_id CHAR(36) NULL,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_pmr_patient
        FOREIGN KEY(patient_id)
        REFERENCES patients(patient_id),

    CONSTRAINT fk_pmr_appointment
        FOREIGN KEY(appointment_id)
        REFERENCES appointments(appointment_id),

    CONSTRAINT fk_pmr_admission
        FOREIGN KEY(admission_id)
        REFERENCES admissions(admission_id),

    CONSTRAINT fk_pmr_prescription
        FOREIGN KEY(prescription_id)
        REFERENCES prescriptions(prescription_id),

    CONSTRAINT fk_pmr_bill
        FOREIGN KEY(bill_id)
        REFERENCES bills(bill_id),

    CONSTRAINT fk_pmr_payment
        FOREIGN KEY(payment_id)
        REFERENCES payments(payment_id),

    CONSTRAINT fk_pmr_rating
        FOREIGN KEY(rating_id)
        REFERENCES patient_ratings(rating_id)
);


CREATE TABLE permissions
(
    permission_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    permission_code VARCHAR(100) UNIQUE NOT NULL,
    permission_name VARCHAR(100) NOT NULL,
    description TEXT
);

INSERT INTO permissions
(permission_code, permission_name)
VALUES
('PATIENT_VIEW', 'View Patients'),
('PATIENT_CREATE', 'Create Patients'),
('PATIENT_UPDATE', 'Update Patients'),
('APPOINTMENT_BOOK', 'Book Appointment'),
('PRESCRIPTION_CREATE', 'Create Prescription'),
('BILL_CREATE', 'Create Bill'),
('PAYMENT_PROCESS', 'Process Payment'),
('USER_MANAGE', 'Manage Users');


CREATE TABLE role_permissions
(
    role_permission_id CHAR(36) PRIMARY KEY DEFAULT (UUID()),
    role_id CHAR(36) NOT NULL,
    permission_id CHAR(36) NOT NULL,

    CONSTRAINT fk_role_permissions_role
        FOREIGN KEY (role_id)
        REFERENCES roles(role_id),

    CONSTRAINT fk_role_permissions_permission
        FOREIGN KEY (permission_id)
        REFERENCES permissions(permission_id),

    UNIQUE(role_id, permission_id)
);


select medicine_id from medicines;
select prescription_id from prescriptions;





