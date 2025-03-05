This SQL script defines and manages a Hospital Management System database called Hospital_mgmt. It includes multiple tables to manage patients, doctors, appointments, admissions, and billing. Below is a breakdown of each section:

1. Creating the Database
A new database Hospital_mgmt is created and selected for use.

2. Patients Table
Stores information about patients.
Columns: Patient_ID, Name, DOB, Gender, Phone, Address.
Data: 10 sample patient records are inserted.

3. Doctor Table
Stores doctor details and their specialties.
Columns: Doctor_ID, Name, Specialty, Phone.
Data: 7 sample doctors are inserted.

4. Appointments Table
Manages appointments between patients and doctors.
Columns: Appointment_ID, Patient_ID, Doctor_ID, Appointment_Date, Status.
Relationships:
Patient_ID references Patients(Patient_ID).
Doctor_ID references Doctor(Doctor_ID).
Data: 10 sample appointments with different statuses (Scheduled, Completed, Cancelled).
Queries:
Update an appointment status.
Fetch scheduled appointments with patient and doctor details.

5. Admission Table
Tracks patient hospital admissions and discharges.
Columns: Admission_ID, Patient_ID, Room_No, Admission_Date, Discharge_Date, Status.
Relationships: Patient_ID references Patients(Patient_ID).
Data: 10 patients are admitted.
Queries:
Fetch all admitted patients.
Update a patient’s discharge details.

6. Bills Table
Handles patient billing details.
Columns: Bill_ID, Patient_ID, Total_Amount, Status.
Relationships: Patient_ID references Patients(Patient_ID).
Data: 10 patient bills with Paid or Unpaid status.
Query:
Update the bill status to Paid.

7. Queries for Analysis
Retrieve all scheduled appointments with patient and doctor details.
View all data from Patients, Doctors, Appointments, Admissions, and Bills.
Purpose of This System
Tracks patient records (admissions, appointments, and bills).
Manages doctor details (specialties and contact information).
Handles appointment scheduling and status updates.
Processes patient admissions and discharges.
Tracks and updates billing details.
