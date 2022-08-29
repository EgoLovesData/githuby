--joins
--creating a new table for the joins statement demonstration.
--creating an employee table.


create table myemployee (employeeid int, firstname varchar(20), lastname varchar(20))

insert into myemployee values (1, 'michael', 'scott')
insert into myemployee values (2, 'pam', 'beesly')
insert into myemployee values (3, 'dwight', 'schrute')

--checking new created table
select * from myemployee

--creating a salary table
create table mysalary (employeeid int, salary float)
insert into mysalary values (1,10000)
insert into mysalary values (2,8000)
insert into mysalary values (3,6000)

--checking new created table
select * from mysalary

--showing both newly created table side by side.
-- then creating a new table using inner join to create a new table using employeeid as primary connecting keys
select * from myemployee
select * from mysalary

select a.firstname, a.lastname, b.salary
from myemployee a inner join mysalary b on a.employeeid = b.employeeid

--left join
--first create a new table called mephone for employee phone numbers then use left join to join and query table
create table mephone ( employeeid int, phonenumber int)

insert into mephone values (1, 1211123342)
insert into mephone values (2, 1111111111)

--query both the new phone number table and employee table
select * from myemployee
select * from mephone

--now join both tables using left join clause
select a.firstname, a.lastname, b.phonenumber from myemployee a left join mephone b
on a.employeeid =b.employeeid

--now show all three tables
select * from myemployee
select * from mephone
select a.firstname, a.lastname, b.phonenumber from myemployee a left join mephone b
on a.employeeid =b.employeeid

--right join
--first creat a new table called myparking for employee parkingspot

create table myparking (employeeid int, parkingspot varchar (20))
insert into myparking values (1, 'a1')
insert into myparking values (2, 'a2')

--now query both employee table and employee parkingspot
select * from myemployee
select * from myparking

--now join both ables using right join.
select * from myparking
select * from myemployee

select a.parkingspot, b.firstname, b.lastname from myparking a right join myemployee b on a.employeeid = b.employeeid

--full outer join
--we are creating a new table with customer name and customer id for the new customer table

create table mycustomer (customerid int, customername varchar(20))
truncate table mycustomer
insert into mycustomer values (1, 'rakesh')
insert into mycustomer values (3, 'john')

-- we are also creating a new table with customerid, ordernumber and name for the order table
create table myorder (ordernumber int, ordername varchar(20), customerid int)
insert into myorder values (1, 'someorder1', 1)
insert into myorder values (2, 'someorder2', 2)
insert into myorder values (3, 'someorder3', 7)
insert into myorder values (4, 'someorder4', 8)

--now we query both table before we join them using full outer join clause.

select *from mycustomer
select * from myorder

--now join them

select *from mycustomer
select * from myorder

select a.customerid, a.customername, b.ordernumber, b.ordername
from mycustomer a full outer join myorder b on a .customerid = b.customerid

--crossjoin
--we query our tablesnow using cross join clause

select * from mycustomer
select * from mysalary
select * from mycustomer cross join mysalary
select * from mycustomer, mysalary