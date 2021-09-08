USE BANK
go

SELECT * FROM DEPOSIT
SELECT * FROM BRANCH
SELECT * FROM BORROW
SELECT * FROM CUSTOMER

--Q1 Create a Store Procedure which will accept name of the customer as input parameter and product the following output, 
--List Names of Customers who are Depositors and have Same Branch City as that of input parameter customer’s Name.

CREATE PROCEDURE depositors_from_name @cust_name VARCHAR(20)
AS
SELECT CNAME FROM DEPOSIT WHERE BNAME IN (
SELECT BNAME FROM BRANCH WHERE CITY=(
SELECT CITY FROM BRANCH WHERE BNAME=(SELECT BNAME FROM DEPOSIT WHERE CNAME=@cust_name)))

EXEC depositors_from_name @cust_name = 'sunil'

--Q2 Create a Store Procedure which will accept name of the customer as input parameter and produce the following output List in JSON format, 
--All the Depositors Having Depositors Having Deposit in All the Branches where input parameter customer is Having an Account

CREATE PROCEDURE depositors_from_name_branch @cust_name VARCHAR(10)
AS
SELECT CNAME FROM DEPOSIT WHERE BNAME IN (
SELECT BNAME FROM DEPOSIT WHERE CNAME =@cust_name)
FOR JSON PATH 

EXEC depositors_from_name_branch 'MEHUL'

--Q3 Create a Store Procedure that will accept city name and returns the number of customers in that city.

CREATE PROCEDURE cust_citywise @city VARCHAR(10)
AS
SELECT COUNT(*) FROM CUSTOMER
WHERE CITY=@city

EXEC cust_citywise 'Mumbai'

--Q4  Create a Store Procedure which will accept city of the customer as input parameter and product the following output List in JSON format
--List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI

CREATE PROCEDURE ques4 @city VARCHAR(10)
AS
SELECT C.CNAME FROM CUSTOMER C
JOIN DEPOSIT D
ON C.CNAME=D.CNAME
JOIN BRANCH B
ON D.BNAME=B.BNAME
WHERE C.CITY=@city AND B.CITY IN ('MUMBAI', 'DELHI')

EXEC ques4 'mumbai'

---OR

CREATE PROCEDURE ques4b @city VARCHAR(10)
AS
SELECT C.CNAME FROM CUSTOMER C
JOIN DEPOSIT D
ON C.CNAME=D.CNAME
JOIN BRANCH B
ON D.BNAME=B.BNAME
WHERE C.CITY=@city AND B.CITY IN ('MUMBAI', 'DELHI')
UNION ALL
SELECT C.CNAME FROM CUSTOMER C
JOIN BORROW B1
ON C.CNAME=B1.CNAME
JOIN BRANCH B
ON B1.BNAME=B.BNAME
WHERE C.CITY=@city AND B.CITY IN ('MUMBAI', 'DELHI')

EXEC ques4 'mumbai'

--Q5 Count the Number of Customers Living in the City where Branch is Located

CREATE PROCEDURE QUES5 @CITY varchar(20)
AS
SELECT COUNT(*) FROM CUSTOMER
WHERE CITY IN (SELECT CITY FROM BRANCH WHERE CITY=@CITY)

EXEC QUES5 'mumbai'

--Q6Create a Procedure which will accept input in JSON parameter CustomerName,City, ACTNO,Branch,amount  
--And insert these record in the Deposit table. Before inserting some validation should be done like amount should 
--be greater than 10Rs. and date should always be current date.

--create table

CREATE TABLE DEP(
      Name VARCHAR(50) NOT NULL,
      CITY VARCHAR(20) NOT NULL,
      ACTNO INT PRIMARY KEY,
      BRANCH VARCHAR(50) NOT NULL,
      AMOUNT MONEY NOT NULL CONSTRAINT VAL_ALLOWWED CHECK (AMOUNT>100)
      )

--PROCEDURE

CREATE PROCEDURE QUES6 @json_inp NVARCHAR(MAX)
AS 
INSERT INTO DEP (Name , CITY, ACTNO, BRANCH, AMOUNT)
SELECT Name , CITY, ACTNO, BRANCH, AMOUNT FROM OPENJSON(@json_inp)
WITH
  (
    Name VARCHAR(50) '$.CustomerName', 
    CITY VARCHAR(20) '$.CITY', 
    ACTNO INT '$.ACTNO', 
    BRANCH VARCHAR(20) '$.BRANCH', 
    AMOUNT MONEY '$.AMOUNT'
    )
 --json variable
DECLARE @jsonvar NVARCHAR(MAX)
SET @jsonvar = N'{
          "CustomerName": "PRIYA LANKA",
          "CITY" :"DELHI",
          "ACTNO" : 135,
          "BRANCH": "MAYUR VIHAR",
          "AMOUNT": 50048
        }'


--check json variable
--if isjson(@jsonvar)>0
--print('json')
--else
--print('not json')


EXEC QUES6 @json_inp=@jsonvar
SELECT * FROM DEP
