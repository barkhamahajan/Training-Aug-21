SELECT * FROM Employees
SELECT * FROM Departments
SELECT * FROM JobHistory

--Q5 Create a View to Find the names (first_name, last_name), job, department number, and department name of the employees who work in London

CREATE VIEW EMPOYEE_LONDON 
AS
SELECT FirstName+ ' '+LastName 'NAME', JobId, E.DepartmentID, D.DepartmentName FROM Employees E JOIN Departments D
ON E.DepartmentID=D.DepartmentID
WHERE E.DEPARTMENTID=(
SELECT DEPARTMENTID FROM DEPARTMENTS WHERE LOCATIONID =
(SELECT LocationID FROM Locations WHERE CITY='LONDON')
)

SELECT * FROM EMPOYEE_LONDON 

--Q6 Create a View to get the department name and number of employees in the department.

CREATE VIEW DEPARTMENT_COUNT
AS
SELECT D.DepartmentID,D.DEPARTMENTNAME ,COUNT (*) 'TOTAL EMP COUNT' FROM Employees E, DEPARTMENTS D
WHERE E.DepartmentID=D.DepartmentID
GROUP BY D.DepartmentID,D.DEPARTMENTNAME

SELECT * FROM DEPARTMENT_COUNT

--Q7 Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history.

CREATE VIEW DEPT_90_EXP
AS
SELECT E.EMPLOYEEID, E.JobId, DATEDIFF(DAY,J.StartDate, J.EndDate)'DIFF IN DAYS'  FROM Employees E JOIN Departments D
ON E.DepartmentID=D.DepartmentID JOIN JobHistory J
ON E.EmployeeID=J.EmployeeID
WHERE J.DepartmentID=90

SELECT * FROM DEPT_90_EXP

--Q8 Write a View to display the department name, manager name, and city.

CREATE VIEW MANAGER_DEPT_CITY
AS
SELECT DISTINCT D.DepartmentName, M.FirstName, L.CITY FROM Employees E JOIN Departments D
ON E.DepartmentID=D.DepartmentID JOIN Employees M
ON E.ManagerID=M.EmployeeID JOIN Locations L
ON D.LocationID=L.LocationID

SELECT * FROM MANAGER_DEPT_CITY

--Q9 Create a View to display department name, name (first_name, last_name), hire date, salary of the manager for
--all managers whose experience is more than 15 years.

CREATE VIEW MANAGER_EXP_MORE_15_YEARS
AS
SELECT DISTINCT  D.DepartmentName, M.FirstName+' '+M.LastName 'NAME', M.HireDate,M.Salary FROM Employees E JOIN Employees M
ON E.ManagerID=M.EmployeeID JOIN Departments D
ON E.DepartmentID=D.DepartmentID
WHERE DATEDIFF(YEAR, M.HIREDATE, GETDATE())>15

SELECT * FROM MANAGER_EXP_MORE_15_YEARS
