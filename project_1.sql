CREATE DATABASE TamayozHighSchool;

USE TamayozHighSchool;

CREATE TABLE Student (
	student_id					INT				PRIMARY KEY AUTO_INCREMENT,
	student_name		VARCHAR(255)	NOT NULL,

    birth_date			DATETIME		NOT NULL,
    age					int,
    gender      		ENUM ('M','F')  NOT NULL,  -- Enumeration of either 'M' or 'F'  
    enrollment_date		DATETIME		NOT NULL,
    student_email		VARCHAR(255),
    student_level		INT				NOT NULL,
    track				VARCHAR(255)	NOT NULL,
    GPA					DOUBLE
   );


CREATE TABLE Teacher (
	teacher_id			INT				PRIMARY KEY AUTO_INCREMENT,
	teacher_name		VARCHAR(255)	NOT NULL,
    birth_date			DATETIME		NOT NULL,
    gender      		ENUM ('M','F')  NOT NULL,  -- Enumeration of either 'M' or 'F'  
    teacher_email		VARCHAR(255),
	office_no			CHAR(4)			NOT NULL
    );
    
    
CREATE TABLE Course (
	course_id			INT				PRIMARY KEY AUTO_INCREMENT,
	course_name			VARCHAR(255)	NOT NULL
    );


INSERT INTO Student (student_name, birth_date, age, gender , enrollment_date, student_email, student_level, track, GPA)
VALUES ("Nora", "2005-12-31",16, 'F', "2014-09-11", "nora@tamayoz.edu.sa", 1, "science", 76),
("Maryam", "2006-12-31",17, 'F', "2009-09-11", "maryam@tamayoz.edu.sa", 3, "science", 66),
("Shahad", "2001-12-31",20, 'F', "2011-09-11", "shahad@tamayoz.edu.sa", 2, "science", 89),
("Mohammed", "1999-02-01", 21,'M', "2009-09-11", "mohammed@tamayoz.edu.sa", 4, "humanities", 87),
("Abdulaziz", "2007-12-31",18, 'M', "2006-09-11", "abdulaziz@tamayoz.edu.sa", 5, "science", 90),
("Rashed", "2010-12-31", 15,'M', "2006-09-11", "rashed@tamayoz.edu.sa", 1, "science",92),
("Saud", "2005-12-31",16, 'M', "2011-09-11", "nora@tamayoz.edu.sa", 3, "humanities", 60),
("Nora", "2010-12-31", 18, 'F', "2009-09-11", "nora@tamayoz.edu.sa", 4, "science", 55),
("Sama", "2006-12-31", 19,'F', "2014-09-11", "sama@tamayoz.edu.sa", 1, "humanities", 97),
("Afnan", "2010-12-31", 19,'F', "2014-09-11", "afnan@tamayoz.edu.sa", 6, "science", 100),
("Fatimah", "2012-12-31",19, 'F', "2014-09-11", "fatimah@tamayoz.edu.sa", 1, "science", 76),
("Samar", "2012-12-31",19, 'F', "2014-09-11", "samar@tamayoz.edu.sa", 1, "humanities", 48),
("Raghad", "2012-12-31", 19,'F', "2014-09-11", "raghad@tamayoz.edu.sa", 1, "science", 76),
("Rana", "2012-12-31",19, 'F', "2014-09-11", "rana@tamayoz.edu.sa", 1, "science", 55),
("Asmaa", "2012-12-31",17, 'F', "2009-09-11", "asmaa@tamayoz.edu.sa", 4, "humanities", 62),
("Abrar", "2011-12-31",17, 'F', "2014-09-11", "abrar@tamayoz.edu.sa", 6, "science", 100),
("Sara", "2012-12-31",17, 'F', "2014-09-11", "sara@tamayoz.edu.sa", 1, "humanities", 98),
("Majid", "2010-12-31",18, 'M', "2014-09-11", "majid@tamayoz.edu.sa", 1, "science", 76),
("Saeed", "2005-12-31", 16,'M', "2011-09-11", "saeed@tamayoz.edu.sa", 6, "humanities", 99),
("Aziz", "2004-12-31",14, 'M', "2014-09-11", "aziz@tamayoz.edu.sa", 1, "science", 95),
("Abdullah", "2012-12-31",19, 'M', "2014-09-11", "abdullah@tamayoz.edu.sa", 1, "science", 76),
("Khalid", "2012-12-31", 19,'M', "2014-09-11", "khalid@tamayoz.edu.sa", 1, "humanities", 95),
("Rashed", "2012-12-31",16, 'M', "2014-09-11", "rashed@tamayoz.edu.sa", 1, "science", 42),
("Amal", "2008-12-31",19, 'F', "2008-09-11", "amal@tamayoz.edu.sa", 5, "science", 78),
("saud", "2012-12-31",15, 'M', "2014-09-11", "saud@tamayoz.edu.sa", 1, "humanities", 99),
("Mohammed", "2012-12-31",19, 'M', "2014-09-11", "mohammed@tamayoz.edu.sa", 6, "science", 100),
("Maryam", "2008-12-31",19, 'F', "2006-09-11", "maryam@tamayoz.edu.sa", 3, "humanities", 89),
("Dania", "2012-12-31", 21,'F', "2014-09-11", "dania@tamayoz.edu.sa", 1, "science", 86),
("Shahad", "2011-12-31",18, 'F', "2014-09-11", "shahad@tamayoz.edu.sa", 1, "science", 73),
("Ahmed", "2012-12-31",19, 'M', "2014-09-11", "ahmed@tamayoz.edu.sa", 1, "science", 93);

SELECT * FROM Student;

INSERT INTO Course (course_name)
VALUES ("Art"),
("Algebra"),
("Calculus"),
("Geography"),
("Religion"),
("Chemistry");


-- select all columns from student table 
-- and order the results based on student name in ascending order

SELECT * FROM Student
ORDER BY student_name ASC;

-- update a teacher record

UPDATE Teacher
SET office_no = "AAA"
WHERE teacher_id = 3;


SELECT * FROM Teacher WHERE teacher_id = 3;


INSERT INTO Teacher (teacher_name, birth_date, gender, teacher_email, office_no)
VALUES ("Ahmad", "1987-01-09", 'M', "ahmad@gmail.com", "C312"),
("Ahmad", "1987-01-09", 'M', "ahmad@gmail.com", "B310"),
("Abdullah", "1977-01-09", 'M', "Abdullah@gmail.com", "A120"),
("Shahad", "1997-01-09", 'F', "shahad@gmail.com", "B320"),
("Ahmad", "1988-01-09", 'M', "ahmad@gmail.com", "A115"),
("Dania", "1987-01-09", 'F', "dania@gmail.com", "A312"),
("Aziz", "1978-01-09", 'M', "aziz@gmail.com", "B322"),
("Mohammed", "1987-01-09", 'M', "mohammed@gmail.com", "A123"),
("Sara", "1987-01-09", 'F', "sara@gmail.com", "C320"),
("Nora", "1987-01-09", 'F', "nora@gmail.com", "C312");

SELECT * FROM Teacher;


SELECT student_id, 
student_name AS "First Name",
birth_date, gender,
enrollment_date, student_email, 
student_level, track, GPA
FROM Student;

ALTER TABLE Student_Updated
RENAME TO Student;

SHOW TABLES;

-- select all columns from the student table
SELECT * FROM Student;







