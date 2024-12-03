use entri_d42;
 -- ASSIGNAMENT --- 
 --#Quering Data---
 
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


-- 1. List the distinct country names from the Persons table.
SELECT distinct Country_name FROM Persons;

-- 2. Select first names and last names from the Persons table with aliases.
SELECT Fname AS Firstname, Lname AS Lastname  FROM Persons;

-- 3. Find all persons with a rating greater than 4.0.
SELECT * FROM Persons WHERE rating > 4.0;

-- 4. Find countries with a population greater than 10 lakhs.
SELECT * FROM Country WHERE Population > 1000000;

-- 5. Find persons who are from 'USA' or have a rating greater than 4.5.
SELECT * FROM Persons WHERE Country_name = 'USA' OR rating > 4.5;

-- 6. Find all persons where the country name is NULL. 
SELECT * FROM Persons WHERE Country_name is null;

-- 7. Find all persons from the countries 'USA', 'Canada', and 'UK'.
SELECT * FROM Persons WHERE Country_name IN ( 'USA', 'Canada', 'UK');

-- 8. Find all persons not from the countries 'India' and 'Australia'.
SELECT * FROM Persons WHERE Country_name NOT IN ('India' , 'Australia');

-- 9. Find all countries with a population between 5 lakhs and 20 lakhs.
SELECT * FROM  Country WHERE Population BETWEEN 500000 AND 2000000;

-- 10. Find all countries whose names do not start with 'C'.
SELECT * FROM Country WHERE Country_name NOT LIKE 'C%';