-- Set to Drop Tables if they exist
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

--Create the employee Table
CREATE TABLE employee (
	emp_no INTEGER PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL
);

--Check employee table creation and data import
SELECT * FROM employee;

--Create the department table

CREATE TABLE department(
	dept_no VARCHAR PRIMARY KEY NOT NULL,
	dept_name VARCHAR NOT NULL
);

--Check department table creation and import
SELECT * FROM department;

--Create department employee table
CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);

--Check department employee table creation and import
SELECT * FROM dept_emp;

--Create department manager table
CREATE TABLE dept_manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,	
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);

--Check department manager table creation and import
SELECT * FROM dept_manager;


--Create Salaries Table
CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL, 
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no)	
);

--Check salaries table creation and import
SELECT * FROM salaries;

--Create titles Table
CREATE TABLE titles(
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL 	
);

--Check titles table creation and import
SELECT * FROM titles;