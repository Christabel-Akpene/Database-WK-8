create database studentRecords;

use studentRecords;

CREATE TABLE department(
dept_id INT AUTO_INCREMENT PRIMARY KEY,
dept_name VARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE studentInformation(
stud_id INT AUTO_INCREMENT PRIMARY KEY,
stud_name VARCHAR(200) NOT NULL,
stud_email VARCHAR(200) UNIQUE NOT NULL,
stud_date_of_birth DATE,
stud_level INT,
dept_id INT,
FOREIGN KEY(dept_id) REFERENCES department(dept_id)
);


CREATE TABLE course(
course_id INT AUTO_INCREMENT PRIMARY KEY,
course_name VARCHAR(100) NOT NULL,
dept_id INT,
FOREIGN KEY(dept_id) REFERENCES department(dept_id)
);

CREATE TABLE lecturer(
lecturer_id INT AUTO_INCREMENT PRIMARY KEY,
lecturer_name VARCHAR(200) NOT NULL,
dept_id INT,
FOREIGN KEY(dept_id) REFERENCES department(dept_id)
);

CREATE TABLE lecturerCourse(
lecturer_course_id INT AUTO_INCREMENT PRIMARY KEY,
lecturer_id INT,
course_id INT,
FOREIGN KEY(lecturer_id) REFERENCES lecturer(lecturer_id),
FOREIGN KEY(course_id) REFERENCES course(course_id)
);

CREATE TABLE enrollment(
enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
enrollment_date DATETIME,
enrollment_status VARCHAR(100) NOT NULL,
course_id INT,
stud_id INT,
FOREIGN KEY(course_id) REFERENCES course(course_id),
FOREIGN KEY(stud_id) REFERENCES studentInformation(stud_id)
);


CREATE TABLE grades(
grades_id INT AUTO_INCREMENT PRIMARY KEY,
score INT,
grades_value VARCHAR(2),
course_id INT,
stud_id INT,
FOREIGN KEY(course_id) REFERENCES course(course_id),
FOREIGN KEY(stud_id) REFERENCES studentInformation(stud_id)
);



