---

### Diagnostic Management System
## Built to manage the work flow of any diagnostic center

---

### Tech Stack
- Java
- JDBC
- JSP
- Appache Tomcat 9
- MySQL
- HTML
- CSS
- BootStrap 5

---

### DB Schema

In MySQL

```
CREATE DATABASE diagnostic_db;

USE diagnostic_db;

CREATE TABLE patients (
	patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    phone VARCHAR(15),
    gender VARCHAR(10),
    age INT,
    address VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE analysts (
    analyst_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    specialization VARCHAR(100),
    phone VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100)
);

CREATE TABLE tests (
    test_id INT AUTO_INCREMENT PRIMARY KEY,
    test_name VARCHAR(100),
    description TEXT,
    price DECIMAL(10,2),
    duration VARCHAR(50)
);

CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    test_id INT,
    analyst_id INT,
    appointment_date DATE,
    appointment_time TIME,
    status ENUM('Pending','Approved','Rejected','In-progress','Completed') DEFAULT 'Pending',
    remarks TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (test_id) REFERENCES tests(test_id),
    FOREIGN KEY (analyst_id) REFERENCES analysts(analyst_id)
);

CREATE TABLE reports (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT,
    file_path VARCHAR(255),
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comments TEXT,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT,
    amount DECIMAL(10,2),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending','Paid','Failed') DEFAULT 'Pending',
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

SHOW TABLES;

DESCRIBE patients;

SELECT * FROM patients;

SELECT * FROM analysts;

INSERT INTO tests (test_name, description, price, duration) VALUES
('Complete Blood Count (CBC)', 'General blood health test', 500.00, '1 day'),
('Lipid Profile', 'Cholesterol and triglyceride levels', 900.00, '1 day'),
('Liver Function Test (LFT)', 'Checks liver health', 800.00, '1 day'),
('Thyroid Profile', 'T3, T4, TSH levels', 700.00, '1 day');


ALTER TABLE reports ADD COLUMN is_shared BOOLEAN DEFAULT FALSE;

```

---



