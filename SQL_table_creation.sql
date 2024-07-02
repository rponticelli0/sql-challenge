-- Drop table
DROP TABLE IF EXISTS departments CASCADE;
-- Create the departments table
CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name VARCHAR(40) NOT NULL
);

-- Drop table 
DROP TABLE IF EXISTS employees CASCADE;
-- Create the employees table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(5) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Drop table
DROP TABLE IF EXISTS dept_emp CASCADE;
-- Create the dept_emp table
CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR(4) NOT NULL,
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- Drop table
DROP TABLE IF EXISTS dept_manager CASCADE;
-- Create the dept_manager table
CREATE TABLE dept_manager (
    dept_no VARCHAR(4),
    emp_no INT,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Drop table
DROP TABLE IF EXISTS salaries CASCADE;
-- Create the salaries table
CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,
    salary INT NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Drop table
DROP TABLE IF EXISTS titles;
-- Create the titles table
CREATE TABLE titles (
    title_id VARCHAR(5) NOT NULL,
    title VARCHAR(40) NOT NULL,
    PRIMARY KEY (title_id)
);
