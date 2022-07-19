/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

-- create animals table
CREATE TABLE animals IF NOT EXISTS(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered  BOOLEAN,
    weight_kg DECIMAL
);

