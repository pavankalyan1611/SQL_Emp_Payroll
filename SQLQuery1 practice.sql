---Welcome To Employee Pay Roll Data Base Problem---

--uc1 Create Payroll_Service1 Database--
create database payroll_service1;
select name from sys.databases;
use payroll_service1

--uc2 employee_payroll table--
create table employee_payroll
(
id int identity(1,1) primary key,
name varchar(50) not null,
salary money not null,
start_date date not null
);

--uc3 Create employee_payroll data as part of CURD Operation
insert into employee_payroll(name,salary,start_date)
values('pavan', 30000,'2021-05-25'),
('mani',35000,'2019-04-25'),
('jaanu',40000,'2021-08-27');

--uc4 Retrieve employee_payroll data
select * from employee_payroll

--uc5  Retrieve salary of particular employee and particular date range
select salary from employee_payroll where name = 'pavan'
select name from employee_payroll where start_date<= '2021-01-01'
select getdate()
select name from employee_payroll where start_date between '2020-01-01' and getdate()

--uc6 add Gender to Employee_Payroll Table and Update the Rows to reflect the correct Employee Gender
alter table employee_payroll add gender char
update employee_payroll set gender = 'M' where name ='pavan' or name ='mani' --or
update employee_payroll set gender = 'M' where name in ('pavan','mani')
update employee_payroll set gender = 'F' where name ='jaanu'

--adding names to table
insert into employee_payroll values('stark', 25000,'2016-01-01','M'),
('jahnavi',31000,'2017-01-01','F'),('sitha',40000,'2021-07-25','F');

--uc7 find sum, average, min, max and number of male and female employees
select sum(salary) from employee_payroll
select (salary), name from employee_payroll where gender = 'M'
select sum(salary) from employee_payroll where gender = 'F' group by gender;
select sum(salary) from employee_payroll where gender = 'F'
select avg(salary) from employee_payroll where gender = 'F' group by name
select min(salary) from employee_payroll where gender = 'F'
select max(salary) from employee_payroll where gender = 'M'
select count(salary) from employee_payroll where gender = 'F'
select min(salary) from employee_payroll
select count(*) from employee_payroll
select name,max(salary) from employee_payroll group by name

--uc8 add employee phone, department(not null), Address (using default values)
alter table employee_payroll add phone varchar(13),
address varchar(100) default 'India' not null,
department varchar(30) default 'CS' not null;
update employee_payroll set phone = '9603083843' where name ='pavan'
select * from employee_payroll

-- adding and deleting column,rows 
alter table employee_payroll add extra varchar(30)
alter table employee_payroll drop column extra ;
set Identity_insert employee_payroll on
insert into employee_payroll(id,name,salary,gender,start_date) values(9,'karishma',675585875,'F',GETDATE())
insert into employee_payroll(id,name,salary,gender,start_date) values(10,'ka',675585875,'F',GETDATE())
update employee_payroll set name = 'jessy' where name='karishma'
delete from employee_payroll where name in ('jessy','ka')
