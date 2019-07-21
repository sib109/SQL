DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
	emp_no int PRIMARY KEY,
	birth_date	DATE NOT NULL,
	first_name	VARCHAR(30),
	last_name	VARCHAR(30),
	gender	CHAR(1),
	hire_date DATE NOT NULL
);
DROP TABLE IF EXISTS department_employee;
CREATE TABLE department_employee(
	emp_no	INT NOT NULL,
	dept_no	CHAR(6) NOT NULL,
	from_date	DATE NOT NULL,
	to_date	DATE
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);
DROP TABLE IF EXISTS titles;
CREATE TABLE titles(
	emp_no	INT NOT NULL,
	title	VARCHAR(30) NOT NULL,
	from_date	DATE NOT NULL,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employee (emp_no)
);
DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries(
	emp_no	INT NOT NULL,
	salary	INT NOT NULL,
	from_date	DATE NOT NULL,
	to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employee (emp_no)
);
DROP TABLE IF EXISTS department;
CREATE TABLE department(
	dept_no CHAR(6) PRIMARY KEY,
	dept_name VARCHAR (30) NOT NULL
);
DROP TABLE IF EXISTS department_manager;
CREATE TABLE department_manager(
	dept_no	CHAR(6) NOT NULL,
	emp_no	INT NOT NULL,
	from_date	DATE NOT NULL,
	to_date DATE
);

SELECT * FROM department;
SELECT * FROM department_employee;
SELECT * FROM department_manager;
SELECT * FROM employee;
SELECT * FROM salaries;
SELECT * FROM titles;
