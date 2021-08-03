CREATE TABLE Employee (
    ID varchar(50) PRIMARY KEY,
    Education_level_ID INT,
    Name varchar(50),
    Email varchar(50),
    Hire_Date date
);

CREATE TABLE Education_Level (
    ID SERIAL PRIMARY KEY,
    Edu_Level_Name varchar(50)
);

CREATE TABLE Salary (
    JobHistory_ID INT,
    Salary money
);

CREATE TABLE Job_History (
    ID SERIAL PRIMARY KEY,
    Employee_ID varchar(50),
    Department_ID INT,
    Location_ID INT,
    Title_ID INT,
    Start_Date date,
    End_Date date,
    Manager_ID varchar(50)
);

CREATE TABLE Department (
    ID SERIAL PRIMARY KEY,
    Name varchar(50)
);

CREATE TABLE Location (
    ID SERIAL PRIMARY KEY,
    Name varchar(50),
    Address varchar(50),
    City varchar(50),
    State varchar(50)
);

CREATE TABLE Title (
    ID SERIAL PRIMARY KEY,
    title varchar(50)
);

ALTER TABLE Employee ADD CONSTRAINT fk_employee_edu FOREIGN KEY (Education_level_ID) REFERENCES Education_Level (ID);
    
ALTER TABLE Salary ADD CONSTRAINT fk_salary_employee FOREIGN KEY (Employee_ID) REFERENCES Employee (ID);
    
ALTER TABLE Job_History ADD CONSTRAINT fk_job_department FOREIGN KEY (Department_ID) REFERENCES Department (ID);
ALTER TABLE Job_History ADD CONSTRAINT fk_job_location FOREIGN KEY (Location_ID) REFERENCES Location (ID);
ALTER TABLE Job_History ADD CONSTRAINT fk_jobhistory_employee FOREIGN KEY (Employee_ID) REFERENCES Employee (ID);
ALTER TABLE Job_History ADD CONSTRAINT fk_jobhistory_title FOREIGN KEY (title_id) REFERENCES Title (ID);

ALTER TABLE Salary ADD CONSTRAINT FK_jobhistory_salary FOREIGN KEY (JobHistory_ID) REFERENCES Job_History (ID);