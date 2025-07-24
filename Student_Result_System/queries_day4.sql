-- 1. GPA Rankings Using RANK()
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
    ), 2) AS GPA,
    RANK() OVER (ORDER BY AVG(
        CASE r.grade
            WHEN 'A+' THEN 10
            WHEN 'A' THEN 9
            WHEN 'B+' THEN 8
            WHEN 'B' THEN 7
            WHEN 'C' THEN 6
            WHEN 'D' THEN 5
            ELSE 0
        END
    ) DESC) AS GPA_Rank
FROM Students s
JOIN Results r ON s.Stud_ID = r.Student_id
GROUP BY s.Stud_ID, s.name;

-- Top 3 Students View
CREATE VIEW view_top_3_students AS
SELECT *
FROM (
    SELECT 
        s.Stud_ID,
        s.name,
        AVG(CASE r.grade
            WHEN 'A+' THEN 10
            WHEN 'A' THEN 9
            WHEN 'B+' THEN 8
            WHEN 'B' THEN 7
            WHEN 'C' THEN 6
            WHEN 'D' THEN 5
            ELSE 0
        END) AS GPA,
        RANK() OVER (ORDER BY AVG(
            CASE r.grade
                WHEN 'A+' THEN 10
                WHEN 'A' THEN 9
                WHEN 'B+' THEN 8
                WHEN 'B' THEN 7
                WHEN 'C' THEN 6
                WHEN 'D' THEN 5
                ELSE 0
            END
        ) DESC) AS rank_position
    FROM Students s
    JOIN Results r ON s.Stud_ID = r.Student_id
    GROUP BY s.Stud_ID, s.name
) AS ranked_data
WHERE rank_position <= 3;

SELECT * FROM view_top_3_students;



-- Failed Students Report
CREATE VIEW view_failed_students AS
SELECT 
	s.name AS student_name,
    c.Course_name,
    r.marks_obained,
    r.grade
    FROM results r
    JOIN students s ON r.Student_id = s.Stud_ID
    JOIN courses c ON r.Course_id = c.Course_id
    WHERE r.grade = 'F' OR r.marks_obained <40 ;
    
  SELECT * FROM view_failed_students;
  
    -- Subject Topper View 
CREATE VIEW view_subject_toppers AS
SELECT *
FROM (
    SELECT 
        r.course_id,
        c.course_name,
        r.student_id,
        s.name AS student_name,
        r.marks_obained,
        RANK() OVER (PARTITION BY r.course_id ORDER BY r.marks_obained DESC) AS course_rank
    FROM Results r
    JOIN Students s ON r.student_id = s.Stud_ID
    JOIN Courses c ON r.course_id = c.course_id
) ranked_results
WHERE course_rank = 1;

SELECT * FROM view_subject_toppers;

    

 		