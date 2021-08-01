CREATE TABLE Employee (
    ID varchar(50) PRIMARY KEY,
    Manager varchar(50),
    Job_ID INT,
    Education_level_ID INT,
    Name varchar(50),
    Email varchar(50)
);

CREATE TABLE Employee_History (
    Employee_ID varchar(50),
    Hire_Date date,
    Start_Date date,
    End_Date date,
    PRIMARY KEY (Employee_ID, Hire_Date)
);

CREATE TABLE Education_Level (
    ID SERIAL PRIMARY KEY,
    Edu_Level_Name varchar(50)
);

CREATE TABLE Salary (
    Employee_ID varcahr(50),
    Effective_Date date,
    Salary money,
    End_date date,
    PRIMARY KEY (Employee_ID, Effective_Date)
);

CREATE TABLE Job (
    ID SERIAL PRIMARY KEY,
    Department_ID INT,
    Location_ID INT,
    Title varchar(50)
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


ALTER TABLE Employee
    ADD CONSTRAINT fk_employee_manager FOREIGN KEY (Manager) REFERENCES Employee (Name),
    ADD CONSTRAINT fk_employee_job FOREIGN KEY (Job_ID) REFERENCES Job (ID),
    ADD CONSTRAINT fk_employee_edu FOREIGN KEY (Education_level_ID) REFERENCES Education_Level (ID);
        
ALTER TABLE Employee_History
    ADD CONSTRAINT fk_employeehistory_employee FOREIGN KEY (Employee_ID) REFERENCES Employee (ID);
    
ALTER TABLE Salary
    ADD CONSTRAINT fk_salary_employee FOREIGN KEY (Employee_ID) REFERENCES Employee (ID);
    
ALTER TABLE Job
    ADD CONSTRAINT fk_job_department FOREIGN KEY (Department_ID) REFERENCES Department (ID),
    ADD CONSTRAINT fk_job_location FOREIGN KEY (Location_ID) REFERENCES Location (ID);