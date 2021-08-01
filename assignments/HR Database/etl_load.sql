# ETL

INSERT INTO Employee (ID, Manager, Name, Email)
SELECT emp_id, manager, emp_nm, email from proj_stg;