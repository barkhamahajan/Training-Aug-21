CREATE TABLE employees (
Employee_Id INT PRIMARY KEY IDENTITY(1,1), 
FirstName VARCHAR(10),
LastName VARCHAR(10), 
Email VARCHAR(20), 
PhoneNumber VARCHAR(10), 
Hire_Date DATE, 
Job_Id INT CONSTRAINT fkForeig REFERENCES Jobs(JobId) on update cascade, 
Salary INT, 
Commission INT , 
Manager_Id INT , 
Department_Id INT CONSTRAINT fkkForeig REFERENCES Department(Department_Id) on update cascade

)

select * from employees
INSERT INTO employees values('barkha','hagha','barkha@gmil.com','909899898','2021-08-02',1,2000,200,1,2)