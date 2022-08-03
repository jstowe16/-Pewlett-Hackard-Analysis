SELECT emp_no,
    first_name,
    last_name
FROM employees;

SELECT title,
    from_date,
    to_date
FROM titles;

SELECT e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    e.birth_date,
    t.from_date,
    t.to_date
INTO del1_1
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no);


-- Filter the data on the birth_date column to retrieve the employees 
-- who were born between 1952 and 1955. Then, order by the employee number.
SELECT emp_no,
    first_name,
    last_name,
    title,
    from_date,
    to_date 
INTO ret_titles
FROM del1_1
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM ret_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM ret_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- retrieve number of retirees by title
SELECT COUNT(title), title
INTO ret_titles_summary
FROM unique_titles
GROUP BY title
ORDER BY count DESC;





