# Pewlett-Hackard-Analysis
SQL Project

## Overview
### Background
Pewlett Hackard is a large company who has several employees retiring soon. This will open up large amount of positions in various departments. Bobb who is an HR Analysts have been asked to find the list of employees who are going to retire soon. This will help the company to identify which postions would need to be filled. The company need to plan ahead so that they can prepare and train the new joinees on time and not impact the work. 

### Purpose
Bobb was asked to analyze a bunch of csv files and share his analysis on the retirement data.
Following csv files were given to Bobb
- [Department.csv](Data/departments.csv)
- [Employee.csv](Data/employees.csv)
- [Department_Employee.csv](Data/dept_emp.csv)
- [Department_Manager.csv](Data/dept_manager.csv)
- [Employee Salary.csv](Data/salaries.csv)
- [Employee Titles.csv](Data/titles.csv)

The analysis should cover the following results :
1) Find the list of employees who are going to retire soon(#List-Of-Employees-With-Retirement-Titles)
2) Find retiring employees titles to know what positions need to be filled
3) Find in which department retiring employees belong to
4) Find the eligible retiring employees for retirement package

## Results
### List Of Employees With Retirement Titles

1) In order to find the list employees we have to fetch data from Employee table which has birthdate in between '1952-01-01' AND '1955-12-31'
2) Then we need to join to the Titles table to get those employees current titles

``` sql
  drop table if exists Retirement_titles
  SELECT distinct on (e.emp_no) e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date 
  INTO Retirement_titles
  from employees e
  Left Join titles t on t.emp_no = e.emp_no
  WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
  order by e.emp_no
```
## Summary
