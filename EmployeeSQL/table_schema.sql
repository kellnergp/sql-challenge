-- create titles table
CREATE TABLE titles (
	title_id VARCHAR(6) NOT NULL,
	PRIMARY KEY(title_id),
	title VARCHAR(20)
);

-- create employee table
CREATE TABLE employees (
	emp_no VARCHAR(10) NOT NULL,
	PRIMARY KEY(emp_no),
	emp_title_id VARCHAR(6),
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date VARCHAR(10), -- Dates are in the wrong format for sql DATE data type
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	sex VARCHAR(5), -- boosted size incase of bad data
	hire_date VARCHAR(10) -- same issue as birth date
);

-- create departments table
CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL,
	PRIMARY KEY(dept_no),
	dept_name VARCHAR(20)
);


