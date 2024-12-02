use entri_d42;
-- Create teachers table.
CREATE TABLE teachers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    subject VARCHAR(50),
    experience INT,
    salary DECIMAL(10, 2)
);

-- Insert rows into teachers table. 
INSERT INTO teachers (name, subject, experience, salary) VALUES
('Alice', 'Mathematics', 5, 50000),
('Bibin', 'Science', 8, 55000),
('Ramesh', 'English', 3, 45000),
('Divya', 'History', 12, 60000),
('Emilin', 'Physics', 10, 70000),
('Francis', 'Chemistry', 7, 52000),
('Grace', 'Biology', 9, 56000),
('Hari', 'Computer Science', 6, 58000);

-- 2. Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative” if the salary inserted to the table is less than zero.
CREATE TABLE teacher_log (
    id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_id INT,
    action VARCHAR(50),
    action_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (teacher_id) REFERENCES teachers(id)
);

DELIMITER $$

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END;
$$

DELIMITER ;

SHOW triggers;
INSERT INTO teachers VALUES (9,'Manoj','Hindi',4,-25000);
Select * from teachers;

-- 3. Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, timestamp to a table called teacher_log when a new entry gets inserted to the teacher table. tecaher_id -> column of teacher table, action -> the trigger action, timestamp -> time at which the new row has got inserted. 
DELIMITER $$

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action) 
    VALUES (NEW.id, 'INSERT');
END;
$$

DELIMITER ;

INSERT INTO teachers (name ,subject, experience, salary)
 VALUES ('Manoj','Hindi',5, 35000);
 Select * from teachers;
 
 -- 4. Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years.
 DELIMITER $$

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete a teacher with more than 10 years of experience';
    END IF;
END;
$$

DELIMITER ;

DELETE from teachers WHERE id = 4;

-- 5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.
DELIMITER $$

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action) 
    VALUES (OLD.id, 'DELETE');
END;
$$

DELIMITER ;

DELETE from teachers WHERE id =1;
Select * from teacher_log;

 