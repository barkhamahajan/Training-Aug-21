--DAY 4 using cte
--Q1 Write a query to rank employees based on their salary for a month

WITH CTE_SAL_RANK
AS
(
SELECT FirstName+' '+LastName 'Name',  Salary, RANK() OVER (ORDER BY SALARY) [RANK] FROM Employees
)
SELECT * FROM CTE_SAL_RANK

--Q2 Select 4th Highest salary from employee table using ranking function

WITH CTE_4_RANK_SAL
AS
(
SELECT FirstName+' '+LastName 'Name',  Salary, SAL_RANK=DENSE_RANK() OVER (ORDER BY SALARY DESC) FROM Employees
)
SELECT * FROM CTE_4_RANK_SAL
WHERE [SAL_RANK]=4

--Q3Get department, total salary with respect to a department from employee table.

WITH CTE_DEPTWISE_SAL
AS
(
SELECT DepartmentID, Total_Salary=SUM(Salary) from Employees
GROUP BY DepartmentID
)
SELECT * FROM CTE_DEPTWISE_SAL

--Q4 Get department, total salary with respect to a department from employee table order by total salary descending

WITH CTE_DEPTWISE_SAL_DESC
AS
(
SELECT DepartmentID, Total_Salary=SUM(Salary) from Employees
GROUP BY DepartmentID
)
SELECT * FROM CTE_DEPTWISE_SAL_DSC
ORDER BY TOTAL_SALARY DESC

--Q5 Get department wise maximum salary from employee table order by salary ascending

WITH CTE_DEPTWISE_MAX_SAL
AS (
SELECT E.DepartmentID, D.DEPARTMENTNAME,  MAX(Salary) AS MAX_SALARY  FROM Employees E, Departments D
WHERE E.DepartmentID=D.DepartmentID 
GROUP BY  E.DepartmentID, D.DEPARTMENTNAME
)
SELECT * FROM CTE_DEPTWISE_MAX_SAL
ORDER BY MAX_SALARY

--Q6Get department wise minimum salary from employee table order by salary ascending

WITH CTE_DEPTWISE_MIN_SAL
AS (
SELECT E.DepartmentID, D.DEPARTMENTNAME,  MIN(Salary) AS MIN_SALARY  FROM Employees E, Departments D
WHERE E.DepartmentID=D.DepartmentID 
GROUP BY  E.DepartmentID, D.DEPARTMENTNAME
)
SELECT * FROM CTE_DEPTWISE_MIN_SAL
ORDER BY MIN_SALARY

--7 Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending

WITH CTE_DEPT_SAL_50000
AS
(
SELECT E.DepartmentID, D.DEPARTMENTNAME, SUM(Salary) AS TOTAL_SALARY  FROM Employees E, Departments D
WHERE E.DepartmentID=D.DepartmentID 
GROUP BY  E.DepartmentID, D.DEPARTMENTNAME
)
SELECT * FROM CTE_DEPT_SAL_50000
WHERE TOTAL_SALARY>50000
ORDER BY TOTAL_SALARY DESC
