-- Use Dictinct with Orderby to remove duplicate rows
-- SELECT DISTINCT ON (______) _____,
-- ______,
-- ______,
-- ______

-- INTO nameyourtable
-- FROM _______
-- WHERE _______
-- ORDER BY _____, _____ DESC;
drop table Retirement_titles
SELECT distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date 
INTO Retirement_titles
from employees e
Left Join titles t on t.emp_no = e.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
order by e.emp_no

drop table Unique_titles;
Select  emp_no, first_name, last_name, title
into Unique_titles
from Retirement_titles
WHERE to_date = ('9999-01-01')
order by emp_no, to_date desc ;

drop table retiring_titles;
Select   count(title),title
into retiring_titles
from Unique_titles
group by title 
order by count(title) desc

--Delivery 2-
--Mentorship eligible employees-
SELECT distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, t.title, de.from_date, de.to_date 
INTO mentorship_eligibility
from employees e
Left Join titles t on t.emp_no = e.emp_no
Left Join dept_emp de on de.emp_no = e.emp_no 
WHERE e.birth_date BETWEEN '1965-01-01' AND '1965-12-31' AND de.to_date ='9999-01-01'
order by e.emp_no