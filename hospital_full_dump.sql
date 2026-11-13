#Question 1
use hospital; 
SELECT * FROM departments;

#Question 2
SELECT first_name, last_name, phone, email, address
FROM patient
WHERE patient_id = 5612;

#Question 3
use hospital ;
UPDATE patient
SET phone='085-123-4567',
    email='DanetSheby@wiley.com',
    address='99 Temple Road, Dublin'
WHERE patient_id=3456;

#Question 4
use hospital;
INSERT INTO appointment (appointment_id, patient_id, doctor_id, treatment_id, appointment_date)
VALUES (4011, 5612, 2008, 3001, '2025-05-10 09:30:00');


#Question 5
use hospital;
SELECT p.patient_id, p.first_name, p.last_name
FROM patient p
JOIN patient_cond c ON c.patient_id = p.patient_id
WHERE c.cond_name='Diabetes';

#Question 6
use hospital;
SELECT DISTINCT p.first_name, p.last_name
FROM appointment a
JOIN patient p ON p.patient_id=a.patient_id
JOIN staff   s ON s.staff_id=a.doctor_id
WHERE s.first_name='Kavin' AND s.last_name='Smith';

#Question 7
use hospital;
UPDATE patient
SET department_id = (SELECT department_id FROM departments WHERE name='Orthopedic Surgery')
WHERE department_id = (SELECT department_id FROM departments WHERE name='Orthopedics');

#Question 8
use hospital;
SELECT first_name, last_name, hire_date
FROM staff
WHERE job_title='Doctor'
ORDER BY hire_date DESC;

#Question 9
use hospital;
SELECT COUNT(*) AS heart_surgery_patients
FROM appointment a
JOIN treatment t ON t.treatment_id=a.treatment_id
WHERE t.name='Heart Surgery';

#Question 10
use hospital;
INSERT INTO departments VALUES (11,'Urology','01-2345678','Block K');
INSERT INTO staff VALUES (2011,'Nora','Quinn','Nurse','Nurse','2022-05-05','085-000-1111',11);
INSERT INTO patient VALUES (5009,'Aidan','Reid','1991-02-02','086-111-2222','aidan.reid@example.com','1 Sample Road, Dublin','Ella','086-999-8888',11);
INSERT INTO treatment VALUES (3011,'Prostate Exam','Routine urology exam',11);
INSERT INTO patient_cond VALUES (6011,5009,'Hypertension','2023-01-10');
INSERT INTO staff_leave VALUES (7011,2011,'2025-06-01','2025-06-03',3);
INSERT INTO appointment VALUES (4012,5009,2001,3002,'2025-05-20 11:00:00');

#Question 11
use hospital; DELETE FROM appointment  WHERE appointment_id=4012;
DELETE FROM staff_leave  WHERE leave_id=7011;
DELETE FROM patient_cond WHERE cond_id=6011;
DELETE FROM treatment    WHERE treatment_id=3011;
DELETE FROM patient      WHERE patient_id=5009;
DELETE FROM staff        WHERE staff_id=2011;
DELETE FROM departments  WHERE department_id=11;

#Question 12
use hospital;
SELECT s.staff_id, s.first_name, s.last_name,
       COALESCE(SUM(l.days_off),0) AS total_days_off
FROM staff s
LEFT JOIN staff_leave l ON l.staff_id=s.staff_id
GROUP BY s.staff_id, s.first_name, s.last_name
ORDER BY total_days_off ASC;

#Question 13
use hospital; 
UPDATE staff
SET job_title = 'Office Worker'
WHERE job_title = 'Administrator';

#Question 14
use hospital; 
UPDATE departments
SET phone='01-7654321'
WHERE name='Orthopedics';

#Question 15
use hospital;
UPDATE staff
SET job_title='CEO'
WHERE first_name='Michael' AND last_name='Dean';

#Question 16
use hospital;
SELECT staff_id, first_name, last_name, hire_date
FROM staff
WHERE hire_date <= DATE_SUB(CURDATE(), INTERVAL 3 YEAR);

#Question 17
use hospital; 
SELECT p.first_name, p.last_name, c.cond_name,
       a.appointment_date, t.name AS treatment
FROM patient p
LEFT JOIN patient_cond c ON c.patient_id=p.patient_id
LEFT JOIN appointment a  ON a.patient_id=p.patient_id
LEFT JOIN treatment t    ON t.treatment_id=a.treatment_id
ORDER BY p.last_name, p.first_name, a.appointment_date;

#Question 18
use hospital;
SELECT COUNT(*) AS patients_with_road
FROM patient
WHERE LOWER(address) LIKE '%road%';

#Question 19
use hospital; 
CREATE OR REPLACE VIEW v_patient_appointments AS
SELECT a.appointment_id,
       p.patient_id, p.first_name AS patient_first, p.last_name AS patient_last,
       s.staff_id   AS doctor_id, s.first_name   AS doctor_first, s.last_name AS doctor_last,
       t.treatment_id, t.name AS treatment_name,
       a.appointment_date
FROM appointment a
JOIN patient p   ON p.patient_id=a.patient_id
JOIN staff   s   ON s.staff_id=a.doctor_id
JOIN treatment t ON t.treatment_id=a.treatment_id;

#Question 20
use hospital;
TRUNCATE TABLE appointment;




