-- Trigger: Set status to "Present" if time_in is entered
DELIMITER //

CREATE TRIGGER trg_set_status_present
BEFORE INSERT ON attendance_dummy
FOR EACH ROW
BEGIN
    IF NEW.time_in IS NOT NULL THEN
        SET NEW.status = 'Present';
    ELSE
        SET NEW.status = 'Absent';
    END IF;
END;
//

DELIMITER ;\

-- . Reports Using GROUP BY, HAVING, ROLLUP
-- Total employees per department
SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM employees_dummy e
JOIN departments_dummy d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;


-- Total late entries per department

SELECT d.dept_name, COUNT(*) AS total_late_entries
FROM attendance_dummy a
JOIN employees_dummy e ON a.emp_id = e.emp_id
JOIN departments_dummy d ON e.dept_id = d.dept_id
WHERE a.time_in > '09:30:00'
GROUP BY d.dept_name;

-- Department-wise attendance summary with ROLLUP
SELECT 
    d.dept_name, 
    a.status, 
    COUNT(*) AS count_status
FROM attendance_dummy a
JOIN employees_dummy e ON a.emp_id = e.emp_id
JOIN departments_dummy d ON e.dept_id = d.dept_id
GROUP BY d.dept_name, a.status WITH ROLLUP;


-- 4. Views / Dashboards
-- 🔸 View: Daily Attendance Summary

CREATE OR REPLACE VIEW view_daily_attendance AS
SELECT 
  a.date, e.emp_id, e.name, a.time_in, a.time_out, a.status
FROM attendance_dummy a
JOIN employees_dummy e ON a.emp_id = e.emp_id;

-- View: Employee Work Summary
sql
Copy code
CREATE OR REPLACE VIEW view_employee_work_summary AS
SELECT 
  e.emp_id, e.name, COUNT(a.date) AS days_present,
  SUM(EXTRACT(EPOCH FROM (a.time_out - a.time_in)) / 3600) AS total_hours
FROM employees_dummy e
JOIN attendance_dummy a ON e.emp_id = a.emp_id
WHERE a.status = 'Present'
GROUP BY e.emp_id, e.name;