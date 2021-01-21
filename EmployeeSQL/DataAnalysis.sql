--Mining the Pewlett Hackard information

--1.  Identify the following details for each employee:  employee number, Last name, first  name, sex, and salary

SELECT employee.emp_no, employee.last_name, employee.first_name, employee.sex, salaries.salary
FROM employee
JOIN salaries
ON employee.emp_no = salaries.emp_no;

--2. List first name, last name and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employee
WHERE hire_date >= '1986/01/01'
AND hire_date <= '1986/12/31';

--3. List the manager of each department with the following information:
--department number, department name, manager's employee number, last name and first name.

SELECT dept_manager.dept_no,
	department.dept_name,
	dept_manager.emp_no,
	employee.last_name,
	employee.first_name
	FROM dept_manager
	JOIN department ON dept_manager.dept_no = department.dept_no
	JOIN employee ON dept_manager.emp_no = employee.emp_no;
	
--4. List the department of each emloyee with the following infromation:
--employee number, last name, first name, and department name.

SELECT employee.emp_no,
	employee.last_name,
	employee.first_name,
	department.dept_name
	FROM employee
	JOIN dept_manager ON employee.emp_no = dept_manager.emp_no
	JOIN department ON dept_manager.dept_no = department.dept_no;
	
--5. List first name, last name and sex for emplyees whose first name is Hercules and last name begin with B.

SELECT first_name, last_name, sex
FROM employee
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6.  List all employees in the Sales department inclding their employee number, last name, first name and department name

SELECT employee.emp_no,
	employee.last_name,
	employee.first_name,
	department.dept_name
	FROM employee
	JOIN dept_manager ON employee.emp_no = dept_manager.emp_no
	JOIN department ON dept_manager.dept_no = department.dept_no
	WHERE department.dept_name = 'Sales';
	

--7.  List all employees in the Sales and Development departmens, including their employee number, last name, 
--first name and department name.

SELECT employee.emp_no,
	employee.last_name,
	employee.first_name,
	department.dept_name
	FROM employee
	JOIN dept_manager ON employee.emp_no = dept_manager.emp_no
	JOIN department ON dept_manager.dept_no = department.dept_no
	WHERE department.dept_name = 'Sales'
	OR department.dept_name = 'Development';

--8.  In descending order, list the frequency count of employee last names, i.e. how many employees share a last name

SELECT last_name, COUNT(last_name)
FROM employee
GROUP BY last_name
ORDER BY count(last_name) DESC;


