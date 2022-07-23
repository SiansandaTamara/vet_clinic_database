-- Retrieve information from animal table

--Find all animals whose name ends in "mon".
 SELECT * FROM animals WHERE name LIKE '%mon';

--List the name of all animals born between 2016 and 2019.
 SELECT name, date_of_birth FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
 --List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT name,neutered, escape_attempts 
FROM animals WHERE neutered = true 
AND escape_attempts < 3;

--List the date of birth of all animals named either "Agumon" or "Pikachu".
SELECT name, date_of_birth FROM animals 
WHERE name ='Agumon' OR name='Pikachu';

--List name and escape attempts of animals that weigh more than 10.5kg
SELECT name, escape_attempts, weight_kg FROM animals WHERE weight_kg > 10.15;

--Find all animals that are neutered.
SELECT * FROM  animals  WHERE  neutered = true;

--Find all animals not named Gabumon.
SELECT * FROM  animals WHERE name !='Gabumon';

--Find all animals with a weight between 10.4kg and 17.3kg
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;


-- update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change and verify that the species columns went back to the state before the transaction.
BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;
SELECT * FROM animals;

-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
BEGIN;
UPDATE animals SET species = 'digimon' WHERE name  LIKE '%mon';
UPDATE animals SET species ='pokemon' WHERE  species IS null;
COMMIT;
SELECT * FROM animals;

-- delete all records in the animals table, then roll back the transaction.
BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

-- Delete all animals born after Jan 1st, 2022.

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT FIRST_POINT;
UPDATE animals SET weight_kg = weight_kg * (-1);
ROLLBACK TO FIRST_POINT;
UPDATE animals SET weight_kg = weight_kg * (-1) WHERE weight_kg < 0;
COMMIT;
SELECT * FROM animals;

-- Write queries to answer the following questions:
SELECT COUNT(*) as total_animals FROM animals;
SELECT COUNT(*) as zero_escape_attempts FROM animals WHERE escape_attempts = '0';
SELECT AVG(weight_kg) as average_animal_weight FROM animals;
SELECT neutered, MAX(escape_attempts) FROM ANIMALS GROUP BY neutered;
SELECT MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth  BETWEEN '1990-01-01'AND '2000-01-01'  GROUP BY species;

-- Write queries (using JOIN) to answer the following questions: 

    -- What animals belong to Melody Pond?
    SELECT * FROM animals JOIN owners ON animals.owner_id = owners.id AND owners.full_name = 'Melody Pond';
    -- List of all animals that are pokemon (their type is Pokemon).
    SELECT * FROM animals JOIN species ON animals.species_id = species.id AND species.name = 'pokemon';
    -- List all owners and their animals, remember to include those that don't own any animal.
    SELECT * FROM animals RIGHT JOIN owners ON animals.owner_id = owners.id; 
    -- How many animals are there per species?
    SELECT COUNT(*), species.name FROM animals JOIN species on animals.species_id = species.id GROUP BY species.id; 
    -- List all Digimon owned by Jennifer Orwell.
    SELECT * FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id AND owners.full_name = 'Jennifer Orwell' AND species.name ='Digimon';
    -- List all animals owned by Dean Winchester that haven't tried to escape.
    SELECT * FROM animals JOIN owners ON animals.owner_id = owners.id and owners.full_name ='Dean Winchester' and animals.escape_attempts = 0;
    Who owns the most animals?
SELECT owners.full_name, COUNT(animals) FROM owners JOIN animals ON owners.id = animals.owner_id GROUP BY owners.full_name ORDER BY COUNT(animals) DESC LIMIT 1;
