SELECT * FROM Employee
SELECT * FROM Incentive

--DAY5 using cte
--Q1 Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

WITH CTE_INCENTIVE_MONTH 
AS 
(
SELECT E.EMPLOYEE_ID, E.FIRST_NAME,'DIFF IN JOINING & INCENIVE'=DATEDIFF(MONTH, E.JOINING_DATE, I.INCENTIVE_DATE) FROM Employee E JOIN Incentive I
ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID
)
SELECT * FROM CTE_INCENTIVE_MONTH

--Q2 Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

WITH CTE_INCENTIVE_OVER_3000
AS
(
SELECT E.FIRST_NAME, I.INCENTIVE_AMOUNT FROM Employee E JOIN Incentive I
ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID
WHERE I.INCENTIVE_AMOUNT>3000
)
SELECT * FROM CTE_INCENTIVE_OVER_3000

--Q3 Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

WITH CTE_ALL_EMPS
AS
(
SELECT E.FIRST_NAME, I.INCENTIVE_AMOUNT FROM Employee E LEFT OUTER JOIN Incentive I
ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID
)
SELECT * FROM CTE_ALL_EMPS

--Q4 Select EmployeeName, ManagerName from the employee table.

WITH CTE_EMP_MNGR
AS
(
SELECT E.FIRST_NAME+' '+E.LAST_NAME AS 'EMPLOYEE', M.FIRST_NAME+' '+M.LAST_NAME AS 'MANAGER' FROM Employee E JOIN Employee M
ON E.MANAGER_ID=M.EMPLOYEE_ID
)
SELECT * FROM CTE_EMP_MNGR

--Q5Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives 
--and set incentive amount as 0 for those employees who didn’t get incentives.


WITH CTE_EMPS
AS
(
SELECT E.FIRST_NAME+' '+E.LAST_NAME AS 'NAME',INCENTIVE=ISNULL( I.INCENTIVE_AMOUNT,0) FROM Employee E LEFT OUTER JOIN Incentive I
ON E.EMPLOYEE_ID=I.EMPLOYEE_REF_ID
)
SELECT * FROM CTE_EMPS
