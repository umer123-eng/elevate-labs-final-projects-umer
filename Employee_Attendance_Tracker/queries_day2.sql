-- 1. Total Working Days per Employee

SELECT emp_id, COUNT(*) AS total_working_days
FROM attendance_dummy
WHERE status = 'Present'
GROUP BY emp_id ;

--  2. Late Arrivals (after 09:30 AM)

SELECT emp_id ,date ,time_in
FROM attendance_dummy
WHERE time_in > '09:30:00' ;

-- 3. Monthly Attendance Percentage

SELECT 
  emp_id,
  DATE_FORMAT(date, '%Y-%m') AS month,
  ROUND(100.0 * COUNT(CASE WHEN status = 'Present' THEN 1 END) / COUNT(*), 2) AS attendance_percentage
FROM attendance_dummy
GROUP BY emp_id, month;

-- 4. Employees with Perfect Attendance
SELECT emp_id
FROM attendance_dummy
GROUP BY emp_id
HAVING COUNT(*) = COUNT(CASE WHEN status = 'Present' THEN 1 END);

-- 5. Detect Consecutive Absentees (e.g., 3 or more days)
-- You may need a running window function with row_number or lag()
SELECT emp_id, MIN(date) AS absent_start_date
FROM (
  SELECT emp_id, date,
         ROW_NUMBER() OVER (PARTITION BY emp_id ORDER BY date)
         - RANK() OVER (PARTITION BY emp_id, status ORDER BY date) AS grp
  FROM attendance_dummy
  WHERE status = 'Absent'
) sub
GROUP BY emp_id, grp
HAVING COUNT(*) >= 3;

-- 6. Department-wise Average Login Time
SELECT d.dept_name, 
       AVG(a.time_in) AS avg_login_time
FROM attendance_dummy a
JOIN employees_dummy e ON a.emp_id = e.emp_id
JOIN departments_dummy d ON e.dept_id = d.dept_id
WHERE a.status = 'Present'
GROUP BY d.dept_name;


SELECT * FROM attendance_dummy LIMIT 5;

--  Department-wise Employee Login Records
SELECT e.emp_id, e.name, d.dept_name, a.time_in
FROM employees_dummy e
JOIN departments_dummy d ON e.dept_id = d.dept_id
JOIN attendance_dummy a ON a.emp_id = e.emp_id
LIMIT 10;


SELECT d.dept_name, a.time_in
FROM attendance_dummy a
JOIN employees_dummy e ON a.emp_id = e.emp_id
JOIN departments_dummy d ON e.dept_id = d.dept_id
LIMIT 10;


-- Department-wise Average Login Time
SELECT d.dept_name,
       SEC_TO_TIME(AVG(TIME_TO_SEC(a.time_in))) AS avg_login_time
FROM attendance_dummy a
JOIN employees_dummy e ON a.emp_id = e.emp_id
JOIN departments_dummy d ON e.dept_id = d.dept_id
WHERE a.status = 'Present'
GROUP BY d.dept_name;


