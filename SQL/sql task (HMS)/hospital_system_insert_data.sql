USE hospital_system_db;

# task : 3

# Task 3.1 - a consultation fee below zero

INSERT INTO doctors ( user_id, department_id, qualification, experience_years, consultation_fee, joining_date)
VALUES ( 'USER_UUID_HERE', 'DEPARTMENT_UUID_HERE', 'MBBS', 5, -500, '2026-01-01');

# Task 3.2 - a medicine stock below zero

INSERT INTO medicines ( medicine_name, manufacturer, unit_price, quantity, expiry_date )
VALUES ( 'Paracetamol', 'Cipla', 50, -10, '2027-01-01' );

# Task 3.3  an appointment stage that isn't one of the allowed ones

INSERT INTO appointments ( patient_id, doctor_id, appointment_date, start_time, end_time, appointment_status, booked_by )
VALUES ( 'PATIENT_UUID', 'DOCTOR_UUID', '2026-08-01','10:00:00','10:30:00','PENDING','USER_UUID');

# Task 3.4 a discharge date that comes before the admit date

INSERT INTO admissions ( patient_id, room_id, admitted_by, admit_date, discharge_date, admission_reason)
VALUES ('PATIENT_UUID','ROOM_UUID','USER_UUID','2026-08-10 10:00:00','2026-08-09 10:00:00','Fever');

# --------------------------------------------------------------------------------------------------------------------

# task 4 : 

INSERT INTO appointments
(
    patient_id,
    doctor_id,
    schedule_id,
    appointment_date,
    start_time,
    end_time,
    appointment_status,
    remarks,
    created_by
)
VALUES

(
    '37709f18-855c-11f1-beb2-489ebde94b09',
    '033e9ed2-855d-11f1-beb2-489ebde94b09',
    '3b0a3187-855e-11f1-beb2-489ebde94b09',
    '2026-10-23',
    '09:00:00',
    '09:30:00',
    'BOOKED',
    'Regular health checkup',
    '2f5f00ff-855c-11f1-beb2-489ebde94b09'
);

INSERT INTO appointments
(
    patient_id,
    doctor_id,
    schedule_id,
    appointment_date,
    start_time,
    end_time,
    appointment_status,
    remarks,
    created_by
)
VALUES

(
    '37709f18-855c-11f1-beb2-489ebde94b09',
    '033e9ed2-855d-11f1-beb2-489ebde94b09',
    '3b0a3187-855e-11f1-beb2-489ebde94b09',
    '2026-10-23',
    '09:00:00',
    '09:30:00',
    'BOOKED',
    'Regular health checkup',
    '2f5f00ff-855c-11f1-beb2-489ebde94b09'
);


select * from appointments;
select * from patients;
select * from doctors;
select * from doctor_schedules;
select * from users;


# task : 5 

# Task 7.1 - Appointment Status History Trigger

DELIMITER $$

CREATE TRIGGER trg_appointment_status_history
AFTER UPDATE ON appointments FOR EACH ROW
BEGIN

    IF OLD.appointment_status <> NEW.appointment_status THEN

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
            NEW.appointment_id,
            OLD.appointment_status,
            NEW.appointment_status,
            NEW.updated_by,
            'Status changed automatically'
        );

    END IF;

END$$

DELIMITER ;



SELECT * FROM appointments;

select * from users;


UPDATE appointments
SET 
appointment_status='COMPLETED',
updated_by='16dd9593-85ad-11f1-beb2-489ebde94b09'
WHERE appointment_id='8c5fabb8-85a4-11f1-beb2-489ebde94b09';

SELECT * FROM appointment_status_history;


# Task 7.2 - Never allow medicine stock below zero

DELIMITER $$

CREATE TRIGGER trg_prevent_negative_stock
BEFORE UPDATE ON medicines
FOR EACH ROW
BEGIN

    IF NEW.quantity < 0 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'Medicine stock cannot be negative';

    END IF;

END$$

DELIMITER ;


# Task 7.3 - Automatically reduce medicine stock after prescription

DELIMITER $$

