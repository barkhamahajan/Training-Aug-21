USE office

SELECT * FROM Employees

--Q1. Create a scaler Function to compute PF which will accept parameter basicsalary and compute PF. PF is 12% of the basic salary.

--FUNCTION
CREATE FUNCTION compute_pf (@salary INT)
RETURNS FLOAT
AS
BEGIN
RETURN (@salary*0.12)
END

--EXECUTE
DECLARE @sal FLOAT

--Q2. Create a scaler Function which will compute PT which will accept MontlyEarning. Criteria as below.
--Monthly Earnings	Profession Tax Payable
--Below Rs. 5999	Nil
--Rs. 6000 to Rs. 8999	Rs. 80/month
--Rs. 9000 to Rs. 11999	Rs. 150/month
--Rs 12000 and above	Rs. 200/month

--FUNCTION
CREATE FUNCTION compute_pt_condition (@salary INT)
RETURNS VARCHAR(20)
AS
BEGIN
DECLARE @text VARCHAR(20)
IF @salary<5999
  SET @text=('NILL')
IF @salary BETWEEN 6000 AND 8999
  SET @text=('Rs. 80/month')
IF @salary BETWEEN 9000 AND 11999
  SET @text=('Rs. 150/month')
ELSE
  SET @text=('Rs. 200/month')
RETURN @text
END

--EXECUTE
DECLARE @pt VARCHAR(20)
SET @pt=dbo.compute_pt_condition(25760)
PRINT (@pt)

--Q3. Create a table valued function which will accept JobTitle which will return new table set based on jobtitle
