-- List the following details of each employee: employee number, last name, first name, sex, and salary.
select 
	e.emp_no as "employee number",
	e.last_name as "last name",
	e.first_name as "first name",
	e.sex,
	s.salary
from employees as e
	inner join salaries as s
		on e.emp_no = s.emp_no;


-- List first name, last name, and hire date for employees who were hired in 1986.
select 
	first_name as "first name",
	last_name as "last name",
	hire_date as "hire date"
from employees
where date_part('year', hire_date) = 1986

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select 
	d.dept_no,
	d.dept_name,
	dm.emp_no as "manager employee number",
	e.last_name,
	e.first_name
from departments as d
	left join dept_manager as dm
		on d.dept_no = dm.dept_no
	left join employees as e
		on dm.emp_no = e.emp_no


-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select 
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
from employees as e
	left join dept_emp as de
		on e.emp_no = de.emp_no
	left join departments as d
		on de.dept_no = d.dept_no

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select 
	first_name,
	last_name,
	sex
from employees
where first_name = 'Hercules'
and last_name like 'B%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select 
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
from employees as e
	left join dept_emp as de
		on e.emp_no = de.emp_no
	left join departments as d
		on de.dept_no = d.dept_no
where d.dept_name = 'Sales'

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select 
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
from employees as e
	left join dept_emp as de
		on e.emp_no = de.emp_no
	left join departments as d
		on de.dept_no = d.dept_no
where d.dept_name in ('Sales', 'Development')

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select 
	last_name,
	count(last_name) as frequency
from employees
group by last_name
order by frequency desc 



