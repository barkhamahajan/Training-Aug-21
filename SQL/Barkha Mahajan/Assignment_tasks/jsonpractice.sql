DECLARE @jsonfile NVARCHAR(MAX)
SET @jsonfile=N'{"INFORMATION":[
            {
              "ID":"1",
              "Name" : "Barkha Mahajan",
              "Digits" : "9987656780",
              "Age": 23,
              "Gender" : "F",
              "Interests": {"Interest1": "Reading", 
              "Interest2":"Sleeping",
              "Interest3":"Travelling"},
              "Colours" : ["Blue", "Purple","Yellow","Black", "Beige"]
            },
            {
                "ID":"2",
              "Name" : "Aditi Bindra",
              "Digits" : "9985688340",
              "Age": 19,
              "Gender" : "F",
              "Interests": {"Interest1":"Drawing", "Interest2":"Exploing"},
              "Colours" : ["Red"]
            },
            {
                "ID":"3",
              "Name" : "Raman Bisht",
              "Digits" : "9678453895",
              "Age": 25,
              "Gender" : "M",
              "Interests": {"Interest1":"Football"},
              "Colours" : ["Blue", "Black"]
            }
        ]}'; 


--open json inside json file and open array
SELECT id, name, Mobile, age, gender, interest, colour,  different_colour FROM OPENJSON(@jsonfile, '$.INFORMATION')
  WITH(
    id VARCHAR(1) '$.ID',
    name VARCHAR(20) '$.Name',
    Mobile VARCHAR(15) '$.Digits',
    age int '$.Age',
    gender VARCHAR(1) '$.Gender',
    interest NVARCHAR(MAX)  '$.Interests' AS JSON,
    colour NVARCHAR(MAX) '$.Colours' AS JSON)
    CROSS APPLY OPENJSON(colour) WITH
    --or outer apply
    (
    Different_colour VARCHAR(10) '$'
    )

--parse array in json file
SELECT id, name, Mobile, age, gender, interest, colour,  different_colour FROM OPENJSON(@jsonfile)
  WITH(
    id VARCHAR(1) '$.INFORMATION[0].ID',
    name VARCHAR(20) '$.INFORMATION[0].Name',
    Mobile VARCHAR(15) '$.INFORMATION[0].Digits',
    age int '$.INFORMATION[0].Age',
    gender VARCHAR(1) '$.INFORMATION[0].Gender',
    interest NVARCHAR(MAX)  '$.INFORMATION[0].Interests' AS JSON,
    colour NVARCHAR(MAX) '$.INFORMATION[0].Colours' AS JSON)
    CROSS APPLY OPENJSON(colour) WITH
    --or outer apply
    (
    Different_colour VARCHAR(10) '$'
    )

--Opening all array for every data part
SELECT * FROM OPENJSON(@jsonfile)
  WITH(
    id VARCHAR(1) '$.INFORMATION[0].ID',
    name VARCHAR(20) '$.INFORMATION[0].Name',
    Mobile VARCHAR(15) '$.INFORMATION[0].Digits',
    age int '$.INFORMATION[0].Age',
    gender VARCHAR(1) '$.INFORMATION[0].Gender',
    interest NVARCHAR(MAX)  '$.INFORMATION[0].Interests' AS JSON,
    colour NVARCHAR(MAX) '$.INFORMATION[0].Colours' AS JSON
    )
UNION ALL
SELECT * FROM OPENJSON(@jsonfile)
  WITH(
    id VARCHAR(1) '$.INFORMATION[1].ID',
    name VARCHAR(20) '$.INFORMATION[1].Name',
    Mobile VARCHAR(15) '$.INFORMATION[1].Digits',
    age int '$.INFORMATION[1].Age',
    gender VARCHAR(1) '$.INFORMATION[1].Gender',
    interest NVARCHAR(MAX)  '$.INFORMATION[1].Interests' AS JSON,
    colour NVARCHAR(MAX) '$.INFORMATION[1].Colours' AS JSON
    )
UNION ALL
SELECT * FROM OPENJSON(@jsonfile)
  WITH(
    id VARCHAR(1) '$.INFORMATION[2].ID',
    name VARCHAR(20) '$.INFORMATION[2].Name',
    Mobile VARCHAR(15) '$.INFORMATION[2].Digits',
    age int '$.INFORMATION[2].Age',
    gender VARCHAR(1) '$.INFORMATION[2].Gender',
    interest NVARCHAR(MAX)  '$.INFORMATION[2].Interests' AS JSON,
    colour NVARCHAR(MAX) '$.INFORMATION[2].Colours' AS JSON
    )

--ALL values display for one part of array
SELECT * FROM OPENJSON(@jsonfile)
  WITH(
    id VARCHAR(1) '$.INFORMATION[1].ID',
    name VARCHAR(20) '$.INFORMATION[1].Name',
    Mobile VARCHAR(15) '$.INFORMATION[1].Digits',
    age int '$.INFORMATION[1].Age',
    gender VARCHAR(1) '$.INFORMATION[1].Gender',
    interest NVARCHAR(MAX)  '$.INFORMATION[1].Interests' AS JSON,
    colour NVARCHAR(MAX) '$.INFORMATION[1].Colours' AS JSON
    )

--Selected values display
SELECT * FROM OPENJSON(@jsonfile)
  WITH(
    id VARCHAR(1) '$.INFORMATION[1].ID',
    name VARCHAR(20) '$.INFORMATION[1].Name',
    Mobile VARCHAR(10) '$.IFORMATION[1].Digits',
    age int '$.INFORMATION[1].Age',
    gender VARCHAR(1) '$.INFORMATION[1].Gender'
    )

--OR

SELECT id, name, age, colour FROM OPENJSON (@jsonfile)
  WITH(
    id VARCHAR(1) '$.INFORMATION[1].ID',
    name VARCHAR(20) '$.INFORMATION[1].Name',
    age int '$.INFORMATION[1].Age',
    colour NVARCHAR(MAX) '$.INFORMATION[1].Colours' AS JSON
  )

--Check for valid json
IF ISJSON(@jsonfile)=1
PRINT('yes, json file')
else
PRINT('no, not json file')

--open json
SELECT * FROM OPENJSON (@jsonfile, '$.INFORMATION')

--Select data from json
--Single value
--Entire array
SELECT JSON_QUERY(@jsonfile,'$.INFORMATION[0].Colours')
SELECT JSON_QUERY(@jsonfile,'$.INFORMATION[0].Interests')

--one value from array
SELECT JSON_VALUE(@jsonfile,'$.INFORMATION[0].Colours[1]')
SELECT JSON_VALUE(@jsonfile,'$.INFORMATION[0].Interests.Interest2')

--simple value
SELECT JSON_VALUE(@jsonfile,'$.INFORMATION[0].Name')

--create json for a table

SELECT * FROM Employees FOR JSON PATH
