use entri_d42;
 -- ASSIGNAMENT --- 
 --#Joins and Union---
 
 CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(2, 1),
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

--#Insert data into Country table.

INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 331008620, 9834000),
(2, 'Canada', 37742000, 9985000),
(3, 'SPAIN', 180425000, 3287000),
(4, 'UK', 67886000, 243610),
(5, 'Australia', 25499000, 7692000),
(6, 'Germany', 83783900, 357022),
(7, 'France', 65273500, 551695),
(8, 'Japan', 142476000, 377975),
(9, 'Russia', 145987000, 17098242),
(10, 'UAE', 112559000, 8515767);

--#Insert data into person table.
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'James', 'Muller', 331008620, 4.5, 1, 'USA'),
(2, 'Ancy', 'Smith', 37742000, 3.9, 2, 'Canada'),
(3, 'Mardona', 'Zhusi', 180425000, 4.8, 3, 'SPAIN'),
(4, 'Emma', 'Jones', 67886000, 4.2, 4, 'UK'),
(5, 'Liam', 'Brown', 25499000, 3.5, 5, 'Australia'),
(6, 'Sheena', 'Das', 83783900, 4.7, 6, 'Germany'),
(7, 'Lucas', 'Wilson', 65273500, 3.8, 7, 'France'),
(8, 'Isabella', 'Martinez', 142476000, 4.6, 8, 'Japan'),
(9, 'Mia', 'Taylor',  145987000, 4.9, 9, 'Russia'),
(10, 'Hanis', 'Abdhulla', 112559000, 3.7, 10, 'UAE');

-- 1. Perform inner join, Left join, and Right join on the tables.
-- Inner Join.
SELECT persons.fname, country.country_name, persons.rating
FROM Persons 
INNER JOIN Country ON persons.country_id = country.id;

-- Left Join.
SELECT Persons.fname, Country.country_name, Persons.rating
FROM Persons
LEFT JOIN Country ON Persons.country_id = Country.id;

-- Right Join.
SELECT Persons.fname, Country.country_name, Persons.rating
FROM Persons
RIGHT JOIN Country ON Persons.country_id = Country.id;

-- 2. List all distinct country names from both the Country and Persons tables.
SELECT DISTINCT country_name FROM Country
UNION
SELECT DISTINCT country_name FROM Persons;

-- 3.List all country names from both the Country and Persons tables, including duplicates.
SELECT country_name FROM Country
UNION ALL
SELECT country_name FROM Persons;

-- 4. Round the ratings of all persons to the nearest integer in the Persons table.
SELECT id, fname, country_id, ROUND(rating) AS rounded_rating
FROM Persons;

Set sql_safe_Updates = 0;
 UPDATE Persons 
SET rating = ROUND(rating);
