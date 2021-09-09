--Assignment:
--Student->StudentID, StudentName, TotalFees,RemainingAmt
--Course->CourseID,CourseName,TotalFees
--CourseEnrolled->StudentID,CourseID
--FeePayment->StudentID,AmountPaid,DateofPayment

CREATE DATABASE learning
USE learning

CREATE TABLE Student(
  StudentID INT PRIMARY KEY,
  StudentName VARCHAR(20) NOT NULL,
  TotalFees MONEY NOT NULL,
  RemainingAmount MONEY
)

INSERT INTO Student
VALUES( 1, 'Barkha', 150, 0),
  ( 2, 'Shriya', 100, 50),
  ( 3, 'Rahul', 50, 100)

CREATE TABLE Course(
  CourseID INT PRIMARY KEY,
  CourseName VARCHAR(30) NOT NULL,
  TotalFees MONEY NOT NULL
)

INSERT INTO Course
Values (101, 'SQL', 500),
  (102, 'HTML', 300),
  (103, 'BOOTSTRAP', 400)

CREATE TABLE CourseEnrolled(
  StudentID INT FOREIGN KEY references Student(StudentID),
  CourseID INT FOREIGN KEY references Course(CourseID)
)
CREATE TABLE FeePayment(
  StudentID INT FOREIGN KEY references Student(StudentID),
  AmountPaid MONEY NOT NULL,
  DateOfPayment DATE NOT NULL
)

--Q1. Create an insert trigger on CourseEnrolled Table, record should be updated in TotalFees Field on the Student table for the respective student.

ALTER TRIGGER ques1 ON CourseEnrolled
FOR INSERT
AS
BEGIN
UPDATE S
SET S.TotalFees=S.TotalFees+C.TotalFees, S.RemainingAmount=S.RemainingAmount+C.TotalFees
FROM Student S, CourseEnrolled CE, Course C
WHERE S.StudentID=CE.StudentID AND CE.CourseID=C.CourseID

PRINT('Value updated in Student Table')
END

INSERT INTO CourseEnrolled
VALUES (1,101)

SELECT * FROM Student

--Q2. Create an insert trigger on FeePayment, record should be updated in RemainingAmt Field of the Student Table for the respective student.

CREATE TRIGGER ques2 ON FeePayment 
FOR INSERT 
AS
BEGIN 
UPDATE S
SET S.RemainingAmount -= FP.AmountPaid
FROM Student S, FeePayment FP
WHERE S.StudentID=FP.StudentID
END

INSERT INTO FeePayment
VALUES (1, 100, '2021-09-09')
INSERT INTO FeePayment
VALUES (3, 75, '2021-09-09')

select * from FeePayment
select * from CourseEnrolled
select * from Course
select * from Student
