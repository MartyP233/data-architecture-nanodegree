# ETL

INSERT INTO Education_Level (Edu_Level_Name)
SELECT DISTINCT education_lvl from proj_stg;

INSERT INTO Employee (ID, education_level_id, Name, Email, Hire_Date)
SELECT DISTINCT 
    emp_id
    , e.id
    , emp_nm
    , email
    , hire_dt
from proj_stg p
left join Education_Level e
    ON e.edu_level_name = p.education_lvl;

INSERT INTO Title (title)
SELECT DISTINCT job_title from proj_stg;

INSERT INTO Location (Name, Address, City, State)
SELECT DISTINCT location, address, city, state from proj_stg;

INSERT INTO Department (Name)
SELECT DISTINCT department_nm from proj_stg;

INSERT INTO Job_History (Employee_ID, department_id, location_id, title_id,start_date,end_date,manager_id)
SELECT 
p.emp_id
, d.id
, l.id
, t.id
, p.start_dt
, p.end_dt
, p2.emp_id
FROM proj_stg p 
LEFT JOIN Department d
    ON p.department_nm = d.name
LEFT JOIN location l
    ON p.location = l.name
LEFT JOIN title t
    ON t.title = p.job_title
LEFT JOIN proj_stg p2
    ON p2.emp_nm = p.manager;

INSERT INTO Salary (JobHistory_ID, Salary)
SELECT j.ID
,p.salary
FROM Job_History j
LEFT JOIN proj_stg p
    ON j.employee_id = p.emp_id 
    AND j.start_date = p.start_dt