CREATE TRIGGER trg_reduce_medicine_stock
AFTER INSERT ON prescription_items FOR EACH ROW
BEGIN

    UPDATE medicines
    SET quantity = quantity - NEW.quantity
    WHERE medicine_id = NEW.medicine_id;

END$$

DELIMITER ;

# temp ( Final Trigger) 

DROP TRIGGER trg_reduce_medicine_stock;

DELIMITER $$

CREATE TRIGGER trg_reduce_medicine_stock
BEFORE INSERT ON prescription_items
FOR EACH ROW
BEGIN

    DECLARE available_stock INT;


    SELECT quantity
    INTO available_stock
    FROM medicines
    WHERE medicine_id = NEW.medicine_id;


    IF available_stock < NEW.quantity THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'Insufficient medicine stock';

    END IF;


    UPDATE medicines
    SET quantity = quantity - NEW.quantity
    WHERE medicine_id = NEW.medicine_id;


END$$

DELIMITER ;


# task 8 

# Task 8.1 - a saved, reusable view of today's appointments

CREATE VIEW vw_today_appointments AS

SELECT

    a.appointment_id,
    CONCAT(p.first_name,' ',p.last_name) AS patient_name,
    CONCAT(u.first_name,' ',u.last_name) AS doctor_name,
    dpt.department_name,
    a.appointment_date,
    a.start_time,
    a.end_time,
    a.appointment_status,
    a.remarks

FROM appointments a

INNER JOIN patients p
ON a.patient_id = p.patient_id

INNER JOIN doctors d
ON a.doctor_id = d.doctor_id

INNER JOIN users u
ON d.user_id = u.user_id

INNER JOIN departments dpt
ON d.department_id = dpt.department_id

WHERE a.appointment_date = CURRENT_DATE();

# use view

SELECT * FROM vw_today_appointments;

# Task 8.2 - something that gives a patient's age from their date of birth

DELIMITER $$

CREATE FUNCTION fn_calculate_age( dob DATE )
RETURNS INT DETERMINISTIC

BEGIN

    DECLARE age INT;

    SET age = TIMESTAMPDIFF ( YEAR, dob, CURDATE() );

    RETURN age;

END$$

DELIMITER ;

# test function

SELECT 
first_name,
last_name,
fn_calculate_age(date_of_birth) AS age
FROM patients;

# Task 8.3 - something that gives a bill's final total including tax

DELIMITER $$

CREATE FUNCTION fn_calculate_final_bill
(
    consultation DECIMAL(10,2),
    medicine DECIMAL(10,2),
    room DECIMAL(10,2),
    tax DECIMAL(5,2),
    discount DECIMAL(10,2)
)

RETURNS DECIMAL(12,2) DETERMINISTIC

BEGIN

    DECLARE subtotal DECIMAL(12,2);
    DECLARE tax_amount DECIMAL(12,2);
    DECLARE final_amount DECIMAL(12,2);
    
    SET subtotal = consultation + medicine + room;
	SET tax_amount = subtotal * tax / 100;
	SET final_amount = subtotal + tax_amount - discount;
    
    RETURN final_amount;

END$$

DELIMITER ;

# test 

SELECT  fn_calculate_final_bill ( 1000, 500, 2000, 18, 500 ) AS final_amount;

# task 8.4 -something you can call to get a patient's full visit history

DELIMITER $$

CREATE PROCEDURE sp_patient_visit_history ( IN p_patient_id CHAR(36) )

BEGIN

SELECT 
a.appointment_date,
CONCAT(u.first_name,' ',u.last_name) AS doctor_name,
dep.department_name,
a.appointment_status,
pr.prescription_id,
b.bill_id,
b.total_amount,
py.payment_status
FROM appointments a

INNER JOIN doctors d
ON a.doctor_id=d.doctor_id

INNER JOIN users u
ON d.user_id=u.user_id

INNER JOIN departments dep
ON d.department_id=dep.department_id

LEFT JOIN prescriptions pr
ON a.appointment_id=pr.appointment_id

LEFT JOIN bills b
ON a.appointment_id=b.appointment_id

LEFT JOIN payments py
ON b.bill_id=py.bill_id

WHERE a.patient_id=p_patient_id;


