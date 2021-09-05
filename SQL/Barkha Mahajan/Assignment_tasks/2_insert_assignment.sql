--INSERT QUERY

--1 Write a SQL statement to insert a record with your own value into the table countries against each columns.and region_id.

INSERT INTO COUNTRIES VALUES ('INDIA', 11)

--2 Write a SQL statement to insert one row into the table countries against the column country_id and country_name.

INSERT INTO COUNTRIES (COUNTRY_NAME) VALUES ('CANADA')

--3 Write a SQL statement to insert 3 rows by a single insert statement

INSERT INTO COUNTRIES (COUNTRY_NAME, REGION_ID)
VALUES ('USA', 29),
  ('ITAY', 34),
  ('SOUTH KOREA',47)

--4 AND 5
--4 Write a SQL statement insert rows from country_new table to countries table.

--5. Here is the rows to insert for country_new table. Assume that, the countries table is empty.

--+------------+--------------+-----------+
--| COUNTRY_ID | COUNTRY_NAME | REGION_ID |
--+------------+--------------+-----------+
--| C0001      | India        |      1001 |
--| C0002      | USA          |      1007 |
--| C0003      | UK           |      1003 |
--+------------+--------------+-----------+


CREATE TABLE COUNTRY_NEW
(
  COUNTRY_ID VARCHAR(10) PRIMARY KEY,
  COUNTRY_NAME VARCHAR(10),
  REGION_ID INT
)

INSERT INTO COUNTRIES_5 (COUNTRY_ID,COUNTRY_NAME, REGION_ID)
SELECT * FROM COUNTRY_NEW 

--6 Write a SQL statement to insert one row in jobs table to ensure that no duplicate value will be entered in the job_id column.

INSERT INTO JOBS VALUES
  ('SALES', 2000,767357)
INSERT INTO JOBS VALUES
  ('MARKETING', 15000, 26000)

--7 AND 8 MISSING

--9 Write a SQL statement to insert a record into the table countries to ensure that, a country_id and region_id combination will be entered once in the table.

INSERT INTO COUNTRIES_7
VALUES ( 'INDIA', 10),
  ('ITALY', 20),
  ( 'CHINA', 10)

--10  Write a SQL statement to insert rows into the table countries in which the value of country_id column will be unique and auto incremented.

--SAME AS COUNTRIES QUES 1 ND 2 AND 3

--11 Write a SQL statement to insert records into the table countries to ensure that the country_id column will not contain any duplicate data and 
--this will be automatically incremented and the column country_name will be filled up by 'N/A' if no value assigned for that column

CREATE TABLE COUNTRIES_NA
(  COUNTRY_ID INT PRIMARY KEY IDENTITY(100,1),
  COUNTRY_NAME VARCHAR(15) DEFAULT 'N/A',
  REGION_ID INT
)

INSERT INTO COUNTRIES_NA ( COUNTRY_NAME, REGION_ID)
VALUES ('USA',12),
('INDIA', 14),
('BHUTAN', 24)

INSERT INTO COUNTRIES_NA (REGION_ID)
VALUES (45)

SELECT * FROM COUNTRIES_NA

--12 Write a SQL statement to insert rows in the job_history table in which one column job_id is 
--containing those values which are exists in job_id column of jobs table.

SELECT * FROM JOBS

INSERT INTO JOB_HISTORY_10
VALUES (1001,'2018-03-19','2020-11-21',10, 2),
(1002,'2014-04-01', '2020-11-19',16, 1)

--CONFLICT 18 NOT IN JOBS TABLE

INSERT INTO JOB_HISTORY_10
VALUES (1003,'2018-03-19', '2020-11-11',18, 6)

--13 Write a SQL statement to insert rows into the table employees in which a set of columns department_id and 
--manager_id contains a unique value and that combined values must have exists into the table departments

SELECT * FROM DEPARTMENT
SELECT * FROM EMPLOYEES

INSERT INTO DEPARTMENT
VALUES(10, 'SALES', 1002, 23),
(12, 'MARKETTING', 1008, 53),
(14, 'HR', 1016, 24)

INSERT INTO EMPLOYEES
VALUES ( 'BARKHA', 'MAHAJAN', 'BARKHA@GMAIL.COM', '9876545678', '2021-08-02', 29, 6484483568, 678765, 23, 10)

--14 Write a SQL statement to insert rows into the table employees in which a set of columns department_id and job_id contains the
--values which must have exists into the table departments and jobs.

INSERT INTO DEPARTMENT_12
VALUES(10, 'SALES', 1002, 23),
(12, 'MARKETTING', 1008, 53),
(14, 'HR', 1016, 24)

INSERT INTO EMPLOYEES_12
VALUES ( 'BARKHA', 'MAHAJAN', 'BARKHA@GMAIL.COM', 9999999999, '2021-08-02', 29, 6484483568, 678765, 23, 10)
