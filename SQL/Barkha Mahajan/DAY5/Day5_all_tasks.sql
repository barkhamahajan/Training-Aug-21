
CREATE TABLE Incentive ( EMPLOYEE_REF_ID INT CONSTRAINT emp_fk REFERENCES Employee(EMPLOYEE_ID) ON UPDATE CASCADE, 
INCENTIVE_DATE DATE NOT NULL, 
INCENTIVE_AMOUNT MONEY NOT NULL )

INSERT INTO Employee (FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT, MANAGER_ID)
VALUES ('John', 'Abraham', 1000000, '2013-01-01 00:00:00', 'Banking', NULL),
 ('Michael', 'Clarke', 8000000, '2013-01-01 00:00:00', 'Insurance', 1),
 ('Roy', 'Thomas', 7000000, '2013-02-01 00:00:00', 'Banking', 1),
 ('Tom', 'Jose', 6000000, '2013-02-01 00:00:00', 'Insurance', 2),
 ('Jerry', 'Pinto', 6500000, '2013-02-01 00:00:00', 'Insurance', 3),
 ('Philip', 'Mathew', 7500000, '2013-01-01 00:00:00', 'Services', 3),
 ('TestName1', '123', 6500000, '2013-01-01 00:00:00', 'Services', 2),
 ('TestName2', 'Lname%', 6000000, '2013-02-01 00:00:00', 'Insurance', 2)

 INSERT INTO Incentive (EMPLOYEE_REF_ID, INCENTIVE_DATE, INCENTIVE_AMOUNT)
 VALUES (1, '2013-02-01', 5000),
 (2, '2013-02-01', 3000),
 (3, '2013-02-01', 4000)

 select Employee_id, FIRST_NAME, LAST_NAME, Salary, 
 JOININGG_DATE=(CONVERT(Varchar(13) , JOINING_DATE, 106)+' '+ RIGHT(CONVERT(VARCHAR(20), JOINING_DATE, 100), 7)), DEPARTMENT, MANAGER_ID 
 from Employee

--Q1 Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

 SELECT e.Employee_ID, DIFF_IN_MONTHS=CONVERT(VARCHAR(5),DATEDIFF(MM, e.joining_date, i.incentive_date) )+' Months and '+ CONVERY(VARCHAR(5),DATEDIFF(YEARS, e.joining_date, i.incentive_date))+' Years'
 from Employee e join Incentive i
on e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID

--Q2 Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

Select e.FIRST_NAME, i.INCENTIVE_AMOUNT FROM Employee e JOIN Incentive i
ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID
WHERE INCENTIVE_AMOUNT>3000
 
--Q3 Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

Select e.FIRST_NAME, i.INCENTIVE_AMOUNT FROM Employee e LEFT OUTER JOIN Incentive i
ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID

--Q4 Select EmployeeName, ManagerName from the employee table.

SELECT Employee=e.FIRST_NAME , Manager= m.fIRST_NAME FROM Employee e LEFT OUTER JOIN Employee m
ON e.MANAGER_ID=m.EMPLOYEE_ID

--Q5 Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get 
--incentives and set incentive amount as 0 for those employees who didn’t get incentives.

SELECT e.FIRST_NAME, ISNULL(i.INCENTIVE_AMOUNT,0) FROM Employee e LEFT OUTER JOIN Incentive i
ON e.EMPLOYEE_ID=i.EMPLOYEE_REF_ID
