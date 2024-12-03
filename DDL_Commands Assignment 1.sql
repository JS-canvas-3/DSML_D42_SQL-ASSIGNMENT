CREATE DATABASE School;

use School;
-#Create table Student with Roll_No, Name , Marks , Grade
CREATE TABLE STUDENT (                        
    Roll_No INT PRIMARY KEY,
    Name VARCHAR(100),
    Marks INT,
    Grade CHAR(5)
);

-#INSERT the values into student table 
INSERT INTO STUDENT (Roll_No, Name, Marks, Grade) VALUES
(1, 'Alice', 85, 'A'),
(2, 'Bob', 78, 'B'),
(3, 'Charlie', 92, 'A'),
(4, 'David', 67, 'C');

-#Display the table using SELECT
SELECT * FROM STUDENT;

-#Add a column named Contact to the STUDENT table
ALTER table student add contact varchar(15);

-#Remove the Grade column from the STUDENT table
ALTER TABLE STUDENT DROP COLUMN Grade;

-#Rename the STUDENT table to CLASSTEN
ALTER TABLE student RENAME  to CLASSTEN;

-#Delete all rows from the CLASSTEN table
TRUNCATE TABLE CLASSTEN;

-#Remove the CLASSTEN table from the database
DROP TABLE CLASSTEN;






