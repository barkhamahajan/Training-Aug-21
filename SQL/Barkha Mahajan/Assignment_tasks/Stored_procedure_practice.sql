--Stored Procedure Practice 
 Use office
 Go
 SELECT * FROM Employees
 SELECT * FROM Departments
 SELECT * FROM Locations
 SELECT * FROM Countries
 SELECT * FROM JobHistory
 
 --SELECT FIRST NAME OF PEOPLE WORKING IN COUNTRY ID AS ENTERED BY USER
 
 CREATE PROCEDURE county_wise_emp @country_id VARCHAR(5)
 AS
 SELECT FirstName FROM Employees WHERE DepartmentID IN
 (SELECT DepartmentID from Departments WHERE LocationID IN
 (SELECT LocationID FROM Locations WHERE CountryID=@country_id))

 EXEC county_wise_emp @country_id='US'

 --ALter procdure

 ALTER PROCEDURE county_wise_emp @country_id VARCHAR(5)
 AS
 SET NOCOUNT ON
 SELECT FirstName, LastName FROM Employees WHERE DepartmentID IN
 (SELECT DepartmentID from Departments WHERE LocationID IN
 (SELECT LocationID FROM Locations WHERE CountryID=@country_id))
 SET NOCOUNT OFF

 EXEC county_wise_emp @country_id='UK'

 --delete procedure 

 DROP PROCEDURE county_wise_emp

 --null parameter

 CREATE PROCEDURE name_against_id @emp_id INT NULL
 AS
  IF @emp_id is NULL
    PRINT('Enter employee id')
  ELSE
    BEGIN
    SELECT FirstName FROM Employees
    WHERE EmployeeID=@emp_id
    end

EXEC name_against_id @emp_id=101
EXEC name_against_id @emp_id=NULL

--output parameter

 ALTER PROCEDURE county_wise_emp_output @country_id VARCHAR(5), @rows INT OUTPUT, @lname VARCHAR(10) OUT
 AS
 SELECT FirstName FROM Employees WHERE DepartmentID IN
 (SELECT DepartmentID from Departments WHERE LocationID IN
 (SELECT LocationID FROM Locations WHERE CountryID=@country_id))

 SELECT @rows=@@ROWCOUNT
 SET @lname=( SELECT LastName FROM Employees WHERE EmployeeID =180)

 DECLARE @rows_op INT
 DECLARE @last_name VARCHAR(10)
 EXEC county_wise_emp_output @country_id='US', @rows=@rows_op OUTPUT, @lname=@last_name OUTPUT
 SELECT @rows_op
 SELECT @last_name
