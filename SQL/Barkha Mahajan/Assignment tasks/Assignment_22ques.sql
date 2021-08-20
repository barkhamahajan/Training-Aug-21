SELECT * FROM Employees
SELECT * FROM Departments
SELECT * FROM Locations

--1

SELECT FIRSTNAME, LASTNAME FROM Employees
WHERE Salary > (SELECT SALARY FROM Employees WHERE LastName='Bull')

--2

SELECT FIRSTNAME, LASTNAME FROM Employees
WHERE DepartmentID=(SELECT DepartmentID FROM Departments WHERE DepartmentName='IT')

--3

SELECT FIRSTNAME, LASTNAME FROM Employees 
WHERE DepartmentID IN(
SELECT DepartmentID FROM Departments 
WHERE LocationID IN
(SELECT LocationID FROM Locations WHERE CountryID='US'))

--4

SELECT FIRSTNAME,LASTNAME FROM Employees 
WHERE EmployeeID IN (SELECT ManagerID FROM Employees)

--5

SELECT FIRSTNAME, LASTNAME, Salary FROM Employees 
WHERE Salary>(SELECT AVG(SALARY) FROM Employees)

--6????????

SELECT DISTINCT JobId FROM Employees 
WHERE Salary IN (SELECT MIN(SALARY),JobId FROM Employees GROUP BY JobId)
GROUP BY JobId

SELECT E.FirstName,E.LastName FROM Employees E JOIN Employees S
ON 

SELECT MIN(E.SALARY), D.DepartmentID FROM Employees E JOIN Departments D ON E.DEPARTMENTID=D.DEPARTMENTID
GROUP BY D.DEPARTMENTID

--7

SELECT FIRSTNAME, LASTNAME, Salary FROM Employees 
WHERE  Salary>(SELECT AVG(SALARY) FROM Employees) AND DepartmentID=(SELECT DepartmentID FROM Departments WHERE DepartmentName='IT')

--8

SELECT FIRSTNAME, LASTNAME, Salary FROM Employees 
WHERE Salary>(SELECT Salary FROM Employees WHERE LastName='BELL')

--9

SELECT FIRSTNAME, LASTNAME, Salary FROM Employees 
WHERE Salary=(SELECT MIN(SALARY) FROM Employees)

--10

SELECT FIRSTNAME, LASTNAME, Salary FROM Employees 
WHERE Salary>(SELECT AVG(SALARY) FROM Employees)

--11

SELECT FirstName+' '+LastName AS 'NAME', Salary FROM Employees 
WHERE Salary>(SELECT MAX(Salary) FROM Employees WHERE JobId='SH_CLERK')
ORDER BY Salary

--12

SELECT EmployeeID, FIRSTNAME,LASTNAME FROM Employees 
WHERE EmployeeID NOT IN (SELECT DISTINCT ManagerID FROM Employees)

--13

SELECT E.EmployeeID, E.FirstName, E.LastName, D.DepartmentName  FROM Employees E JOIN Departments D
ON E.DepartmentID=D.DepartmentID

--14??????? salary above the average salary of dept

SELECT AVG(S.Salary) [ASAL],S.DepartmentID,E.EmployeeID, E.FirstName, E.LastName,E.Salary FROM Employees E JOIN Employees S
ON E.EmployeeID=S.EmployeeID
GROUP BY S.DepartmentID

(SELECT AVG(SALARY), DEPARTMENTID FROM Employees GROUP BY DepartmentID)

--15?????????even number records

DECLARE @ctr AS INT =1
SELECT * FROM(
SELECT EmployeeID, @ctr = @ctr+ 1 [NUM] FROM  Employees)EMP
WHERE @ctr%2=0

SELECT * FROM Employees WHERE EmployeeID%2=0

--16

DECLARE @RANKING INT=5
SELECT * FROM (
SELECT EmployeeID, FirstName, LastName, Salary, DENSE_RANK() OVER(ORDER BY SALARY DESC)RANKING FROM Employees) EMP
WHERE RANKING = @RANKING

--17

DECLARE @RANKING_MIN INT=4
SELECT * FROM (
SELECT EmployeeID, FirstName, LastName, Salary, DENSE_RANK() OVER(ORDER BY SALARY ASC)RANKING FROM Employees) EMP
WHERE RANKING = @RANKING_MIN

--18

SELECT * FROM 
(SELECT TOP 10 * FROM Employees ORDER BY EMPLOYEEID DESC)EMP
ORDER BY EmployeeID ASC

--19

SELECT DepartmentID, DepartmentName FROM Departments 
WHERE DepartmentID NOT IN (SELECT DepartmentID FROM Employees)


SELECT E.DepartmentID FROM Employees E JOIN Employees e2 ON E.EmployeeID=E2.EmployeeID
WHERE 

--20

DECLARE @RANK_LIMIT INT=3
SELECT * FROM(
SELECT DENSE_RANK() over (order by salary desc) [SAL_RANK],EmployeeID,FirstName,LastName,Salary FROM Employees)EMP
WHERE SAL_RANK<=@RANK_LIMIT

--21

SELECT * FROM(
SELECT DENSE_RANK() over (order by salary) [SAL_RANK],EmployeeID,FirstName,LastName,Salary FROM Employees)EMP
WHERE SAL_RANK<=3

--22

DECLARE @n int
SELECT * FROM(
SELECT DENSE_RANK() over (order by salary desc) [SAL_RANK],EmployeeID,FirstName,LastName,Salary FROM Employees)EMP
WHERE SAL_RANK<=@n
