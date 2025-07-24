# 🎓 Student Result Processing System – Day 1

## 🔰 Day 1: Database Planning & Design

This repository contains the foundational database schema and ER model for the **Student Result Processing System** project.

---

## 🎯 Objectives
- Design a normalized relational database system to manage:
  - Student information
  - Course registration
  - Marks and grade calculation
  - GPA & CGPA computation

---

## 📋 Tasks Completed

✅ **1. Requirement Understanding**
- Identify core entities: Students, `Courses,Results, Grades, StudentCourses,Semester
- Attributes like: `marks`, `grades`, `exam_type`, `credit_hours`

✅ **2. ER Diagram Created**
- ER model shows relationships:
  - One-to-many (Students → Results)
  - Many-to-many (Students ↔ Courses via `StudentCourses`)
  - Grade table used for calculating GPA from marks

✅ **3. Table Design & Schema**
- Created the following tables:
  - Students
  - Courses
  - Semester
  - StudentCourses (Enrollment)
  - Results
  - Grades
  - GPA

✅ **4. Relationships**
- Primary Keys and Foreign Keys defined for referential integrity

---

## 🗂️ Files in this Repo

| File Name             | Description                                 |
|----------------------|----------------------------------------------|
| schema.sql           | SQL script to create all required tables     |
| er-diagram.png       | Exported EER diagram from MySQL Workbench    |
| README.md            | This file – project overview and Day 1 plan  |

---

## 🛠 Tools Used
- MySQL Workbench
- ER Diagram Designer (Workbench canvas)

---

## 📌 Notes
- Schema is normalized to avoid redundancy
- Designed for scalability (future semester-wise GPA tracking, etc.)

---

## 👨‍💻 Created By

**Umer Mansuri**  
Intern @ Elevate Labs | July 2025


# 🎓 Student Result Processing System – Day 2

## 🔰 Day 2: Insert Data + Views

This part of the project focuses on inserting data into the database, executing JOIN-based queries, and creating reusable views to analyze student performance.

---

## 🎯 Objectives

- Insert sample data into all relational tables
- Use JOINs for reporting and analysis
- Create **Views** for simplified query access
- Add **advanced SQL operations** using aggregates and subqueries

---

## 📋 Tasks Completed

### ✅ 1. Data Insertion
All tables populated using INSERT INTO:
- Students
- Courses
- Semester
- StudentCourses
- Results
- Grades

✅ All data saved in data.sql

---

### ✅ 2. Queries with JOINs
Created complex SELECT queries for:

- Student-wise subject performance  
- Course-wise average, max, min marks  
- Exam-type filters (e.g., Final only)  
- GPA computation using `Grades` table  
- Listing students who failed  
- Course toppers using subqueries

✅ All queries saved in queries_day2.sql

---

### ✅ 3. Views Created

| View Name                 | Description                                      |
|-------------------------  |--------------------------------------------------|
| view_student_results      | Full result details per student per subject      |
| view_course_performance   | Avg marks and attempts per course                |
| view_distinction_students | Students who scored 75+ in any subject          |

✅ View scripts are also saved in `queries_day2.sql`

---

## 💡 Advanced Queries Added

- 📌 **Topper Selection** – Highest scorer in each subject  
- 📌 **GPA Calculation** – Average grade point using JOIN + GROUP BY  
- 📌 **Failed Students** – Students scoring less than 40 marks  
- 📌 **Final Exam Only** – Filtering exam results by type  
- 📌 **View for Distinction Students** – Marks ≥ 75

---

## 🗂️ Files in this Repo

| File Name           | Description                                        |
|---------------------|----------------------------------------------------|
| data.sql            | Insert data for all tables                         |
| queries_day2.sql    | SELECT + JOIN queries + all views                  |
| README.md           | This project overview for Day 2                    |


---

## 🛠 Tools Used

- MySQL Workbench
---

## 👨‍💻 Created By

**Umer Mansuri**  
Intern @ Elevate Labs | July 2025

## 🔰 Day 3 – Stored Procedures, GPA Calculation & Summary Views

## 🎯 Objectives

- Create and execute a Stored Procedure to calculate grades based on marks.
- Use CASE statements for GPA logic.
- Generate a summary view showing student performance and GPA.
- Understand procedural SQL and modular query design.

## ✅ Tasks Completed
## 1. 🔁 Stored Procedure: Calculate_Grades()
Automatically assigns grades based on the marks a student received using SQL CASE.


DELIMITER //
CREATE PROCEDURE Calculate_Grades()
BEGIN 
	UPDATE results
    SET grades = (
		CASE 
			WHEN marks_obained >=90 THEN 'A+'	
            WHEN marks_obained >=80 THEN 'A'
            WHEN marks_obained >=70 THEN 'B+'
            WHEN marks_obained >=60 THEN 'B'
			WHEN marks_obained >=50 THEN 'C'
			WHEN marks_obained >=40 THEN 'D'
			ELSE 'F'
		END
	);
END //
DELIMITER ;

✅ Called using: CALL Calculate_Grades();
## 2. 📊 GPA Calculation View: GPA_View
Calculates GPA per student by converting grades to grade points using SQL CASE.


CREATE VIEW GPA_View AS
SELECT 
    Student_id,
    ROUND(AVG(
        CASE grade
            WHEN 'A+' THEN 10
            WHEN 'A' THEN 9
            WHEN 'B+' THEN 8
            WHEN 'B' THEN 7
            WHEN 'C' THEN 6
            WHEN 'D' THEN 5
            ELSE 0
        END
    ), 2) AS GPA
FROM Results
GROUP BY Student_id;

✅ Result: Each student’s GPA based on all subjects
## 3. 📄 Summary View: result_summary
Displays student ID, name, and GPA by joining Students and Results:

CREATE VIEW result_summary AS
SELECT 
    s.Stud_ID,
    s.name,
    ROUND(AVG(
        CASE r.grade
            WHEN 'A+' THEN 10
            WHEN 'A' THEN 9
            WHEN 'B+' THEN 8
            WHEN 'B' THEN 7
            WHEN 'C' THEN 6
            WHEN 'D' THEN 5
            ELSE 0
        END
    ), 2) AS GPA
FROM Students s
JOIN Results r ON s.Stud_ID = r.Student_id
GROUP BY s.Stud_ID, s.name;

## 💾 Files in This Repo

- procedures.sql – SQL stored procedure for GPA & grade update
- views.sql – GPA view and result summary view
- README.md – Day 3 overview and logic explanation

## 🧠 Concepts Used

- SQL Stored Procedures (CREATE PROCEDURE)
- CASE-based GPA logic
- Aggregate functions with GROUP BY
- SQL Views for modular reporting

## 🛠 Tools Used

- MySQL Workbench
- SQL Scripting Console
- ER Diagram + SQL Views Panel

## 👨‍💻 Created By

**Umer Mansuri**  
Intern @ Elevate Labs | July 2025


## 🔰 Day 4 – Ranking, Reporting & Advanced Analysis

## 🎯 Objectives

- Use SQL Window Functions like RANK() to assign GPA rankings.
- Create multiple summary views for performance reporting.
- Add logic to track failed students and toppers.
- Generate views for reporting and insights.

## ✅ Tasks Completed
## 1. 🏆 GPA Rank Using RANK()

Query to compute GPA for all students and rank them using RANK() window function.


SELECT s.Stud_ID, s.name, 
ROUND(AVG(
    CASE r.grade
        WHEN 'A+' THEN 10
        WHEN 'A' THEN 9
        WHEN 'B+' THEN 8
        WHEN 'B' THEN 7
        WHEN 'C' THEN 6
        WHEN 'D' THEN 5
        ELSE 0
    END), 2) AS GPA,
RANK() OVER (ORDER BY AVG(
    CASE r.grade
        WHEN 'A+' THEN 10
        WHEN 'A' THEN 9
        WHEN 'B+' THEN 8
        WHEN 'B' THEN 7
        WHEN 'C' THEN 6
        WHEN 'D' THEN 5
        ELSE 0
    END) DESC) AS GPA_Rank
FROM Students s
JOIN Results r ON s.Stud_ID = r.Student_id
GROUP BY s.Stud_ID, s.name;

## 2. 🥇 View: Top 3 Students
Displays top 3 GPA-ranked students in a view.

CREATE VIEW top_3_students AS
SELECT *
FROM result_summary
ORDER BY GPA DESC
LIMIT 3;

## 3. ❌ View: Failed Students
Lists students who failed (marks < 40) in any subject.

CREATE VIEW failed_students AS
SELECT s.Stud_ID, s.name, r.marks_obained
FROM Students s
JOIN Results r ON s.Stud_ID = r.Student_id
WHERE r.marks_obained < 40;

## 4. 🧠 View: Subject Toppers
Identifies highest scorers per subject.

CREATE VIEW subject_toppers AS
SELECT r.Course_id, r.Student_id, r.marks_obained
FROM Results r
WHERE r.marks_obained = (
    SELECT MAX(marks_obained)
    FROM Results r2
    WHERE r2.Course_id = r.Course_id
);

## 📁 Files in This Repo

- rank_queries.sql – RANK(), GPA Topper, Subject Toppers
- views_day4.sql – Views: top_3_students, failed_students, subject_toppers
- README.md – Day 4 documentation (this file)

## 🛠 Tools Used

- MySQL Workbench
- MySQL Server
- SQL Console & ER Tool

## 👨‍💻 Created By

**Umer Mansuri**  
Intern @ Elevate Labs | July 2025




