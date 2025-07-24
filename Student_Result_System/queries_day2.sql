--  Student Performance per Subject
SELECT 
	s.name AS Student_Name,
    c.Course_name,
    r.marks_obained,
    r.grade,
    r.exam_type,
    r.exam_date
FROM results r
JOIN students s ON r.Student_id = s.Stud_ID
JOIN courses c ON r.Course_id = c.Course_id;



-- Course-Wise Marks
SELECT 
c.course_name,
	AVG(r.marks_obained) AS avg_marks,
	MIN(r.marks_obained) AS lowest_marks,
	MAX(r.marks_obained) AS highest_marks
FROM results r
JOIN courses c ON r.Course_id = c.Course_id
GROUP BY c.course_name;

-- Filtered Results by Exam Type
SELECT 
    s.name AS Student_Name,
    c.course_name,
    r.exam_type,
    r.marks_obained
FROM Results r
JOIN Students s ON s.stud_id = r.student_id
JOIN Courses c ON c.course_id = r.course_id
WHERE r.exam_type = 'Midterm';

-- Course Topper
SELECT 
    s.name AS Topper,
    c.course_name,
    r.marks_obained
FROM Results r
JOIN Students s ON s.stud_id = r.student_id
JOIN Courses c ON c.course_id = r.course_id
WHERE r.marks_obained = (
    SELECT MAX(marks_obained)
    FROM Results r2
    WHERE r2.course_id = r.course_id
);

-- Students Who Failed (Marks < 80)
SELECT 
    s.name, 
    c.course_name, 
    r.marks_obained
FROM Results r
JOIN Students s ON r.student_id = s.stud_id
JOIN Courses c ON r.course_id = c.course_id
WHERE r.marks_obained < 80;

-- Average GPA by Student (Using  Query)
SELECT 
    s.name, 
    AVG(g.grade_point) AS average_gpa
FROM Results r
JOIN Grades g ON r.grade = g.grade
JOIN Students s ON r.student_id = s.stud_id
GROUP BY s.name;

-- Create Views
-- A.Create View: Students with Distinction
CREATE OR REPLACE VIEW view_distinction_students AS
SELECT 
    s.name, 
    r.marks_obained, 
    r.grade
FROM Results r
JOIN Students s ON s.stud_id = r.student_id
WHERE r.marks_obained >= 75;

SELECT * FROM view_distinction_students;


-- B.View: view_student_results

CREATE OR REPLACE VIEW view_student_results AS
SELECT 
    s.name AS student_name,
    c.course_name,
    r.marks_obained,
    r.grade,
    r.exam_type
FROM Results r
JOIN Students s ON r.student_id = s.stud_id
JOIN Courses c ON r.course_id = c.course_id;

SELECT * FROM view_student_results;

--  C.View: view_course_performance

 CREATE OR REPLACE VIEW view_course_performance AS
SELECT 
    c.course_name,
    COUNT(r.result_id) AS total_attempts,
    AVG(r.marks_obained) AS average_marks
FROM Results r
JOIN Courses c ON r.course_id = c.course_id
GROUP BY c.course_name;

SELECT * FROM view_course_performance;

DROP VIEW view_course_performance;   

