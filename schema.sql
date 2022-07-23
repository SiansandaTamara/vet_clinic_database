/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

-- create animals table
CREATE TABLE animals(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INT,
    neutered  BOOLEAN,
    weight_kg DECIMAL
);

ALTER TABLE animals ADD species varchar(200);

CREATE TABLE owners (
id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
full_name VARCHAR(150) NOT NULL,
age INT NOT NULL
);

CREATE TABLE species (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(150) NOT NULL
);

-- Remove column species
ALTER TABLE animals DROP species;

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals ADD CONSTRAINT species_id FOREIGN KEY(species_id) REFERENCES species(id);

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals ADD CONSTRAINT owner_id FOREIGN KEY(owner_id) REFERENCES owners(id);

-- create vets tables

CREATE TABLE vets (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(200) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE NOT NULL
);

-- specialization table
CREATE TABLE specializations (
   id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
   vets_id INT NOT NULL,
   species_id INT NOT NULL,
   FOREIGN KEY(vets_id) REFERENCES vets(id) ON DELETE RESTRICT ON UPDATE CASCADE,
   FOREIGN KEY(species_id) REFERENCES species(id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE visits (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    vets_id INT NOT NULL,
    animals_id INT NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY(vets_id) REFERENCES vets(id) ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY(animals_id) REFERENCES animals(id) ON DELETE RESTRICT ON UPDATE CASCADE
);