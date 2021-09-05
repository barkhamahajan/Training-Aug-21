CREATE DATABASE PRACTICE
USE PRACTICE

--CREATE EXERCISES
--1 Write a SQL statement to create a simple table countries including columns country_id,country_name and 
--region_id. make sure that the column country_id will be unique and store an auto incremented value.

CREATE TABLE COUNTRIES
(  COUNTRY_ID INT PRIMARY KEY IDENTITY(100,1),
  COUNTRY_NAME VARCHAR(15),
  REGION_ID INT
)

--2Write a SQL statement to create a simple table countries including columns country_id, country_name and region_id which is already exists.

--CREATE TABLE IF NOT EXISTS COUNTRIIES 
--(
  --COUNTRY_ID INT PRIMARY KEY IDENTITY(100,1),
  --COUNTRY_NAME VARCHAR(15),
  --REGION_ID INT
--)
--------------------????????

--3Write a SQL statement to create the structure of a table dup_countries similar to countries.

---DONE USING INTERFACE

--4 Write a SQL statement to create a duplicate copy of countries table including structure and data by name dup_data_countries.

SELECT * INTO DUP_DATA_COUNTRIES FROM DUP_COUNTRIES 


--5 Write a SQL statement to create a table countries set a constraint NULL.

CREATE TABLE COUNTRIES_5
(  COUNTRY_ID VARCHAR(10) PRIMARY KEY,
  COUNTRY_NAME VARCHAR(15),
  REGION_ID INT CONSTRAINT SET_NULL NULL
)

--6 Write a SQL statement to create a table named jobs including columns 
--job_id, job_title, min_salary, max_salary and check whether the max_salary amount exceeding the upper limit 25000.

CREATE TABLE JOBS
(
  JOB_ID INT PRIMARY KEY  IDENTITY(10,2),
  JOB_TITLE VARCHAR(10) NOT NULL,
  MIN_SALARY MONEY NOT NULL,
  MAX_SALARY MONEY NOT NULL CONSTRAINT CHK_MAX_SAL CHECK (MAX_SALARY >25000)
)

--7 Write a SQL statement to create a table named countries including columns country_id, 
--country_name and region_id and make sure that no countries except Italy, India and China will be entered in the table. and combination of columns country_id and region_id will be unique.


CREATE TABLE COUNTRIES_7
(
  COUNTRY_ID INT PRIMARY KEY IDENTITY(100,1),
  COUNTRY_NAME VARCHAR(15) CONSTRAINT CHK_COUNTRY CHECK (COUNTRY_NAME IN ('INDIA', 'CHINA', 'ITALY')),
  REGION_ID INT,
  CONSTRAINT UN_CID_RID UNIQUE(COUNTRY_ID, REGION_ID)
)

--8 Write a SQL statement to create a table named job_history including columns employee_id, start_date, 
--end_date, job_id and department_id and make sure that the value against column end_date will be entered at the time of insertion to the format like '--/--/----'.


CREATE TABLE JOB_HISTORY
(
  EMPLOYEE_ID INT PRIMARY KEY,
  START_DATE DATE NOT NULL,
  END_DATE DATE CONSTRAINT CHK_DATE_INPUT CHECK(END_DATE LIKE '//____'),
  JOB_ID INT NOT NULL,
  DEPARTMENT_ID INT NOT NULL,
)

--9 Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary and max_salary, and make sure that, 
--the default value for job_title is blank and min_salary is 8000 and max_salary is NULL will be 
--entered automatically at the time of insertion if no value assigned for the specified columns.

CREATE TABLE JOBS_9
(
  JOB_ID INT PRIMARY KEY  IDENTITY(10,2),
  JOB_TITLE VARCHAR(10) CONSTRAINT DEF_VAL DEFAULT ' ',
  MIN_SALARY MONEY CONSTRAINT DEF_VAL_MIN_SAL DEFAULT 8000,
  MAX_SALARY MONEY CONSTRAINT DEF_VAL_MAX_SAL DEFAULT NULL
)

--10 Write a SQL statement to create a table job_history including columns employee_id, 
--start_date, end_date, job_id and department_id and make sure that, the employee_id column does not contain any 
--duplicate value at the time of insertion and the foreign key column job_id contain only those values which are exists in the jobs table.

--Here is the structure of the table jobs;

--+------------+--------------+------+-----+---------+-------+
--| Field      | Type         | Null | Key | Default | Extra |
--+------------+--------------+------+-----+---------+-------+
--| JOB_ID     | varchar(10)  | NO   | PRI |         |       |
--| JOB_TITLE  | varchar(35)  | NO   |     | NULL    |       |
--| MIN_SALARY | decimal(6,0) | YES  |     | NULL    |       |
--| MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
--+------------+--------------+------+-----+---------+-------+


CREATE TABLE JOB_HISTORY_10
(
  EMPLOYEE_ID INT PRIMARY KEY,
  START_DATE DATE NOT NULL,
  END_DATE DATE,
  JOB_ID INT CONSTRAINT FK_JOBID FOREIGN KEY REFERENCES JOBS(JOB_ID),
  DEPARTMENT_ID INT NOT NULL,
)