END$$

DELIMITER ;


# call 

CALL sp_patient_visit_history ('00e5ec40-85af-11f1-beb2-489ebde94b09');

select * from patients;


# 9.1 - The insurance discount function 

DELIMITER $$

CREATE FUNCTION fn_calculate_insurance_discount( bill_amount DECIMAL(12,2) )

RETURNS DECIMAL(12,2) DETERMINISTIC

BEGIN

    DECLARE discount_percentage DECIMAL(5,2);
    DECLARE discount_amount DECIMAL(12,2);

    IF bill_amount < 5000 THEN
        SET discount_percentage = 0;

    ELSEIF bill_amount >= 5000 
        AND bill_amount < 10000 THEN
        SET discount_percentage = 5;
        
    ELSEIF bill_amount >= 10000 
        AND bill_amount < 50000 THEN
        SET discount_percentage = 10;

    ELSE SET discount_percentage = 15;

    END IF;
    
    SET discount_amount = bill_amount * discount_percentage / 100;

    RETURN discount_amount;

END$$

DELIMITER ;

#Test Function

SELECT fn_calculate_insurance_discount(30000) AS discount;


# 10.  Two people at the same moment

# 10.1 two people cannot book the same doctor at the same time

START TRANSACTION;

INSERT INTO appointments
(
patient_id,
doctor_id,
appointment_date,
start_time,
end_time,
booked_by
)

VALUES
(
'00e5f330-85af-11f1-beb2-489ebde94b09',
'0338516e-855d-11f1-beb2-489ebde94b09',
'2026-07-25',
'10:00:00',
'10:30:00',
'16dbe541-85ad-11f1-beb2-489ebde94b09'
);

START TRANSACTION;

INSERT INTO appointments
(
patient_id,
doctor_id,
appointment_date,
start_time,
end_time,
booked_by
)

VALUES
(
'00e5f5a9-85af-11f1-beb2-489ebde94b09',
'0338516e-855d-11f1-beb2-489ebde94b09',
'2026-07-25',
'10:00:00',
'10:30:00',
'16dedbdb-85ad-11f1-beb2-489ebde94b09'
);

select * from users;


# 10.2 two patients cannot be given the same last free bed.

SET autocommit = 0;

SELECT *
FROM rooms
WHERE room_id='df9971ab-855f-11f1-beb2-489ebde94b09'
AND is_available=TRUE
FOR UPDATE;

COMMIT;

select * from rooms;

# 10.3 the last few units of a medicine cannot be over-sold

select * from medicines;
SELECT quantity
FROM medicines
WHERE medicine_id='363cca07-8560-11f1-beb2-489ebde94b09'
FOR UPDATE;

# Safe Stock Deduction Transaction

START TRANSACTION;

SELECT quantity
FROM medicines
WHERE medicine_id='363cca07-8560-11f1-beb2-489ebde94b09'
FOR UPDATE;

DELIMITER $$

CREATE PROCEDURE sp_Safe_Stock_Deduction (
    IN p_medicine_id CHAR(36),
    IN p_requested_quantity INT
)
BEGIN
    DECLARE current_quantity INT;

    SELECT quantity
    INTO current_quantity
    FROM medicines
    WHERE medicine_id = p_medicine_id;

    IF current_quantity >= p_requested_quantity THEN

        UPDATE medicines
        SET quantity = quantity - p_requested_quantity
        WHERE medicine_id = p_medicine_id;

        SELECT 'Stock deducted successfully.' AS Message;

    ELSE

        SELECT 'Insufficient Stock' AS Message;

    END IF;

END$$

DELIMITER ;

CALL sp_Safe_Stock_Deduction('363cca07-8560-11f1-beb2-489ebde94b09', 10);


# 11

# Create Stored Procedure

DELIMITER $$

CREATE PROCEDURE sp_book_appointment
(
    IN p_patient_id CHAR(36),
    IN p_doctor_id CHAR(36),
    IN p_schedule_id CHAR(36),
    IN p_appointment_date DATE,
    IN p_start_time TIME,
    IN p_end_time TIME,
    IN p_booked_by CHAR(36),
    IN p_remarks TEXT
)

