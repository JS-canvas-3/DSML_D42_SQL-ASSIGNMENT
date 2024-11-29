use entri_d42;


CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT,
    JoiningDate DATETIME,
    Department CHAR(25)
);
DELIMITER $$

CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END $$

DELIMITER ;

Call AddWorker(1, 'Ajith', 'Donny', 50000, '2024-11-27 09:00:00', 'HR');

select * from Worker;


-- 2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. Then make the procedure call.
DELIMITER $$

CREATE PROCEDURE GetWorkerSalary(
    IN p_workerId INT,
    OUT p_salary INT
)
BEGIN
    SELECT Salary INTO p_salary
    FROM Worker
    WHERE Worker_Id = p_workerId;
END $$

DELIMITER ;

CALL GetWorkerSalary(1, @salary);
SELECT @salary AS WorkerSalary;

-- 3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. It should update the department of the worker with the given ID. Then make a procedure call.
DELIMITER $$

CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_workerId INT,
    IN p_department CHAR(25)
)
BEGIN
    UPDATE Worker
    SET Department = p_department
    WHERE Worker_Id = p_workerId;
END $$

DELIMITER ;

CALL UpdateWorkerDepartment(1, 'Finance');

--  4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call. 
DELIMITER $$

CREATE PROCEDURE GetWorkerCountByDepartment(
    IN p_department CHAR(25),
    OUT p_workerCount INT
)
BEGIN
    SELECT COUNT(*) INTO p_workerCount
    FROM Worker
    WHERE Department = p_department;
END $$

DELIMITER ;

CALL GetWorkerCountByDepartment('HR', @workerCount);
SELECT @workerCount AS WorkerCount;

-- 5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure.
DELIMITER $$

CREATE PROCEDURE GetAverageSalaryByDepartment(
    IN p_department CHAR(25),
    OUT p_avgSalary DECIMAL(10,2)
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary
    FROM Worker
    WHERE Department = p_department;
END $$

DELIMITER ;

CALL GetAverageSalaryByDepartment('HR', @avgSalary);
SELECT @avgSalary AS AverageSalary;
