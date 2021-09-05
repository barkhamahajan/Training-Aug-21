
--1.Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments. 

SELECT DepartmentName,d.LocationID,StreetAddress,City,StateProvince,CountryID
FROM Departments d JOIN Locations l 
ON d.LocationID = l.LocationID

--2.Write a query to find the names (first_name, last name), department ID and name of all the employees. 

SELECT FirstName,LastName,e.DepartmentID,DepartmentName
FROM Employees e JOIN Departments d
ON e.DepartmentID = d.DepartmentID

--3.Find the names (first_name, last_name), job, department number, and department name of the employees who work in London. 

SELECT FirstName,LastName,JobID,e.DepartmentID,DepartmentName
FROM Employees e JOIN Departments d
ON e.DepartmentID = d.DepartmentID
JOIN Locations l 
ON d.LocationID = l.LocationID
WHERE l.City='London'

--4.Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name). 

SELECT e.EmployeeID,e.LastName,m.ManagerID,m.LastName 
FROM Employees e JOIN Employees m
ON e.ManagerID = m.EmployeeID

--5.Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'. 

SELECT distinct e.FirstName,e.LastName,e.HireDate FROM Employees e
WHERE e.HireDate > (select HireDate From Employees where LastName='Jones')

--6.Write a query to get the department name and number of employees in the department. 

SELECT DepartmentName,Count(EmployeeID) Employees
FROM Employees e JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY DepartmentName

--7.Find the employee ID, job title, number of days between ending date and starting date for all jobs in department 90 from job history. 

SELECT j.EmployeeID,j.JobID,DATEDIFF(DD,StartDate,EndDate) 
FROM Departments d JOIN JobHistory j
ON d.DepartmentID = j.DepartmentID
WHERE j.DepartmentID=90

--8. Write a query to display the department ID, department name and manager first name. 

SELECT D.DepartmentID, D.DepartmentName, M.FirstName AS 'Manager_FirstName' 
FROM Departments D
LEFT JOIN Employees M ON D.ManagerID = M.EmployeeID

--9.Write a query to display the department name, manager name, and city. 

SELECT D.DepartmentID, D.DepartmentName, M.FirstName+' '+ M.LastName AS 'Manager_Name', L.City 
FROM Departments D LEFT JOIN Employees M 
ON D.ManagerID = M.EmployeeID 
JOIN Locations L 
ON D.LocationID = L.LocationID

--10.Write a query to display the job title and average salary of employees. 

SELECT JobID,AVG(Salary) AS AverageSalary FROM Employees
GROUP BY JobID

--11.Display job title, employee name, and the difference between salary of the employee and minimum salary for the job. 

SELECT e.JobID,e.FirstName + ' ' + e.LastName 'Name',e.Salary-min_sal.Salary 'Difference' FROM Employees e
JOIN 
(
SELECT JobId,MIN(Salary) Salary FROM Employees group by JobID
) AS min_sal
ON e.jobid = min_sal.jobid

--12.Write a query to display the job history that were done by any employee who is currently drawing more than 10000 of salary. 

SELECT * FROM JobHistory j JOIN Employees e
ON j.EmployeeID = e.EmployeeID
WHERE E.Salary > 10000

--13.Write a query to display department name, name (first_name, last_name), hire date, salary of the manager for all managers whose 
--experience is more than 15 years. 

SELECT D.DepartmentName, E.FirstName,+ ' '+ E.LastName AS 'Name', E.HireDate, E.Salary 
FROM Departments D JOIN Employees E 
ON D.ManagerID = E.EmployeeID 
WHERE DATEDIFF(YEAR, E.HireDate, GETDATE()) > 15
