USE TamayozHighSchool;


/* a many-to-many relation between teachers and students
	teacher: teaches many students
    student: taught by many teachers */

-- create junction table

CREATE TABLE Teachers_Students(
student_id		INT		NOT NULL,
teacher_id		INT		NOT NULL,
FOREIGN KEY (student_id) REFERENCES Student(student_id),
FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id),
PRIMARY KEY (student_id, teacher_id)
);

-- map teachers to students

INSERT INTO Teachers_Students(student_id, teacher_id)
VALUES (1,2), (2, 5), (3, 9),
(1, 11), (2, 11), (3, 11),
(4, 7), (7, 7), (5, 10);


SELECT * FROM Teachers_Students;


/* a one-to-many relation teachers and courses
	teacher: teaches one course
    course: taught by many teachers */

-- add a foreign key to the teacher table

ALTER TABLE Teacher 
ADD COLUMN course_id 	INT,
ADD FOREIGN KEY (course_id) REFERENCES Course(course_id);

-- update course id for each teacher

UPDATE Teacher SET course_id = 5 WHERE teacher_id = 2;
UPDATE Teacher SET course_id = 5 WHERE teacher_id = 3;
UPDATE Teacher SET course_id = 2 WHERE teacher_id = 4;
UPDATE Teacher SET course_id = 4 WHERE teacher_id = 5;
UPDATE Teacher SET course_id = 1 WHERE teacher_id = 6;
UPDATE Teacher SET course_id = 2 WHERE teacher_id = 7;
UPDATE Teacher SET course_id = 6 WHERE teacher_id = 8;
UPDATE Teacher SET course_id = 3 WHERE teacher_id = 9;
UPDATE Teacher SET course_id = 4 WHERE teacher_id = 10;
UPDATE Teacher SET course_id = 6 WHERE teacher_id = 11;

SELECT * FROM Teacher;


/* a many-to-many relation between students and courses */

-- create junction table

CREATE TABLE Student_Courses(
student_id 		INT		NOT NULL,
course_id 		INT		NOT NULL,
FOREIGN KEY (student_id) REFERENCES Student(student_id),
FOREIGN KEY (course_id) REFERENCES Course(course_id),
PRIMARY KEY (student_id, course_id)
);

-- map students to courses

INSERT INTO Student_Courses(student_id, course_id)
VALUES (1, 6), (2, 4), (3, 3),
(4, 3), (5, 4), (6, 2), 
(7, 3), (8, 1), (9, 5),
(10, 5), (11, 2), (12, 3),
(13, 4), (14, 3), (15, 4),
(16, 1), (17, 1), (18, 3),
(19, 2), (20, 5), (21, 6),
(22, 2), (23, 3), (24, 2),
(25, 1), (26, 1), (27, 2),
(28, 4), (29, 5), (30, 6);


SELECT * FROM Student_Courses;


/* a stored procedure that displays student names
	and the courses each student takes */

DELIMITER //
CREATE PROCEDURE student_info()
BEGIN 
SELECT Student.student_name, Course.course_name
FROM Student_Courses
INNER JOIN Student ON Student.student_id = Student_Courses.student_id
INNER JOIN Course ON Course.course_id = Student_Courses.course_id;
END;


CALL student_info();


/* a view that contains teachers names
	and their office number and courses they teach */

CREATE VIEW teacher_info
AS 
SELECT teacher_name, office_no, Course.course_name
FROM Teacher
INNER JOIN Course ON Course.course_id = Teacher.course_id;

SELECT * FROM teacher_info;

DROP VIEW teacher_info;


/* create an index for student names */

CREATE INDEX student_names_alphabatical2 ON Student(student_name);

SHOW INDEX FROM Student;

SELECT * FROM Student FORCE INDEX (student_names_alphabatical);
DROP INDEX student_names_alphabatical ON Student;
