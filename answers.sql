--- Clinic Booking System 
-- Drop tables if they exist
DROP TABLE IF EXISTS Appointment;
DROP TABLE IF EXISTS Doctors_Specialization;
DROP TABLE IF EXISTS Specialization;
DROP TABLE IF EXISTS Room;
DROP TABLE IF EXISTS Clinic;
DROP TABLE IF EXISTS Patient;
DROP TABLE IF EXISTS Doctor;

--Clinic table
CREATE TABLE Clinic (clinic_id INT PRIMARY KEY, name VARCHAR(100) NOT NULL, adress VARCHAR(255) NOT NULL, phone VARCHAR(20) UNIQUE NOT NULL);

-- Room table (1:M with Clinic)
CREATE TABLE Room (Room_id INT PRIMARY KEY, clinic_id INT NOT NULL, room_number VARCHAR(10) NOT NULL, FOREIGN KEY (clinic_id) REFERENCES Clinic(clinic_id), UNIQUE(clinic_id, room_number));

--Patient table 
CREATE TABLE Patient (patient_id INT PRIMARY KEY, full_name VARCHAR(100) NOT NULL, date_of_birth DATE NOT NULL, gender VARCHAR(10), phone VARCHAR(20) UNIQUE NOT NULL, email VARCHAR(100) UNIQUE);

--Doctor table
CREATE TABLE Doctor (doctor_id INT PRIMARY KEY, full_name VARCHAR(100) NOT NULL, phone VARCHAR(20) UNIQUE NOT NULL, email VARCHAR(100) UNIQUE, clinic_id INT NOT NULL, FOREIGN KEY (clinic_id) REFERENCES Clinic(clinic_id) );

-- Specialization table
CREATE TABLE specialization (doctor_id INT PRIMARY KEY, name VARCHAR(50)UNIQUE NOT NULL);

-- M:N Doctor to Specialization
CREATE TABLE Doctor_Specialization (doctor_id INT, specialization_id INT, PRIMARY KEY (doctor_id, specialization_id),FOREIGN KEY (doctor_id)REFERENCES Doctor(doctor_id), FOREIGN KEY(specialization_id) REFERENCES Specialization(specialization_id));

--Appointment table
CREATE TABLE Appointment (appointment_id INT PRIMARY KEY, patient_id INT NOT NULL, doctor_id INT NOT NULL, room_id INT NOT NULL, appointment_date DATE NOT NULL, appointment_time TIME NOT NULL, status VARCHAR(20) DEFAULT 'Scheduled', FOREIGN KEY(doctor_id) REFERENCES Doctor(doctor_id), FOREIGN KEY (room_id) REFERENCES Room(room_id), UNIQUE (doctor_id, appointment_date, appointment_time),UNIQUE (room_id, appointment_date, appointment_time));