BEGIN


DECLARE existing_count INT DEFAULT 0;
DECLARE new_appointment_id CHAR(36);

DECLARE EXIT HANDLER FOR SQLEXCEPTION

BEGIN

    ROLLBACK;

    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Appointment booking failed';

END;

START TRANSACTION;

# Check doctor slot availability

SELECT COUNT(*)
INTO existing_count
FROM appointments
WHERE doctor_id = p_doctor_id
AND appointment_date = p_appointment_date
AND start_time = p_start_time
AND is_deleted = FALSE;

IF existing_count > 0 THEN

    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Doctor slot already booked';

END IF;


# Create appointment

SET new_appointment_id = UUID();

INSERT INTO appointments
(
appointment_id,
patient_id,
doctor_id,
schedule_id,
appointment_date,
start_time,
end_time,
appointment_status,
booked_by,
remarks,
created_by
)

VALUES
(
new_appointment_id,
p_patient_id,
p_doctor_id,
p_schedule_id,
p_appointment_date,
p_start_time,
p_end_time,
'BOOKED',
p_booked_by,
p_remarks,
p_booked_by
);

# Create status history

INSERT INTO appointment_status_history
(
history_id,
appointment_id,
old_status,
new_status,
changed_by,
remarks
)

VALUES
(
UUID(),
new_appointment_id,
NULL,
'BOOKED',
p_booked_by,
'Appointment created'
);

COMMIT;

SELECT  new_appointment_id AS appointment_id, 'Appointment booked successfully' AS message;

END$$

DELIMITER ;


# Test Successful Booking

CALL sp_book_appointment
(
'37709ca9-855c-11f1-beb2-489ebde94b09',
'0338516e-855d-11f1-beb2-489ebde94b09',
'3b08b9b4-855e-11f1-beb2-489ebde94b09',
'2026-07-23',
'11:00:00',
'11:30:00',
'2f5e1981-855c-11f1-beb2-489ebde94b09',
'Follow up consultation'
);

SELECT * FROM appointments;

SELECT * FROM appointment_status_history;

# Test Duplicate Booking

CALL sp_book_appointment
(
'37709e23-855c-11f1-beb2-489ebde94b09',
'0338516e-855d-11f1-beb2-489ebde94b09',
'3b08b9b4-855e-11f1-beb2-489ebde94b09',
'2026-07-23',
'11:00:00',
'11:30:00',
'16dcca9c-85ad-11f1-beb2-489ebde94b09',
'37709f18-855c-11f1-beb2-489ebde94b09'
);

select * from users;


# 12 

# 12.2 one free bed, many admissions at once

DELIMITER //

CREATE PROCEDURE AdmitPatient
(
    IN p_patient_id CHAR(36),
    IN p_room_id CHAR(36),
    IN p_user_id CHAR(36)
)

BEGIN

START TRANSACTION;

SELECT is_available
FROM rooms
WHERE room_id = p_room_id
FOR UPDATE;

IF EXISTS
(
    SELECT 1
    FROM admissions
    WHERE room_id = p_room_id
    AND discharge_date IS NULL
)
THEN

SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='Room already occupied';

END IF;

INSERT INTO admissions
(
    patient_id,
    room_id,
    admitted_by,
    admit_date
)
VALUES
(
    p_patient_id,
    p_room_id,
    p_user_id,
    NOW()
);

UPDATE rooms
SET is_available = FALSE
WHERE room_id = p_room_id;

COMMIT;

END //

DELIMITER ;


CALL AdmitPatient ('37709ca9-855c-11f1-beb2-489ebde94b09','df9888d4-855f-11f1-beb2-489ebde94b09','2670df10-855c-11f1-beb2-489ebde94b09');

select * from  rooms;
select * from patients;
select * from appointments;
select * from users;


# 12.3 a small stock of one medicine, many buyers at once

DELIMITER //

CREATE PROCEDURE ReduceMedicineStock
(
    IN p_medicine_id CHAR(36),
    IN p_quantity INT
)

BEGIN

START TRANSACTION;

