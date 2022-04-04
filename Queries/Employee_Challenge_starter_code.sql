--Delivery 1-
drop table if exists Retirement_titles;
SELECT distinct e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date 
INTO Retirement_titles
from employees e
Left Join titles t on t.emp_no = e.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
order by e.emp_no;

drop table if exists Unique_titles;
Select  distinct on (emp_no) emp_no, first_name, last_name, title
into Unique_titles
from Retirement_titles
WHERE to_date = ('9999-01-01')
order by emp_no, to_date desc ;

drop table if exists retiring_titles;
Select   count(title),title
into retiring_titles
from Unique_titles
group by title 
order by count(title) desc;

--Delivery 2-
--Mentorship eligible employees-
drop table if exists mentorship_eligibility;
SELECT distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, t.title, de.from_date, de.to_date 
INTO mentorship_eligibility
from employees e
Left Join titles t on t.emp_no = e.emp_no
Left Join dept_emp de on de.emp_no = e.emp_no 
WHERE e.birth_date BETWEEN '1965-01-01' AND '1965-12-31' AND de.to_date ='9999-01-01'
order by e.emp_no;


select * from retiring_titles