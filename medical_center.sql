DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE doctors(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE patients(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE diagnosis(
  id SERIAL PRIMARY KEY,
  disease TEXT NOT NULL
);

CREATE TABLE visit(
    id SERIAL PRIMARY KEY,
    visit_date DATE NOT NULL,
    patient_id INT NOT NULL REFERENCES patients ON DELETE CASCADE,
    doctor_id INT NOT NULL REFERENCES patients ON DELETE CASCADE,
    diagonsis_id INT
);