SELECT quantity
FROM medicines
WHERE medicine_id = p_medicine_id
FOR UPDATE;

IF
(
SELECT quantity
FROM medicines
WHERE medicine_id=p_medicine_id
) < p_quantity

THEN

SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='Insufficient stock';

END IF;

UPDATE medicines
SET quantity = quantity - p_quantity
WHERE medicine_id=p_medicine_id;

COMMIT;

END //

DELIMITER ;

CALL ReduceMedicineStock('363cca07-8560-11f1-beb2-489ebde94b09',4);

# check

SELECT
medicine_name,
quantity
FROM medicines;

select * from medicines;


# 13 

# 13.1 every appointment, with the patient's and doctor's names.

SELECT a.appointment_id,
    CONCAT(p.first_name,' ', p.last_name ) AS patient_name,
    CONCAT(u.first_name,' ',u.last_name ) AS doctor_name,
    a.appointment_date,
    a.start_time,
    a.end_time,
    a.appointment_status
FROM appointments a

INNER JOIN patients p ON a.patient_id = p.patient_id

INNER JOIN doctors d ON a.doctor_id = d.doctor_id

INNER JOIN users u ON d.user_id = u.user_id

ORDER BY a.appointment_date, a.start_time;


# 13.2 every doctor, including ones who have never seen a patient

SELECT 
d.doctor_id,
CONCAT( u.first_name,' ',u.last_name) AS doctor_name,
dep.department_name,
COUNT(a.appointment_id) AS total_patients_seen
FROM doctors d

INNER JOIN users u ON d.user_id=u.user_id

INNER JOIN departments dep ON d.department_id=dep.department_id

LEFT JOIN appointments a ON d.doctor_id=a.doctor_id

GROUP BY
d.doctor_id,
doctor_name,
dep.department_name;


# 13.3 each department's total revenue, and its share of the hospital's whole revenue.alter.

SELECT
dep.department_name,
SUM(b.total_amount) AS department_revenue,
ROUND((SUM(b.total_amount)/ ( SELECT SUM(total_amount) FROM bills))*100,2) AS revenue_percentage
FROM departments dep

INNER JOIN doctors d
ON dep.department_id=d.department_id

INNER JOIN appointments a
ON d.doctor_id=a.doctor_id

INNER JOIN bills b
ON a.appointment_id=b.appointment_id

GROUP BY
dep.department_name;


# 13.4 this month's revenue compared with last month's

SELECT 'Current Month' AS period, SUM(total_amount) AS revenue
FROM bills
WHERE MONTH(bill_date)=MONTH(CURRENT_DATE())
AND
YEAR(bill_date)=YEAR(CURRENT_DATE())

UNION ALL

SELECT 'Previous Month', SUM(total_amount)
FROM bills
WHERE
MONTH(bill_date)=MONTH(
DATE_SUB(
CURRENT_DATE(),
INTERVAL 1 MONTH))
AND
YEAR(bill_date)=YEAR(
DATE_SUB(
CURRENT_DATE(),
INTERVAL 1 MONTH)
);


# 13.5 the busiest hour of the day for the hospital

SELECT HOUR(start_time) AS appointment_hour,
COUNT(*) AS total_appointments
FROM appointments
GROUP BY HOUR(start_time)
ORDER BY total_appointments DESC
LIMIT 1;


# 13.6 doctors ranked by revenue within their own department

SELECT
department_name,
doctor_name,
revenue,
RANK()
OVER
(
PARTITION BY department_name
ORDER BY revenue DESC
) AS department_rank
FROM (

SELECT dep.department_name,
CONCAT(u.first_name,' ',u.last_name)
doctor_name,
SUM(b.total_amount)
revenue
FROM doctors d

JOIN users u
ON d.user_id=u.user_id

JOIN departments dep
ON d.department_id=dep.department_id

JOIN appointments a
ON d.doctor_id=a.doctor_id

JOIN bills b
ON a.appointment_id=b.appointment_id

GROUP BY dep.department_name, doctor_name
) x;

# 13.7 patients grouped into low / medium / high spenders

SELECT patient_name, total_spent,

CASE

