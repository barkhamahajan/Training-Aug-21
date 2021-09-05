--1.Create a batch Select Banking as ‘Bank Dept’, Insurance as ‘Insurance Dept’ and Services as ‘Services Dept’ from employee table

Select Banking as 'Bank Dept',Insurance as 'Insurance Dept',Services as 'Services Dept' 
FROM Employees

--2.5 Students Name, Address, City, DOB, Standard need to be inserted in the student table, need to fetch these result from json variable and select output in the json format

DECLARE @jsonINFO NVARCHAR(MAX)
SET @jsonINFO = N'{ "Students" : [
		{
		"Name":"Barkha",
		"Address":"Gota",
		"City":"Ahmedabad",
		"DOB":"04/12/1998",
		"Standard" : 12
		},
		{
		"Name":"Ram",
		"Address":"Ayodhya",
		"City":"Uttar Pradesh",
		"DOB":"17/08/1996",
		"Standard" : 5
		},
		{
		"Name":"Sita",
		"Address":"Andheri",
		"City":"Mumbai",
		"DOB":"10/10/2004",
		"Standard" :7
		},
		{
		"Name":"Shivi",
		"Address":"CP",
		"City":"Delhi",
		"DOB":"15/02/1997",
		"Standard" :10
		},
		{
		"Name":"Aditi",
		"Address":"Mayur Vihar",
		"City":"Delhi",
		"DOB":"17/04/2000",
		"Standard" :3
		}]
}'

INSERT INTO Student 
SELECT * 
FROM OPENJSON(@jsonINFO,'$.Students')
WITH
(
	Name VARCHAR(10) '$.Name',
	Address VARCHAR(20) '$.Address',
	City VARCHAR(15) '$.City',
	DOB VARCHAR(10) '$.DOB',
	Standard int '$.Standard'
)

--open and see
SELECT * FROM Student
SELECT * FROM Student FOR JSON PATH
