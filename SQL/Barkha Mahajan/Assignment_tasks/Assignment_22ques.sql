SELECT * FROM Employees
SELECT * FROM Departments
SELECT * FROM Locations

-- 1. Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'.

SELECT FIRSTNAME, LASTNAME FROM Employees
WHERE Salary > (SELECT SALARY FROM Employees WHERE LastName='Bull')

--2. Find the names (first_name, last_name) of all employees who works in the IT department. 

SELECT FIRSTNAME, LASTNAME FROM Employees
WHERE DepartmentID=(SELECT DepartmentID FROM Departments WHERE DepartmentName='IT')

--3. Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. 

--Hint : Write single-row and multiple-row subqueries

SELECT FIRSTNAME, LASTNAME FROM Employees 
WHERE DepartmentID IN(
SELECT DepartmentID FROM Departments 
WHERE LocationID IN
(SELECT LocationID FROM Locations WHERE CountryID='US'))

--4. Find the names (first_name, last_name) of the employees who are managers. 

SELECT FIRSTNAME,LASTNAME FROM Employees 
WHERE EmployeeID IN (SELECT ManagerID FROM Employees)

--5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. 

SELECT FIRSTNAME, LASTNAME, Salary FROM Employees 
WHERE Salary>(SELECT AVG(SALARY) FROM Employees)

--6. Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade.  ?????????????

SELECT DISTINCT JobId FROM Employees 
WHERE Salary IN (SELECT MIN(SALARY),JobId FROM Employees GROUP BY JobId)
GROUP BY JobId

SELECT E.FirstName,E.LastName FROM Employees E JOIN Employees S
ON 

SELECT MIN(E.SALARY), D.DepartmentID FROM Employees E JOIN Departments D ON E.DEPARTMENTID=D.DEPARTMENTID
GROUP BY D.DEPARTMENTID

--7. Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments. 

SELECT FIRSTNAME, LASTNAME, Salary FROM Employees 
WHERE  Salary>(SELECT AVG(SALARY) FROM Employees) AND DepartmentID=(SELECT DepartmentID FROM Departments WHERE DepartmentName='IT')

--8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. 

SELECT FIRSTNAME, LASTNAME, Salary FROM Employees 
WHERE Salary>(SELECT Salary FROM Employees WHERE LastName='BELL')

--9. Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments. 

SELECT FIRSTNAME, LASTNAME, Salary FROM Employees 
WHERE Salary=(SELECT MIN(SALARY) FROM Employees)

--10. Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. 

SELECT FIRSTNAME, LASTNAME, Salary FROM Employees 
WHERE Salary>(SELECT AVG(SALARY) FROM Employees)

--11. Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest. 

SELECT FirstName+' '+LastName AS 'NAME', Salary FROM Employees 
WHERE Salary>(SELECT MAX(Salary) FROM Employees WHERE JobId='SH_CLERK')
ORDER BY Salary

--12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors.

SELECT EmployeeID, FIRSTNAME,LASTNAME FROM Employees 
WHERE EmployeeID NOT IN (SELECT DISTINCT ManagerID FROM Employees)

--13. Write a query to display the employee ID, first name, last names, and department names of all employees. 

SELECT E.EmployeeID, E.FirstName, E.LastName, D.DepartmentName  FROM Employees E JOIN Departments D
ON E.DepartmentID=D.DepartmentID

--14. Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments. ?????? 

SELECT AVG(S.Salary) [ASAL],S.DepartmentID,E.EmployeeID, E.FirstName, E.LastName,E.Salary FROM Employees E JOIN Employees S
ON E.EmployeeID=S.EmployeeID
GROUP BY S.DepartmentID

(SELECT AVG(SALARY), DEPARTMENTID FROM Employees GROUP BY DepartmentID)

--15. Write a query to fetch even numbered records from employees table. ?????????

DECLARE @ctr AS INT =1
SELECT * FROM(
SELECT EmployeeID, @ctr = @ctr+ 1 [NUM] FROM  Employees)EMP
WHERE @ctr%2=0

SELECT * FROM Employees WHERE EmployeeID%2=0

--16. Write a query to find the 5th maximum salary in the employees table. 

DECLARE @RANKING INT=5
SELECT * FROM (
SELECT EmployeeID, FirstName, LastName, Salary, DENSE_RANK() OVER(ORDER BY SALARY DESC)RANKING FROM Employees) EMP
WHERE RANKING = @RANKING

--17. Write a query to find the 4th minimum salary in the employees table. 

DECLARE @RANKING_MIN INT=4
SELECT * FROM (
SELECT EmployeeID, FirstName, LastName, Salary, DENSE_RANK() OVER(ORDER BY SALARY ASC)RANKING FROM Employees) EMP
WHERE RANKING = @RANKING_MIN

--18. Write a query to select last 10 records from a table. 

SELECT * FROM 
(SELECT TOP 10 * FROM Employees ORDER BY EMPLOYEEID DESC)EMP
ORDER BY EmployeeID ASC

--19. Write a query to list department number, name for all the departments in which there are no employees in the department. 

SELECT DepartmentID, DepartmentName FROM Departments 
WHERE DepartmentID NOT IN (SELECT DepartmentID FROM Employees)


--20. Write a query to get 3 maximum salaries. 

DECLARE @RANK_LIMIT INT=3
SELECT * FROM(
SELECT DENSE_RANK() over (order by salary desc) [SAL_RANK],EmployeeID,FirstName,LastName,Salary FROM Employees)EMP
WHERE SAL_RANK<=@RANK_LIMIT

--21. Write a query to get 3 minimum salaries. 

SELECT * FROM(
SELECT DENSE_RANK() over (order by salary) [SAL_RANK],EmployeeID,FirstName,LastName,Salary FROM Employees)EMP
WHERE SAL_RANK<=3

--22. Write a query to get nth max salaries of employees. 

DECLARE @n int
SELECT * FROM(
SELECT DENSE_RANK() over (order by salary desc) [SAL_RANK],EmployeeID,FirstName,LastName,Salary FROM Employees)EMP
WHERE SAL_RANK<=@n
