-- Active: 1747449241893@@localhost@5432@conservation_db
-- create a database
CREATE DATABASE conservation_db;
-- import -------> I have used backticks(``) for all tables and columns name.
--create table `rangers`
CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    region TEXT
);

-- create table `species`
CREATE TABLE species(
   species_id SERIAL PRIMARY KEY,
   common_name VARCHAR(255),
   scientific_name VARCHAR(255),
   discovery_date DATE,
   conservation_status VARCHAR(255)
);
-- create table `sightings`
CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(ranger_id),
    species_id INT REFERENCES species(species_id),
    sighting_time TIMESTAMP,
    location TEXT,
    notes TEXT
);

-- insert values 
INSERT INTO rangers (name,region)
VALUES ('Alice Green','Northern Hills'),
       ('Bob White','River Delta'),
       ('Carol King','Mountain Range');
INSERT INTO species(common_name,scientific_name,discovery_date,conservation_status)
VALUES('Snow Leopard ', 'Panthera uncia ', '1775-01-01', 'Endangered'),
      ('Bengal Tiger ' , 'Panthera tigris', '1758-01-01', 'Endangered'),
      ('Red Panda', 'Ailurus fulgens', '1825-01-01','Vulnerable'),
      ('Asiatic Elephant' ,'Elephas maximus indicus', '1758-01-01','Endangered');

INSERT INTO sightings(ranger_id,species_id,location,sighting_time,notes)
VALUES( 1 , 1,  'Peak Ridge', '2024-05-10 07:45:00 ', 'Camera trap image captured'),
       (2 , 2,  ' Bankwood Area','2024-05-12 16:20:00', 'Juvenile seen'),
       (3 , 3 ,  'Bamboo Grove East' ,' 2024-05-15 09:10:00', 'Feeding observed' ),
       (1 , 2 ,  ' Snowfall Pass', '2024-05-18 18:30:00 ',NULL );

select * from  rangers;      
select * from  species;      
select * from  sightings;
-----> PROBLEM NO 1 <--------
INSERT INTO rangers (name,region)
VALUES ('Derek Fox','Coastal Plains');
----> PROBLEM NO 2 <-------
