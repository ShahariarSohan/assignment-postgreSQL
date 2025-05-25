-- Active: 1747449241893@@localhost@5432@conservation_db
-----> CREATE DATABASE <--------

CREATE DATABASE conservation_db;

-----> TABLE rangers <--------

CREATE TABLE rangers(
    ranger_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    region TEXT
);

-----> TABLE species <--------

CREATE TABLE species(
   species_id SERIAL PRIMARY KEY,
   common_name VARCHAR(255),
   scientific_name VARCHAR(255),
   discovery_date DATE,
   conservation_status VARCHAR(255)
);
-----> TABLE sightings <--------

CREATE TABLE sightings(
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT,
    FOREIGN KEY (ranger_id)  REFERENCES rangers(ranger_id),
    species_id INT,
    FOREIGN KEY (species_id)  REFERENCES species(species_id),
    sighting_time TIMESTAMP,
    location TEXT,
    notes TEXT
);

-----> INSERT VALUES <--------
DROP TABLE species;
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
       (2 , 1 ,  ' Snowfall Pass', '2024-05-18 18:30:00 ',NULL );

select * from  rangers;      
select * from  species;      
select * from  sightings;

-----> PROBLEM NO 1 <--------

INSERT INTO rangers (name,region)
VALUES ('Derek Fox','Coastal Plains');

----> PROBLEM NO 2 <-------

SELECT  COUNT(DISTINCT species_id) AS  unique_species_count FROM sightings;

----> PROBLEM NO 3 <-------

SELECT * FROM sightings WHERE location LIKE '%Pass%';

----> PROBLEM NO 4 <-------

SELECT name,COUNT(*) AS total_sightings FROM rangers
INNER JOIN sightings USING (ranger_id) GROUP BY ranger_id;

----> PROBLEM NO 5<-------

SELECT common_name FROM species
FULL JOIN sightings USING(species_id) WHERE sighting_id IS NULL;

----> PROBLEM NO 6<-------

SELECT common_name,sighting_time,name FROM rangers 
JOIN sightings USING (ranger_id)
JOIN species USING (species_id)
ORDER  BY sighting_time DESC
LIMIT 2;

----> PROBLEM NO 7<-------

UPDATE species
SET conservation_status='Historic'
WHERE EXTRACT(YEAR FROM discovery_date) < 1800;

----> PROBLEM NO 8<-------


 

----> PROBLEM NO 9<-------

 DELETE FROM rangers
 WHERE ranger_id IN (SELECT ranger_id FROM rangers
 FULL JOIN sightings USING (ranger_id)
 WHERE sighting_id IS NULL);


-------->  END  <----------------