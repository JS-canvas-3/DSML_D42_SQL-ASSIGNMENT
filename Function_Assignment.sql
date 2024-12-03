use entri_d42;
 -- ASSIGNAMENT --- 
 --#Function---
 
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

-- 1. Add a new column called DOB in Persons table with data type as Date. 
ALTER TABLE Persons ADD DOB DATE;

 -- 2. Write a user-defined function to calculate age using DOB. 
 DELIMITER $$
 CREATE FUNCTION CalculateAge (DOB DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN TIMESTAMPDIFF(YEAR, DOB, CURDATE());
END; $$
DELIMITER ;

-- 3. Write a select query to fetch the Age of all persons using the function that has been created. 
SELECT id, fname, DOB, CalculateAge(DOB) AS Age FROM Persons;

-- 4. Find the length of each country name in the Country table.
SELECT country_name, LENGTH(country_name) AS name_length FROM Country;

 -- 5. Extract the first three characters of each country's name in the Country table.
 SELECT country_name, SUBSTRING(country_name, 1, 3) AS first_three_chars FROM Country;
 
 -- 6. Convert all country names to uppercase and lowercase in the Country table.
 SELECT country_name, UPPER(country_name) AS country_name_upper,LOWER(country_name) AS country_name_lower FROM Country;
