CREATE DATABASE Hospital_mgmt;

USE Hospital_mgmt;

-- PATIENTS TABLE
CREATE TABLE Patients (
	Patient_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(200),
    DOB DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    Phone VARCHAR (10),
    Address TEXT
);

-- DOCTOR TABLE
CREATE TABLE Doctor (
	Doctor_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR (200),
	Specialty VARCHAR (200),
    Phone VARCHAR (10)
);

-- APPOINMENT TABLES
CREATE TABLE Appointments (
	Appointment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Doctor_ID INT,
    Appointment_Date DATETIME,
    Status ENUM('Scheduled', 'Completed', 'Cancelled'),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);

-- ADMIT OR DISCHARGE TABLE
CREATE TABLE Admit(
	Admission_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Room_No INT,
    Admission_Date DATETIME,
    Discharge_Date DATETIME,
	Status ENUM('Admitted', 'Discharged'),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

-- PATIENT BILLS TABLE
CREATE TABLE Bills (
    Bill_ID INT PRIMARY KEY AUTO_INCREMENT,
    Patient_ID INT,
    Total_Amount DECIMAL(10,2),
    Status ENUM('Paid', 'Unpaid'),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)
);

-- PATIENT DATA
INSERT INTO Patients (Name, DOB, Gender, Phone, Address)
VALUES
('Aarav Sharma', '1990-05-12', 'Male', '9876543210', 'Pune, Maharashtra'),
('Priya Verma', '1985-08-24', 'Female', '9876543211', 'Mumbai, Maharashtra'),
('Rohan Mehta', '1992-11-16', 'Male', '9876543212', 'Delhi, Delhi'),
('Isha Nair', '1998-07-30', 'Female', '9876543213', 'Chennai, Tamil Nadu'),
('Karan Singh', '1978-03-05', 'Male', '9876543214', 'Kolkata, West Bengal'),
('Neha Kulkarni', '1995-09-12', 'Female', '9876543215', 'Nagpur, Maharashtra'),
('Aditya Joshi', '1987-04-18', 'Male', '9876543216', 'Hyderabad, Telangana'),
('Ananya Iyer', '2000-02-22', 'Female', '9876543217', 'Bangalore, Karnataka'),
('Vikram Gupta', '1983-12-15', 'Male', '9876543218', 'Jaipur, Rajasthan'),
('Sneha Desai', '1991-06-08', 'Female', '9876543219', 'Ahmedabad, Gujarat');


-- DOCTORS DATA
INSERT INTO Doctor (Name, Specialty, Phone)
VALUES
('Dr. Arjun Patel', 'Cardiologist', '9898765432'),
('Dr. Meera Shenoy', 'Neurologist', '9887654321'),
('Dr. Ramesh Gupta', 'Orthopedic Surgeon', '9876543210'),
('Dr. Kavita Iyer', 'Pediatrician', '9865432109'),
('Dr. Sanjay Deshmukh', 'Dermatologist', '9854321098'),
('Dr. Neeta Verma', 'Gynecologist', '9843210987'),
('Dr. Anil Kumar', 'General Physician', '9832109876');

-- APPOINTMENT DATA
INSERT INTO Appointments (Patient_ID, Doctor_ID, Appointment_Date, Status)
VALUES
(1, 1, '2025-03-10 10:00:00', 'Scheduled'),
(2, 2, '2025-03-12 11:30:00', 'Completed'),
(3, 3, '2025-03-14 09:00:00', 'Cancelled'),
(4, 4, '2025-03-15 15:00:00', 'Scheduled'),
(5, 5, '2025-03-16 08:30:00', 'Completed'),
(6, 6, '2025-03-18 12:00:00', 'Scheduled'),
(7, 7, '2025-03-20 10:00:00', 'Cancelled'),
(8, 1, '2025-03-22 14:30:00', 'Completed'),
(9, 2, '2025-03-23 11:00:00', 'Scheduled'),
(10, 3, '2025-03-25 16:00:00', 'Cancelled');

UPDATE Appointments 
SET Status = 'Completed' -- Scheduled//Completed//Cancelled
WHERE Appointment_ID = 1;


-- ADMISSION DATA
INSERT INTO Admit (Patient_ID, Room_No, Admission_Date, Status)
VALUES
(1, '101', NOW(), 'Admitted'),
(2, '102', '2025-03-04 10:00:00', 'Admitted'),
(3, '103', '2025-03-03 14:00:00', 'Admitted'),
(4, '104', '2025-03-02 09:30:00', 'Admitted'),
(5, '105', '2025-03-01 18:45:00', 'Admitted'),
(6, '106', '2025-02-28 08:00:00', 'Admitted'),
(7, '107', '2025-02-27 12:15:00', 'Admitted'),
(8, '108', '2025-02-26 17:30:00', 'Admitted'),
(9, '109', '2025-02-25 11:00:00', 'Admitted'),
(10, '110', '2025-02-24 15:00:00', 'Admitted');

SELECT * FROM Admit;
-- UPDATE DISCHARGE
UPDATE Admit 
SET Discharge_Date = NOW(), Status = 'Discharged' 
WHERE Patient_ID = 1 AND Status = 'Admitted';

-- PATIENT BILLS
INSERT INTO Bills (Patient_ID, Total_Amount, Status) 
VALUES 
(1, 2000.50, 'Unpaid'),
(2, 1500.00, 'Paid'),
(3, 3500.75, 'Unpaid'),
(4, 500.00, 'Paid'),
(5, 2750.00, 'Unpaid'),
(6, 1800.20, 'Paid'),
(7, 2200.50, 'Unpaid'),
(8, 1400.00, 'Paid'),
(9, 3300.10, 'Unpaid'),
(10, 1750.00, 'Paid');

UPDATE Bills 
SET Status = 'Paid' 
WHERE Bill_ID = 1;


-- All Scheduled data
SELECT a.Appointment_ID, p.Name AS Patient, d.Name AS Doctor, a.Appointment_Date
FROM Appointments a
JOIN Patients p ON a.Patient_ID = p.Patient_ID
JOIN Doctor d ON a.Doctor_ID = d.Doctor_ID
WHERE a.Status = 'Scheduled';  -- Completed//Cancelled//Scheduled

-- SHOW ALL DATA
SELECT * FROM Patients;
SELECT * FROM Doctor;
SELECT * FROM Appointments;
SELECT * FROM Admit;
SELECT * FROM Bills;







