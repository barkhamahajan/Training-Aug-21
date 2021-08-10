CREATE DATABASE practicedb

USE practicedb


CREATE TABLE countries (
CountryId int PRIMARY KEY IDENTITY (100,1),
CountryName varchar(10) NOT NULL ,
RegionId INT NOT NULL 
 )
ALTER TABLE countries ADD CONSTRAINT UQ_regionandcountryid UNIQUE (CountryId,RegionId) 

ALTER TABLE countries ADD CONSTRAINT Restrict_countryname CHECK(CountryName IN ('India','Italy','Chaina') )

SELECT * FROM countries

INSERT INTO countries VALUES ('Italy',13)
INSERT INTO countries VALUES ('US',15)