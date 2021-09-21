# sql-challenge

## Data Modeling

Examine the provided .csv files. Compare all column titles to determine which columns contain keys and which are primary or foreign.

Considering this information, use the tools available at http://www.quickdatabasediagrams.com/ to create an ERD to illustrate the relationships between tables.

![Image of ERD](https://github.com/kellnergp/sql-challenge/blob/main/EmployeeSQL/QuickDBD-EmployeeSQL%20Diagram.png)

## Data Engineering

Using the information gathered in the previous section, write an SQL script to generate tables matching the format of the .csv files.

Script: https://github.com/kellnergp/sql-challenge/blob/main/EmployeeSQL/table_schema.sql

The correct order to create them without causing dependency errors is:

1. titles
2. employees
3. departments
4. salaries
5. dept_emp
6. dept_manager

Examine the .csv files to determine the data type and maximum size of each column's values and create each table accordingly.

## Data Analysis

Answer the prompted questions via another SQL script.

Script: https://github.com/kellnergp/sql-challenge/blob/main/EmployeeSQL/data_analysis_queries.sql

### Queries

1. List the following details of each employee: employee number, last name, first name, sex, and salary.

      Join the employees and salaries tables on the 'emp_no' column and SELECT 'emp_no', 'last_name', 'first_name', 'sex', and 'salary' columns

2. List first name, last name, and hire date for employees who were hired in 1986.

      SELECT 'first_name', 'last_name', and 'hire_date' columns from the employees table with a WHERE clause specifying that 'hire_date' values must be 
      LIKE '%1986%'.

3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

      SELECT 'dept_no', 'dept_name', 'emp_no' 'last_name', and 'first_name' columns FROM the dept_manager table with the departments table JOINed ON 'dept_no' and the 
      employees table JOINed ON 'emp_no'.

4. List the department of each employee with the following information: employee number, last name, first name, and department name.

5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
