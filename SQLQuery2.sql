--sql refresher crash work

select * from HumanResources.Department

-- show me all department names.
select name from HumanResources.Department

--show me all the group
select GROUPNAME from HumanResources.Department

--show me all the distinct group name
select distinct groupname from HumanResources.Department

--filtering all the manufacturing department out.
select name,groupname from HumanResources.Department
where groupname like 'manufacturing'

--give me all the employees from the employee table
select * from HumanResources.Employee

--give me a list of all employee with orglevel = 2
select * from HumanResources.Employee 
where OrganizationLevel = 2

--give me a list of all employee with orglevel = 2/3
select * from HumanResources.Employee
where OrganizationLevel in (2,3)

--give me a list of employees with jobtitle as facilities manager
select * from HumanResources.Employee
where JobTitle like 'facilities manager'

--give me all the employees with manager in their jobtitle
select * from HumanResources.Employee
where JobTitle like '% manager'

--give me all the employees with control inside the jobtitle
select * from HumanResources.Employee
where JobTitle like '% control %'

--give me all employee born after 1 jan 1980
select * from HumanResources.Employee
where BirthDate > '1-01-1980'

--give me all employee birthdate between jan 1 1970 and jan 1 1980
select * from HumanResources.Employee
where BirthDate > '1-01-1970' and BirthDate < '1-01-1980'
-- using between syntax
select * from HumanResources.Employee
where BirthDate between '1-01-1970' and '1-01-1980'


--calculated columns
select * from Production.Product

--create a new column called adjusted listed price using the as clause.
select name, ListPrice  from Production.Product
select name, ListPrice, ListPrice + 10 as adjusted_listprice from Production.Product

--create a new table for the newly created adjusted_list price using the into clause.
select name, ListPrice, ListPrice + 10 as adjusted_listprice into [Production].[Product_2] from [Production].[Product]
select * from Production.Product_2

--create a temporary table using #tmpname
select name, ListPrice, ListPrice + 10 as adjusted_listprice into #tmpname from Production.Product
select *from #tmpname

--deleting data from a table/column
delete from Production.Product_2
where name like 'bearing ball'
select * from Production.Product_2

--using the update statement in a column
update Production.Product_2
set name = 'BLADE_NAME'
where name like 'blade'
select * from Production.Product_2