WHEN total_spent < 5000 THEN 'LOW'
WHEN total_spent BETWEEN 5000 AND 20000
THEN 'MEDIUM'
ELSE 'HIGH'
END AS spender_category
FROM (

SELECT
CONCAT(p.first_name,' ',p.last_name)
patient_name,
SUM(b.total_amount)
total_spent
FROM patients p

JOIN bills b
ON p.patient_id=b.patient_id

GROUP BY p.patient_id
)x;

select * from bills;


# 13.8 one single query that gives a full dashboard for a department (patients seen, revenue, average bill, cancellation rate)

SELECT dep.department_name,

COUNT(DISTINCT a.patient_id) AS patients_seen,
SUM(b.total_amount) AS total_revenue,
AVG(b.total_amount) AS average_bill,

ROUND((SUM
(
CASE

WHEN a.appointment_status='CANCELLED'
THEN 1
ELSE 0

END
) /

COUNT(a.appointment_id)

)*100,2)

AS cancellation_rate
FROM departments dep
JOIN doctors d
ON dep.department_id=d.department_id
LEFT JOIN appointments a ON d.doctor_id=a.doctor_id
LEFT JOIN bills b ON a.appointment_id=b.appointment_id
WHERE dep.department_id='YOUR_DEPARTMENT_ID'
GROUP BY dep.department_name;


# 14. Don't lose the empty months

	# Generate all months using Recursive CTE
    
    WITH RECURSIVE months AS
	(
    SELECT 
        DATE('2026-01-01') AS month_start

    UNION ALL

    SELECT
        DATE_ADD(month_start, INTERVAL 1 MONTH)
    FROM months
    WHERE month_start < '2026-12-01'
	)

	SELECT *
	FROM months;
    
    # Join payments with months
    
    WITH RECURSIVE months AS
	(
    SELECT 
        DATE('2026-01-01') AS month_start

    UNION ALL

    SELECT
        DATE_ADD(month_start, INTERVAL 1 MONTH)
    FROM months
    WHERE month_start < '2026-12-01'
	)

SELECT
    DATE_FORMAT(m.month_start,'%M') AS month_name,
    
    COALESCE(SUM(p.amount),0) AS revenue

FROM months m

LEFT JOIN payments p
ON DATE_FORMAT(p.payment_date,'%Y-%m')
=
DATE_FORMAT(m.month_start,'%Y-%m')

GROUP BY 
    m.month_start

ORDER BY 
    m.month_start;
    
# 15. Make a slow query fast

# index create

CREATE INDEX idx_payment_status_date
ON payments
(
    payment_status,
    payment_date
);

# query

SELECT
    payment_id,
    bill_id,
    amount,
    payment_date
FROM payments
WHERE 
payment_status='SUCCESS'
AND payment_date BETWEEN 
'2025-01-01'
AND 
'2025-12-31';

# 16. 

CREATE USER 'hospital_report_user'@'localhost'
IDENTIFIED BY 'Report@123';

GRANT SELECT
ON hospital_system_db.*
TO 'hospital_report_user'@'localhost';

SHOW GRANTS FOR 
'hospital_report_user'@'localhost';

SELECT * FROM payments;

DELETE FROM payments WHERE amount=5000;

#________________________________________________________________

# Create Application User

CREATE USER 'hospital_app_user'@'localhost'
IDENTIFIED BY 'App@123';

GRANT SELECT, INSERT, UPDATE, DELETE
ON hospital_system_db.*
TO 'hospital_app_user'@'localhost';

SHOW GRANTS FOR
'hospital_app_user'@'localhost';


# 17. Break a search, then fix it

PREPARE patient_search
FROM
'SELECT *
FROM patients
WHERE first_name = ?';

SET @name='Yash';

EXECUTE patient_search USING @name;


# 18. take a backup. Delete something. Bring it back from the backup. Prove it returned completely.

# Take a Backup

# 1. Server → Data Export
# 2. hospital_system_db => select file
# 3. choose => Export to Self-Contained File
# 4. Start Export

# Restore the Backup

# 1. Server → Data Import
# 2. Import from Self-Contained File
# 3. hospital_system_db_backup.sql
# 4. Start Import












