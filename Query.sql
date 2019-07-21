--		1. List the following details of each employee: 
--		employee number, last name, first name, gender, and salary

SELECT emp.emp_no, emp.last_name, emp.first_name,  emp.gender, sal.salary 
FROM employee emp 
LEFT JOIN salaries sal
ON emp.emp_no = sal.emp_no;

--		2. List employees who were hired in 1986.

SELECT * FROM employee 
WHERE EXTRACT (YEAR FROM hire_date) = 1986 

--		3. List the manager of each department with the following information: 
--		department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT 
	dept_mgr.dept_no,
	dept.dept_name,
	dept_mgr.emp_no,
	emp.last_name,
	emp.first_name,
	dept_mgr.from_date,
	dept_mgr.to_date
FROM 
	department_manager dept_mgr,
	department dept,
	employee emp
WHERE 
	dept_mgr.dept_no = dept.dept_no and
	dept_mgr.emp_no = emp.emp_no
ORDER BY dept_no, from_date;
	
--		4. List the department of each employee with the following information: 
--		employee number, last name, first name, and department name.

SELECT 
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
FROM
	employee emp,
	department_employee dept_emp,
	department dept
WHERE
	emp.emp_no = dept_emp.emp_no AND
	dept_emp.dept_no = dept.dept_no
ORDER BY
	emp_no;
	
--		5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT * FROM employee
WHERE
	first_name = 'Hercules' AND
	last_name LIKE 'B%'
ORDER BY emp_no;

--		6. List all employees in the Sales department, including their 
--		employee number, last name, first name, and department name.

SELECT 
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
FROM
	employee emp,
	department_employee dept_emp,
	department dept
WHERE
	emp.emp_no = dept_emp.emp_no AND
	dept_emp.dept_no = dept.dept_no AND
	dept.dept_name = 'Sales'
ORDER BY emp_no;

--		7. List all employees in the Sales and Development departments, 
--		including their employee number, last name, first name, and department name.

SELECT 
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	dept.dept_name
FROM
	employee emp,
	department_employee dept_emp,
	department dept
WHERE
	emp.emp_no = dept_emp.emp_no AND
	dept_emp.dept_no = dept.dept_no AND
	dept.dept_name in ('Sales','Development');

--		8. In descending order, list the frequency count of employee last names, 
--		i.e., how many employees share each last name.

SELECT last_name, COUNT(*) AS last_name_count from employee
GROUP BY last_name
ORDER by last_name_count DESC

