--date functions 
--using the getdate function

select GETDATE()

-- lets subtract two days from this current date
select GETDATE() - 2

--how to check for day/month/year only using datepart and adding column name if you wish.

select DATEPART(yyyy, GETDATE()) as yearnumber
select DATEPART(mm, GETDATE())
select DATEPART(dd, GETDATE())

--using dateadd to add day/month/year

select DATEADD(day, 4, GETDATE())
SELECT DATEADD(MONTH, 4, GETDATE())
select DATEADD(year, 4, getdate())
select DATEADD(dd, -(datepart(day,getdate())-1), getdate())

--lets use this date funtion to query a table from our database

select top 10 * from Production.WorkOrder

select workorderid, productid, startdate, enddate,
DATEDIFF(day, startdate, enddate)
from Production.WorkOrder


--aggregate functions
--mysalary
select * from mysalary

--find salary average
select AVG(salary) from mysalary

--find count
select COUNT(salary) from mysalary

--lets sum the salary total
select * from mysalary
select sum(salary) from mysalary

--lets find min and max of salary
select MIN(salary) from mysalary
select MAX(salary) from mysalary


--string functions
--using the myorder table

select * from myorder

--concatenating two strings
print concat('string1', 'string2')

select ordernumber, ordername, CONCAT(ordername,  ' ' , ordername)
as concatenatedtext
from myorder

--showing only characters from the left
select ordernumber, ordername, LEFT(ordername, 5) from myorder

--showing only characters from the right
select ordernumber, ordername, right(ordername, 5) from myorder

--showing substring
select ordernumber , ordername,SUBSTRING(ordername, 2, 5) from myorder

--using uppercase
select ordernumber, ordername, UPPER(ordername) from myorder

--length of string
select ordernumber, ordername, LEN(ordername) from myorder

--using multiple functions in making a character have an uppercase with the rest in lowercase
select ordernumber, ordername, CONCAT(upper(left(ordername,1)), LOWER(substring(ordername, 2,LEN(ordername)))) from myorder