--11 Write a SQL statement to create a table employees including columns employee_id, first_name, 
--last_name, email, phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, 
--the employee_id column does not contain any duplicate value at the time of insertion and the foreign key columns combined by 
--department_id and manager_id columns contain only those unique combination values, which combinations are exists in the departments table.

--Assume the structure of departments table below.

--+-----------------+--------------+------+-----+---------+-------+
--| Field           | Type         | Null | Key | Default | Extra |
--+-----------------+--------------+------+-----+---------+-------+
--| DEPARTMENT_ID   | decimal(4,0) | NO   | PRI | 0       |       |
--| DEPARTMENT_NAME | varchar(30)  | NO   |     | NULL    |       |
--| MANAGER_ID      | decimal(6,0) | NO   | PRI | 0       |       |
--| LOCATION_ID     | decimal(4,0) | YES  |     | NULL    |       |
--+-----------------+--------------+------+-----+---------+-------+


CREATE TABLE DEPARTMENT
(
  DEPARTMENT_ID INT NOT NULL,
  DEPARTMENT_NAME VARCHAR(30) NOT NULL,
  MANAGER_ID INT NOT NULL,
  LOCATION_ID INT,
  PRIMARY KEY(DEPARTMENT_ID, MANAGER_ID)
)

CREATE TABLE EMPLOYEES
(
  EMPLOYEE_ID INT PRIMARY KEY IDENTITY(1,1),
  FIRST_NAME VARCHAR(20) NOT NULL,
  LAST_NAME VARCHAR(20) NOT NULL,
  EMAIL VARCHAR(50) CONSTRAINT VALID_EMAIL CHECK ( EMAIL LIKE '_%@___%.___'),
  PHONE_NUMBER VARCHAR(10) CONSTRAINT VALID_NO CHECK (PHONE_NUMBER LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  HIRE_DATE DATE NOT NULL,
  JOB_ID INT NOT NULL,
  SALARY MONEY ,
  COMMISSION MONEY,
  MANAGER_ID INT,
  DEPARTMENT_ID INT,
  CONSTRAINT FK_MGR_DPT FOREIGN KEY (DEPARTMENT_ID, MANAGER_ID) REFERENCES DEPARTMENT(DEPARTMENT_ID, MANAGER_ID)
)

--12 Write a SQL statement to create a table employees including columns employee_id, first_name, last_name, email, 
--phone_number hire_date, job_id, salary, commission, manager_id and department_id and make sure that, the employee_id column
--does not contain any duplicate value at the time of insertion, and the foreign key column department_id, reference by the column 
--department_id of departments table, can contain only those values which are exists in the departments table and another foreign key column 
--job_id, referenced by the column job_id of jobs table, can contain only those values which are exists in the jobs table. 


--Assume that the structure of two tables departments and jobs.

--+-----------------+--------------+------+-----+---------+-------+
--| Field           | Type         | Null | Key | Default | Extra |
--+-----------------+--------------+------+-----+---------+-------+
--| DEPARTMENT_ID   | decimal(4,0) | NO   | PRI | 0       |       |
--| DEPARTMENT_NAME | varchar(30)  | NO   |     | NULL    |       |
--| MANAGER_ID      | decimal(6,0) | YES  |     | NULL    |       |
--| LOCATION_ID     | decimal(4,0) | YES  |     | NULL    |       |
--+-----------------+--------------+------+-----+---------+-------+


--+------------+--------------+------+-----+---------+-------+
--| Field      | Type         | Null | Key | Default | Extra |
--+------------+--------------+------+-----+---------+-------+
--| JOB_ID     | varchar(10)  | NO   | PRI |         |       |
--| JOB_TITLE  | varchar(35)  | NO   |     | NULL    |       |
--| MIN_SALARY | decimal(6,0) | YES  |     | NULL    |       |
--| MAX_SALARY | decimal(6,0) | YES  |     | NULL    |       |
--+------------+--------------+------+-----+---------+-------+

CREATE TABLE DEPARTMENT_12
(
  DEPARTMENT_ID INT NOT NULL,
  DEPARTMENT_NAME VARCHAR(30) NOT NULL,
  MANAGER_ID INT NOT NULL,
  LOCATION_ID INT,
  PRIMARY KEY(DEPARTMENT_ID)
)

CREATE TABLE EMPLOYEES_12
(
  EMPLOYEE_ID INT PRIMARY KEY IDENTITY(1,1),
  FIRST_NAME VARCHAR(20) NOT NULL,
  LAST_NAME VARCHAR(20) NOT NULL,
  EMAIL VARCHAR(50) CONSTRAINT VALID_EMAIL_12 CHECK ( EMAIL LIKE '_%@___%.___'),
  PHONE_NUMBER VARCHAR(10) CONSTRAINT VALID_NO_12 CHECK (PHONE_NUMBER LIKE '[9-5][9-5][9-5][9-5][9-5][9-5][9-5][9-5][9-5][9-5]'),
  HIRE_DATE DATE NOT NULL,
  JOB_ID INT FOREIGN KEY REFERENCES JOBS(JOB_ID),
  SALARY MONEY ,
  COMMISSION MONEY,
  MANAGER_ID INT,
  DEPARTMENT_ID INT FOREIGN KEY REFERENCES DEPARTMENT_12(DEPARTMENT_ID),
)
