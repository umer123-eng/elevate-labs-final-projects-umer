-- 1. Create Database
CREATE DATABASE Student_Result_Processing_System;

USE Student_Result_processing_System;

-- 2. Students Table
CREATE TABLE Students(
	Stud_ID INT PRIMARY KEY,
    name VARCHAR(100),
    brith_date DATE,
    contact_no VARCHAR(10),
    society VARCHAR(100),
    city VARCHAR(50),
    pincode VARCHAR(10)
);

DESC Students;

-- 3. Semester Table
CREATE TABLE Semester (
    semester_id INT PRIMARY KEY,
    semester_name VARCHAR(50) 
);
DESC Semester;

-- 4. Courses Table (linked to Semester)
CREATE TABLE Courses (
    Course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    credit_hours INT,
    semester_id INT,
    faculty_name VARCHAR(100),
    FOREIGN KEY (semester_id) REFERENCES Semester(semester_id)
);

 DESC Courses;
 
 -- 5. StudentCourses (enrollment table)
CREATE TABLE StudentCourses (
	Student_id INT,
    Course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (Student_id) REFERENCES Students(Stud_ID),
    FOREIGN KEY (Course_id) REFERENCES Courses(Course_id),
    PRIMARY KEY (Student_id,Course_id)
    );
 
 DESC studentCourses;
 
 -- 6. Results Table
 CREATE TABLE Results (
	result_id INT PRIMARY KEY,
    Student_id INT,
    Course_id INT,
    marks_obained INT,
    grade VARCHAR(2),
    exam_type VARCHAR(50),
    exam_date DATE,
    FOREIGN KEY (Student_id) REFERENCES Students(Stud_ID),
	FOREIGN KEY (Course_id) REFERENCES Courses(Course_id)
 );
 
 DESC Results;
 
 


-- 7. Grades Table (for grade ranges and GPA logic)
 CREATE TABLE Grades (
	grade VARCHAR(2) PRIMARY KEY,
    min_marks INT,
    max_marks INT,
    grade_point FLOAT
 );
 
 DESC Grades;
 
 -- 8. GPA Table (optional: to store computed GPA/CGPA)
 CREATE TABLE GPA (
    student_id INT,
    semester_id INT,
    gpa DECIMAL(4,2),
    cgpa DECIMAL(4,2),
    PRIMARY KEY (student_id, semester_id),
    FOREIGN KEY (student_id) REFERENCES Students(stud_ID),
    FOREIGN KEY (semester_id) REFERENCES Semester(semester_id)
);

DESC GPA;

 
 