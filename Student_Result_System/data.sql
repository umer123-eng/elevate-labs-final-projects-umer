
-- Students Table
INSERT INTO Students (stud_ID, name, brith_date, contact_no, society, city, pincode) VALUES
(101, 'Umer Mansuri', '2003-06-12', '9876543210', 'Green Park', 'Surat', '395007'),
(102, 'Amaan Malek', '2004-03-15', '9898989898', 'Silver Heights', 'Vadodara', '390001'),
(103, 'Mahera Shaikh', '2002-11-25', '9811122233', 'Rose Valley', 'Ahmedabad', '380015'),
(104, 'Aamir Shaikh', '2004-11-21', '9811122221', 'Happy hights', 'Surat', '395007'),
(105, 'Assad Shaikh', '2006-05-22', '9811166533', 'Jamalpur', 'Ahmedabad', '380015'),
(106, 'Fizyan Sayaid', '2002-10-20', '9877622233', 'Parul uni', 'Vadodara', '390001'),
(107, 'Tufail Shaikh', '2002-01-15', '9811122298', 'Vasu', 'Surat', '395005'),
(108, 'Safin Shaikh', '2002-02-1', '9811100133', 'Teen Dravaja', 'Ahmedabad', '380015'),
(109, 'Meet Shaikh', '2005-05-10', '9899522233', DEFAULT, 'Vadodara', '390001'),
(110, 'Hussain Shaikh', '2008-09-14', '4411122233', 'Ring Road', 'Surat', '380015'),
(111, 'Andre Davenport', '2003-05-04', '0755655580', 'Cristina Fields', 'Peterville', '29942'),
(112, 'Joseph Schneider', '2001-08-30', '9037401382', 'Rodriguez Manors', 'Port Jefferyport', '93148'),
(113, 'Dawn Ruiz', '2006-11-03', '8902812496', 'Aaron Hollow', 'Lake Jeffrey', '25191'),
(114, 'Amber Bridges', '2001-04-25', '4097447295', 'Lori Ramp', 'Emilyview', '52647'),
(115, 'Cody Green', '2006-03-24', '6921471844', 'Williams Plains', 'Port Alanberg', '93137'),
(116, 'Andre Davenport', '2003-05-04', '0755655580', 'Cristina Fields', 'Peterville', '29942'),
(117, 'Joseph Schneider', '2001-08-30', '9037401382', 'Rodriguez Manors', 'Port Jefferyport', '93148'),
(118, 'Dawn Ruiz', '2006-11-03', '8902812496', 'Aaron Hollow', 'Lake Jeffrey', '25191'),
(119, 'Amber Bridges', '2001-04-25', '4097447295', 'Lori Ramp', 'Emilyview', '52647'),
(120, 'Cody Green', '2006-03-24', '6921471844', 'Williams Plains', 'Port Alanberg', '93137'),
(121, 'Andre Davenport', '2003-05-04', '0755655580', 'Cristina Fields', 'Peterville', '29942'),
(122, 'Joseph Schneider', '2001-08-30', '9037401382', 'Rodriguez Manors', 'Port Jefferyport', '93148'),
(123, 'Dawn Ruiz', '2006-11-03', '8902812496', 'Aaron Hollow', 'Lake Jeffrey', '25191'),
(124, 'Amber Bridges', '2001-04-25', '4097447295', 'Lori Ramp', 'Emilyview', '52647'),
(125, 'Cody Green', '2006-03-24', '6921471844', 'Williams Plains', 'Port Alanberg', '93137'),
(126, 'Andre Davenport', '2003-05-04', '0755655580', 'Cristina Fields', 'Peterville', '29942'),
(127, 'Joseph Schneider', '2001-08-30', '9037401382', 'Rodriguez Manors', 'Port Jefferyport', '93148'),
(128, 'Dawn Ruiz', '2006-11-03', '8902812496', 'Aaron Hollow', 'Lake Jeffrey', '25191'),
(129, 'Amber Bridges', '2001-04-25', '4097447295', 'Lori Ramp', 'Emilyview', '52647'),
(130, 'Cody Green', '2006-03-24', '6921471844', 'Williams Plains', 'Port Alanberg', '93137');

-- Semester Table
INSERT INTO Semester (semester_id, semester_name) VALUES
(1, 'Semester 1'),
(2, 'Semester 2'),
(3, 'Semester 3'),
(4, 'Semester 4'),
(5, 'Semester 5'),
(6, 'Semester 5'),
(7, 'Semester 6'),
(8, 'Semester 2');

SELECT * FROM semester;
-- Courses Table
INSERT INTO Courses (course_id, course_name, credit_hours, semester_id, faculty_name) VALUES
(1, 'Mathematics', 4, 1, 'Dr. Mehta'),
(2, 'Computer Programming', 5, 1, 'Mr. Patel'),
(3, 'Database Systems', 8, 4, 'Ms. Shah'),
(4, 'Cloud Computing', 5, 2, 'Mr. Nikunj'),
(5, 'Python', 6, 3, 'Ms. Shain'),
(6, 'Basic Of Infromation Tech', 4, 2, 'Ms. Anjali'),
(7, 'Intern net of Thinges', 4, 2, 'Mr. Pandor'),
(8, 'MySQL', 4, 2, 'Mr. SakirDenaths'),
(9, 'BDE', 4, 2, 'Mr. mohsin');

-- StudentCourses Table (Enrollment)
INSERT INTO StudentCourses (student_id, course_id, enrollment_date) VALUES
(101, 1, '2025-06-01'),
(101, 2, '2025-06-01'),
(102, 1, '2025-06-01'),
(103, 3, '2025-06-15');

-- Grades Table
INSERT INTO Grades (grade, min_marks, max_marks, grade_point) VALUES
('A+', 90, 100, 10.0),
('A', 80, 89, 9.0),
('B+', 70, 79, 8.0),
('B', 60, 69, 7.0),
('C', 50, 59, 6.0),
('F', 0, 49, 0.0);

-- Results Table
INSERT INTO Results (result_id, student_id, course_id, marks_obained, grade, exam_type, exam_date) VALUES
(1, 101, 1, 85, 'A', 'Midterm', '2025-07-01'),
(2, 101, 2, 78, 'B+', 'Final', '2025-07-05'),
(3, 102, 1, 55, 'C', 'Midterm', '2025-07-01'),
(4, 103, 3, 76, 'B+', 'Final', '2025-07-07'),
(5, 104, 3, 90, 'A', 'Midterm', '2025-07-07'),
(6, 105, 3, 95, 'A+', 'Final', '2025-03-05'),
(7, 105, 3, 92, 'A+', 'Final', '2025-02-09'),
(8, 106, 3, 97, 'A+', 'Final', '2025-04-27'),
(9, 107, 3, 98, 'A+', 'Final', '2025-02-13'),
(10, 108, 3, 85, 'A+', 'Final', '2025-07-07');

-- GPA Table
INSERT INTO GPA (student_id, semester_id, gpa, cgpa) VALUES
(101, 1, 8.5, 8.5),
(102, 1, 6.0, 6.0),
(103, 2, 10.0, 10.0),
(104, 3, 6.0, 6.0),
(105, 4, 6.0, 6.0),
(106, 3, 6.0, 6.0),
(107, 4, 6.0, 6.0),
(108, 2, 6.0, 6.0),
(109, 5, 6.0, 6.0),
(110, 4, 6.0, 6.0),
(122, 3, 6.0, 6.0),
(112, 2, 6.0, 6.0);










