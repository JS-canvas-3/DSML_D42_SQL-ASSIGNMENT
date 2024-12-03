use entri_d42;

CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    DOB DATE,
    Age INT CHECK (Age > 0),
    Last_Update TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL
);

INSERT INTO Managers (Manager_Id, First_Name, Last_Name, DOB, Age, Gender, Department, Salary) VALUES
(1, 'John', 'Smith', '1980-03-15', 44, 'M', 'HR', 30000),
(2, 'Aaliya', 'Thomas', '1985-06-25', 39, 'F', 'Finance', 27000),
(3, 'Robert', 'Baiju', '1992-11-05', 32, 'M', 'IT', 40000),
(4, 'Emma', 'Johnson', '1988-02-10', 36, 'F', 'IT', 24000),
(5, 'Daniel', 'Wilson', '1979-07-20', 45, 'M', 'Sales', 28000),
(6, 'Margret', 'Mathew', '1990-08-30', 34, 'F', 'IT', 35000),
(7, 'Olivia', 'Joseph', '1995-04-14', 29, 'F', 'Finance', 20000),
(8, 'Linta', 'Tanson', '1982-09-17', 42, 'M', 'IT', 33000),
(9, 'Luther', 'Antony', '1984-12-21', 40, 'M', 'HR', 25000),
(10, 'Maya', 'Menon', '1993-05-06', 31, 'F', 'Sales', 27000);

--#Write a query that retrieves the name and date of birth of the manager with Manager_Id 1.

SELECT First_Name, Last_Name, DOB FROM Managers WHERE Manager_Id = 1;

--#Write a query to display the annual income of all managers.

SELECT Manager_Id, First_Name, Last_Name, (Salary * 12) AS Annual_Income FROM Managers;

--#Write a query to display records of all managers except ‘Aaliya’.

SELECT * FROM Managers WHERE First_Name != 'Aaliya';

--#Write a query to display details of managers whose department is IT and earns more than 25000 per month.

SELECT * FROM Managers WHERE Department = 'IT' AND Salary > 25000;

--# Write a query to display details of managers whose salary is between 10000 and 35000.

SELECT * FROM Managers WHERE Salary BETWEEN 10000 AND 35000;

--# Extra Question & Answers for DML Commands.
--# Write a query to displau update salary of a specific  manager by manager_id.

UPDATE Managers SET Salary = 32000 WHERE Manager_Id = 5;
SELECT * FROM Managers;

--#Write a query to delete a managers record by managers_ID.
DELETE FROM Managers WHERE Manager_id = 10;
SELECT * FROM Managers;

--#Write a qurey to add a new column Joining_Date to track when each manager joined.
ALTER TABLE Managers ADD Joining_Date DATE;
SELECT * FROM Managers;

--#Write a query to increase salary for all managers in a specific department by a certain percentage.
UPDATE Managers SET Salary = Salary *1.10 WHERE Department = "IT";
SET SQL_SAFE_UPDATES = 0;
SELECT * FROM Managers;
