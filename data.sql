
-- Insert data into animals table
INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES('Agumon', '2020-02-03', 0, true, 10.23),('Gabumon', '2018-11-15', 2, true, 8),
       ('Pikachu', '2021-07-01', 1, false, 15.04),('Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals (name, date_of_birth,weight_kg,neutered,escape_attempts )
VALUES ('Charmander','2020-02-08',-11,false,0)  
       (' Plantmon','2021-11-15',-5.7,true,2)   
       ('Squirtle','1993-04-02',-12.13,false,3)
       ('Angemon','2005-06-12',-45,true,1)
       ('Boarmon','2005-06-07',20.4,true,7)
       ('Blossom','1998-10-13',17,true,3)
       ('Ditto','2022-05-14', 22,true,4);

       
-- Inserting data into the owners table:
INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
       ('Jennifer Orwell', 19),
       (' Bob', 45)
       ('Melody Pond', 77),
       ('Dean Winchester', 14),
       ('Jodie Whittaker', 38);

-- Inserting data into the species table: 
INSERT INTO species (name)
VALUES ('Pokemon'),('Digimon');

-- Modify your inserted animals so it includes the species_id value: 
-- If the name ends in "mon" it will be Digimon
UPDATE animals SET species_id = (
    SELECT id FROM species WHERE name= 'Digimon')
    WHERE name LIKE '%mon';
    SELECT * FROM animals;


UPDATE animals SET species_id = (
SELECT id FROM species WHERE name ='Pokemon') 
WHERE name NOT LIKE '%mon';
SELECT * FROM animals;

-- Modify your inserted animals to include owner information (owner_id): 

    -- Sam Smith owns Agumon.
    UPDATE animals SET owner_id =( SELECT id FROM owners WHERE full_name ='Sam Smith') WHERE name = 'Agumon';

    -- Jennifer Orwell owns Gabumon and Pikachu.
    UPDATE animals SET owner_id =( SELECT id FROM owners WHERE full_name ='Jennifer Orwell') WHERE name = 'Gabumon' OR name = 'Pikachu';

    -- Bob owns Devimon and Plantmon.
     UPDATE animals SET owner_id =( SELECT id FROM owners WHERE full_name =' Bob') WHERE name = 'Devimon' OR name = ' Plantmon';
    -- Melody Pond owns Charmander, Squirtle, and Blossom.
    UPDATE animals SET owner_id =( SELECT id FROM owners WHERE full_name ='Melody Pond') WHERE name = 'Blossom' OR name = 'Squirtle' OR name = 'Charmander';
    -- Dean Winchester owns Angemon and Boarmon.
         UPDATE animals SET owner_id =( SELECT id FROM owners WHERE full_name ='Dean Winchester') WHERE name = 'Angemon' OR name = 'Boarmon';
-- UPDATE animals SET owner_id = 5 WHERE name = ' Angemon';
-- UPDATE animals SET name= 'Angemon' date_of_birth ='2005-06-12' weight_kg = -45 neutered =true escape_attempts =1;
--        ('Angemon','2005-06-12',-45,true,1)

-- Insert the following data for vet
INSERT INTO vets (name, age, date_of_graduation)
VALUES('William Tatcher', 45, '2000-04-23'),
      ('Maisy Smith', 26, '2019-01-17'),
      ('Stephanie Mendez', 64, '1981-05-04'),
      ('Jack Harkness', 38, '2008-06-08');

    --Insert the following data for specialties:

    Vet William Tatcher is specialized in Pokemon.
Vet Stephanie Mendez is specialized in Digimon and Pokemon.
Vet Jack Harkness is specialized in Digimon

INSERT INTO specializations (vets_id, species_id)
VALUES (1, 1),
       (3, 2),git 
       (3, 1),
       (4, 2);

-- Insert the following data for visits:

INSERT INTO visits (vets_id, animals_id, date)
VALUES (1, 1, '2020-05-24'),
       (3, 1, '2020-06-22'),
       (4, 2, '2021-02-02'),
       (2, 3, '2020-01-05'),
       (2, 3, '2020-03-08'),
       (2, 3, '2020-05-14'),
       (3, 4, '2021-05-04'),
       (4, 9, '2021-02-24'),
       (2, 10, '2019-12-21'),
       (1, 10, '2020-08-10'),
       (2, 10, '2021-04-07'),
       (3, 11, '2019-09-29'),
       (4, 12, '2020-10-03'),
       (4, 12, '2020-11-04'),
       (2, 13, '2019-01-24'),
       (2, 13, '2019-05-15'),
       (2, 13, '2020-01-27'),
       (2, 13, '2020-08-03'),
       (3, 14, '2020-05-24'),
       (1, 14, '2021-01-11');

--     Blossom visited Stephanie Mendez on May 24th, 2020.
--     Blossom visited William Tatcher on Jan 11th, 2021.

-- Write queries to answer the following:

--     Who was the last animal seen by William Tatcher?
--     How many different animals did Stephanie Mendez see?
--     List all vets and their specialties, including vets with no specialties.
--     List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
--     What animal has the most visits to vets?
--     Who was Maisy Smith's first visit?
--     Details for most recent visit: animal information, vet information, and date of visit.
--     How many visits were with a vet that did not specialize in that animal's species?
--     What specialty should Maisy Smith consider getting? Look for the species she gets the most.