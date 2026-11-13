CREATE DATABASE IF NOT EXISTS hospital;
USE hospital;

DROP TABLE IF EXISTS appointment, staff_leave, patient_cond, treatment, patient, staff, departments;

CREATE TABLE departments (
  department_id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  phone VARCHAR(20),
  location VARCHAR(100)
);

CREATE TABLE staff (
  staff_id INT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  job_title VARCHAR(100) NOT NULL,
  staff_role VARCHAR(20) NOT NULL,
  hire_date DATE NOT NULL,
  phone VARCHAR(20),
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE patient (
  patient_id INT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  d_o_b DATE NOT NULL,
  phone VARCHAR(20),
  email VARCHAR(100),
  address VARCHAR(200),
  sos_contact_n VARCHAR(100),
  sos_contact_p VARCHAR(20),
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE treatment (
  treatment_id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description VARCHAR(255),
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE appointment (
  appointment_id INT PRIMARY KEY,
  patient_id INT NOT NULL,
  doctor_id INT NOT NULL,
  treatment_id INT NOT NULL,
  appointment_date DATETIME NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
  FOREIGN KEY (doctor_id) REFERENCES staff(staff_id),
  FOREIGN KEY (treatment_id) REFERENCES treatment(treatment_id)
);

CREATE TABLE patient_cond (
  cond_id INT PRIMARY KEY,
  patient_id INT NOT NULL,
  cond_name VARCHAR(100) NOT NULL,
  diagnosis_date DATE,
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE staff_leave (
  leave_id INT PRIMARY KEY,
  staff_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  days_off INT NOT NULL,
  FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
);

insert into departments (department_id, name, phone, location) values (1, 'Radiology', '272-457-8367', 'Block G');
insert into departments (department_id, name, phone, location) values (2, 'Dermatology', '826-870-7152', 'Block C');
insert into departments (department_id, name, phone, location) values (3, 'Oncology', '791-240-3084', 'Block B');
insert into departments (department_id, name, phone, location) values (4, 'ENT', '827-343-8008', 'Block C');
insert into departments (department_id, name, phone, location) values (5, 'Pediatrics', '927-343-3801', 'Block J');
insert into departments (department_id, name, phone, location) values (6, 'Cardiology', '310-341-9254', 'Block I');
insert into departments (department_id, name, phone, location) values (7, 'Orthopedics', '602-581-2315', 'Block G');
insert into departments (department_id, name, phone, location) values (8, 'Neurology', '761-215-7928', 'Block G');
insert into departments (department_id, name, phone, location) values (9, 'General Surgery', '749-788-9030', 'Block I');
insert into departments (department_id, name, phone, location) values (10, 'Orthopedic Surgery', '267-900-3817', 'Block I');

insert into staff (staff_id, first_name, last_name, job_title, staff_role, hire_date, phone, department_id) values (2001, 'Corbin', 'Wise', 'Doctor', 'Doctor', '2024/1/8', '982-382-7466', 9);
insert into staff (staff_id, first_name, last_name, job_title, staff_role, hire_date, phone, department_id) values (2002, 'Michael', 'Dean', 'CEO', 'Support', '2015/7/14', '452-732-2946', 6);
insert into staff (staff_id, first_name, last_name, job_title, staff_role, hire_date, phone, department_id) values (2003, 'Alaine', 'Pina', 'Doctor', 'Doctor', '2022/11/15', '213-940-6909', 8);
insert into staff (staff_id, first_name, last_name, job_title, staff_role, hire_date, phone, department_id) values (2004, 'Amye', 'Jeacop', 'Office worker', 'Support', '2015/3/13', '369-630-7042', 1);
insert into staff (staff_id, first_name, last_name, job_title, staff_role, hire_date, phone, department_id) values (2005, 'Kris', 'Wicken', 'Porter', 'Support', '2021/12/22', '952-637-1389', 3);
insert into staff (staff_id, first_name, last_name, job_title, staff_role, hire_date, phone, department_id) values (2006, 'Winnifred', 'Whiterod', 'Nurse', 'Nurse', '2013/6/25', '366-461-3283', 9);
insert into staff (staff_id, first_name, last_name, job_title, staff_role, hire_date, phone, department_id) values (2007, 'Elberta', 'di Rocca', 'Administrator', 'Support', '2022/7/27', '369-584-9354', 10);
insert into staff (staff_id, first_name, last_name, job_title, staff_role, hire_date, phone, department_id) values (2008, 'Smith', 'Kavin', 'Doctor', 'Doctor', '2013/7/29', '149-529-3655', 2);
insert into staff (staff_id, first_name, last_name, job_title, staff_role, hire_date, phone, department_id) values (2009, 'Erastus', 'Lenglet', 'Nurse', 'Nurse', '2018/8/10', '245-131-9159', 5);
insert into staff (staff_id, first_name, last_name, job_title, staff_role, hire_date, phone, department_id) values (2010, 'Arney', 'Miskelly', 'CEO', 'Support', '2023/6/8', '524-254-3006', 1);
