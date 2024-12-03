use entri_d42;
-- ASSIGNMENT --
-- Sorting And Grouping Data --

CREATE TABLE Countrys (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(50),
    Population INT,
    Area INT
);

CREATE TABLE Person (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating DECIMAL(2, 1),
    Country_Id INT,
    Country_name VARCHAR(50),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);

-- Insert data into Countrys table.
INSERT INTO Countrys (Id, Country_name, Population, Area) VALUES
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

-- Insert data into Person table.
INSERT INTO Person (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'James', 'Muller', 331008620, 4.5, 1, 'USA'),
(2, 'Ancy', 'Smith', 37742000, 3.9, 2, 'Canada'),
(3, 'Mardona', 'Zhusi', 180425000, 4.8, 3, 'SPAIN'),
(4, 'Emma', 'Jones', 67886000, 4.2, 4, 'UK'),
(5, 'Liam', 'Brown', 25499000, 3.5, 5, 'Australia'),
(6, 'Sheena', 'Das', 83783900, 4.7, 6, 'Germany'),
(7, 'Lucas', 'Wilson', 65273500, 3.8, 7, 'France'),
(8, 'Isabella', 'Martinez', 142476000, 4.6, 8, 'Japan'),
(9, 'Mia', 'Taylor',  145987000, 4.9, 9, 'Russia'),
(10, 'Hanis', 'Abdhulla', 112559000, 3.7, 10, 'UAE'),
(11, 'Oliver', NULL, 500000, 4.1, 1, 'USA'),
(12, 'Johny', NULL, 100000, 3.6, 2, 'India');

-- 1. Write an SQL query to print the first three characters of Country_name from the Country table.
SELECT left(Country_name , 3) AS Firstthreechar FROM Countrys;

-- 2. Write an SQL query to concatenate first name and last name from Persons table.
SELECT concat(Fname, " ", Lname) AS Fullname FROM Person;

-- 3. Write an SQL query to count the number of unique country names from Persons table.
SELECT COUNT(DISTINCT Country_name) AS UniqueCountryCount FROM Person;

-- 4. Write a query to print the maximum population from the Country table.
SELECT max(Population) AS Max_population FROM  Countrys;

-- 5. Write a query to print the minimum population from Persons table.
SELECT min(Population) AS Min_population FROM Person;

-- 6.  Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table.
INSERT INTO Person (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(13, 'Irene', NULL, 450000, 4.3, 1, 'USA'),
(14, 'Litty', NULL, 120000, 3.8, 2, 'Canada');
SELECT count(Lname) AS Lnamecount FROM Person;

-- 7. Write a query to find the number of rows in the Persons table.
SELECT count(*) AS Numberofpersons FROM Person;

-- (Hint: Use LIMIT) 
-- 8. Write an SQL query to show the population of the Country table for the first 3 rows.
SELECT Population FROM Countrys LIMIT 3;

-- (Hint: Use rand() function and LIMIT)
-- 9. Write a query to print 3 random rows of countries.
SELECT * FROM Countrys ORDER BY RAND() LIMIT 3;
 
-- 10. List all persons ordered by their rating in descending order.
SELECT * FROM Persons  ORDER BY  rating DESC;

-- 11.  Find the total population for each country in the Persons table.
SELECT Country_name , sum(Population) AS Total_Population FROM Person GROUP BY Country_name;

-- 12. Find countries in the Persons table with a total population greater than 50,000.
SELECT Country_name , sum(Population) AS Total_Population FROM Person GROUP BY Country_name HAVING sum(Population)>50000;

-- 13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.
SELECT Country_name , count(*) AS Total_Person , avg(rating) AS Avgrating FROM Person GROUP BY Country_name HAVING count(*)>2  ORDER BY Avgrating ASC;

