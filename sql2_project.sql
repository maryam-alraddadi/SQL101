 USE TamayozHighSchool;

 /* create a new table containing student records 
 with GPA > 90 */

CREATE TABLE Excellent_Students
SELECT * FROM Student 
WHERE GPA > 90;

SELECT * FROM Excellent_Students;

/* create a new table containing student records 
 with GPA < 60 */
 
CREATE TABLE Failed_Students
SELECT * FROM Student 
WHERE GPA < 60;

SELECT * FROM Failed_Students;


/* Display student names starting with A */

SELECT student_name FROM Student
WHERE student_name LIKE 'A%';


/* Display student names that 
	are 4 letters long */

SELECT student_name FROM Student
WHERE student_name LIKE '____';


/* Display the average, min, max GPA of all students */

SELECT AVG(GPA) AS "Average GPA",
MIN(GPA) AS "Minimum GPA",
MAX(GPA) AS "Maximum GPA"
FROM Student;

/* Display level 6 students with GPA of 100 */

SELECT student_name FROM Student
WHERE student_level = 6 
AND GPA = 100;


SELECT * FROM Student
WHERE student_level = 1 
AND birth_date BETWEEN "2004-1-1" AND "2005-12-31";


SELECT COUNT(student_id) AS "Level 2 Students"
FROM Student
WHERE student_level = 2;

 SELECT DISTINCT track FROM Student;


SELECT UPPER(course_name) FROM Course;


SELECT FLOOR(AVG(GPA)) AS "Aerage GPA Rounded" 
FROM Student;


SELECT student_id, student_name,
REPLACE(REPLACE(gender,'M','Male'),'F','Female')
FROM Student;


UPDATE Student
SET GPA = GPA + 5
WHERE GPA < 60;

 SELECT * FROM Student WHERE GPA < 60;




