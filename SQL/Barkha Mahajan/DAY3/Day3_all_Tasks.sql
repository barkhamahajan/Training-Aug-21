SELECT * From dbo.Employees

--Q1 Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters ‘A’, ‘J’ or ‘M’. 
--Give each column an appropriate label. Sort the results by the employees’ FirstName

SELECT FirstName'First Name', LEN(FirstName) 'Name length' FROM Dbo.Employees
WHERE FirstName LIKE ('A%') OR FirstName LIKE ('J%') OR FirstName LIKE ('M%')
ORDER BY FirstName

--Q2Write a query to display the FirstName and Salary for all employees. 
--Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.

SELECT FirstName ,
SALARY = REPLICATE('$', 10-LEN(Salary))+CAST(LEFT(SALARY,10) AS varchar(10)) 
FROM dbo.employees

--Q3Write a query to display the employees with their code, first name, last name and hire date who hired 
--either on seventh day of any month or seventh month in any year.

SELECT EmployeeID, FirstName,LastName,HireDate FROM dbo.Employees
WHERE DATEPART(dd,HireDate) LIKE 07 OR DATEPART(mm,HireDate) LIKE 07

--Q4 Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.

SELECT FirstName ,LEN(FirstName) 'First Name Length', LastName FROM dbo.Employees
WHERE LastName LIKE '__%c%'

--Q5 Write a query to extract the last 4 character of PhoneNumber.

SELECT RIGHT(PhoneNumber, 4) 'Last 4 digits of Phone No.' FROM dbo.Employees 

--Q6 Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’.

SELECT REPLACE(PhoneNumber, '124', '9999') 'New Number'  FROM dbo.Employees

--Q7 Write a query to calculate the age in year.

SELECT Hiredate, DATEPART(year,GETDATE())-DATEPART(year, HireDate) AS 'Years in company' FROM dbo.Employees

--OR

SELECT Hiredate, DATEDIFF(YEAR, HireDAte, GETDATE()) AS 'Years in company' FROM dbo.Employees

--Q8 Write a query to get the distinct Mondays from HireDate in employees tables.

SELECT  HireDate FROM Employees 
WHERE  DATENAME(WEEKDAY,HireDate) LIKE 'Monday'

--Q9 Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’

SELECT FirstName , HireDate FROM dbo.Employees
WHERE CAST(HireDate AS varchar) BETWEEN '1987-06-01' AND '1897-07-30'

--Q10 Write a query to display the current date in the following format.Sample output : 12:00 AM Sep 5, 2014

SELECT LTRIM(RIGHT(CONVERT(VARCHAR(20), GETDATE(),100),7)) +' '+
SUBSTRING(DATENAME(MONTH, GETDATE()), 1, 3)+' '+ DATENAME(DAY, GETDATE()) + ', '+ DATENAME(YEAR, GETDATE())

--Q11 Write a query to get the FirstName, LastName who joined in the month of June.

SELECT FirstName, LastName, HireDate FROM dbo.Employees
WHERE DATENAME(MONTH, Hiredate) LIKE 'JUNE'

--Q12 Write a query to get first name, hire date and experience of the employees.

SELECT FirstName, LastName, HireDate,  Experience=DATEDIFF(YEAR, HireDAte, GETDATE()) FROM dbo.Employees

--Q13 Write a query to get first name of employees who joined in 1987.

SELECT FirstName, HireDate FROM dbo.Employees
WHERE DATEPART(YEAR, HireDate) like 1987
