-- Question 1: Return a list of employees with Job Titles and Department Names


SELECT e.name, t.title, d.name
FROM Employee e
LEFT JOIN Job_History j
    ON e.id = j.employee_id
LEFT JOIN title t
    ON t.id = j.title_id
LEFT JOIN Department d
    ON j.Department_ID = d.id
ORDER BY e.name;

-- Question 2: Insert Web Programmer as a new job title

insert into title (title)
VALUES ('Web Programmer');

SELECT * FROM title;

-- Question 3: Correct the job title from web programmer to web developer

UPDATE title
set title = 'Web Developer'
where title = 'Web Programmer';

SELECT * FROM title;

-- Question 4: Delete the job title Web Developer from the database

DELETE FROM title
where title = 'Web Developer';

SELECT * FROM title;

-- Question 5: How many employees are in each department?

SELECT d.name, COUNT (*) AS Number_of_Employees
FROM Job_History j
LEFT JOIN department d
    ON j.department_id = d.id
GROUP BY d.name;

-- Question 6: Write a query that returns current and past jobs (include employee name, job title, department, manager name, start and end date for position) for employee Toni Lembeck.

SELECT e.name, t.title, d.name AS Department, ee.name AS Manager_Name, start_date, end_date
FROM job_history j
LEFT JOIN  Employee e
    ON j.employee_id = e.id
LEFT JOIN title t
    ON j.title_id = t.id
LEFT JOIN Department d
    ON j.department_id = d.id
LEFT JOIN Employee ee
    ON ee.id = j.manager_id
where e.name = 'Toni Lembeck';


-- Question 7: Describe how you would apply table security to restrict access to employee salaries using an SQL server.
