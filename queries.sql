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