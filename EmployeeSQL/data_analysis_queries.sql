-- q1:  each employee: employee number, last name, first name, sex, and salary.

-- join employees and salaries tables on employee number to find all relevant fields
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_no = s.emp_no;

-- q2: List first name, last name, and hire date for employees who were hired in 1986

-- query values from employees table where year component of hire_date column is 1986
SELECT first_name, last_name, hire_date
FROM employees
--WHERE RIGHT(hire_date, 4) = '1986'; -- last 4 digits is year in this format
WHERE hire_date LIKE '%1986%'; -- same result, requires less specificity

-- q3: list each manager w/ department number, department name, 
-- the manager's employee number, last name, first name

-- join departments and employees tables to dept manager table to find all values
-- for managers
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
LEFT JOIN departments d
ON d.dept_no = dm.dept_no
LEFT JOIN employees e
ON e.emp_no = dm.emp_no;

-- q4: each employee w/ employee number, last name, first name, and department name

-- use with clause to generate temporary table with all employee numbers and corresponding
-- department numbers
WITH tm AS 
	(SELECT dept_no, emp_no FROM dept_manager
	UNION
	SELECT dept_no, emp_no FROM dept_emp) 

-- join temporary table to employees table to enable a join of departments table to 
-- employees table, then call relevant columns
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN tm
ON tm.emp_no = e.emp_no
LEFT JOIN departments d
ON tm.dept_no = d.dept_no;

-- q5: List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."

-- query columns from employees table with first_name = Hercules
-- and last_name LIKE 'B%'
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- q6: List all employees in the Sales department w/employee number, last name, 
-- first name, and department name

WITH tm AS 
	(SELECT dept_no, emp_no FROM dept_manager
	UNION
	SELECT dept_no, emp_no FROM dept_emp) 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
LEFT JOIN tm
ON tm.emp_no = e.emp_no
LEFT JOIN departments d
ON tm.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';	

