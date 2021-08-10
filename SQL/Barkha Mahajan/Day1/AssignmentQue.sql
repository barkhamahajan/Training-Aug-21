CREATE TABLE B_Employee (
Employee_Id INT PRIMARY KEY IDENTITY(1,1),
FirstName VARCHAR(10) NOT NULL,
LastName VARCHAR(10) NOT NULL,
Email VARCHAR(15) NOT NULL,
MobileNo VARCHAR(10) NOT NULL,
Salary INT NOT NULL,
Comission INT NOT NULL CONSTRAINT unqCom UNIQUE
)

CREATE TABLE Inventory(
Item_id INT PRIMARY KEY IDENTITY (1,1),
Item_Name VARCHAR(15),
Item_qty INT
)


CREATE TABLE sales(
srno INT PRIMARY KEY IDENTITY (1,1) ,
EmployeeNo INT CONSTRAINT emp_fkForeig REFERENCES B_Employee(Employee_Id) on update NO ACTION,
ItemNo INT CONSTRAINT item_fkForeig REFERENCES Inventory(Item_id) on update NO ACTION,
SaleQty INT
)
 


INSERT INTO B_Employee VALUES ('SHREYA','THAKKAR','shreya@','9870090990',1000,10)
INSERT INTO B_Employee VALUES ('Barkha','Mahajan','barkha@','9870090990',2000,20)
INSERT INTO B_Employee VALUES ('Shasaa','hsdgjs','shsasas@','9870090990',3000,30)
INSERT INTO Inventory VALUES ('chips',100)
INSERT INTO Inventory VALUES ('Coke',50)
INSERT INTO Inventory VALUES ('Chocolate',30)
INSERT INTO sales VALUES (1,1,20)
INSERT INTO sales VALUES (2,2,30)
INSERT INTO sales VALUES (2,3,10)

select * from B_Employee
select * from Inventory
select * from sales



