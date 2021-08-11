---1 QUE
select * from Employees
ALTER TABLE Employees DROP CONSTRAINT ukEmail
UPDATE Employees SET Email='not available'

---2 QUE

select * from Employees
UPDATE Employees SET Email='not available' , CommissionPct =0.10 

--3 QUE 

SELECT * FROM Employees where DepartmentID=110

UPDATE Employees SET Email='not availableQue3' , CommissionPct =0.100 WHERE DepartmentID=110
 

--4 que

 

UPDATE Employees SET Email='not availableQue4' , CommissionPct =0.100 WHERE DepartmentID=80 AND CommissionPct<0.2

 


--5 QUE

 


--UPDATE Employees SET Email='not availableQue5' WHERE 

 

--6 QUE

 

SELECT * FROM Employees

 

UPDATE Employees SET Salary=8000 where EmployeeID=105 AND Salary<5000

 

 


--7 QUE

 


--8 QUE

 

UPDATE Employees SET Salary += Salary*0.25 where DepartmentID = 40 
UPDATE Employees SET Salary += Salary*0.15 where DepartmentID = 90
UPDATE Employees SET Salary += Salary*0.10 where DepartmentID = 110 
