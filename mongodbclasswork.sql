drop database if exists org123;
CREATE DATABASE ORG1234; SHOW DATABASES; USE ORG1234;

CREATE TABLE Worker ( WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT, FIRST_NAME CHAR(25), LAST_NAME CHAR(25), SALARY INT(15), JOINING_DATE DATETIME, DEPARTMENT CHAR(25) );

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES (001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'), (002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'), (003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'), (004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'), (005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'), (006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'), (007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account');

select * from worker where department='Admin' order by department;

select department, count(department) as total_employees from worker where department = 'HR' or department = 'account' group by department;

select department, count(department) as total_employees from worker group by department order by total_employees desc;

SELECT DEPARTMENT, COUNT() AS DepartmentCount FROM Worker GROUP BY DEPARTMENT HAVING COUNT() = (SELECT MAX(DepartmentCount) FROM (SELECT DEPARTMENT, COUNT(*) AS DepartmentCount FROM Worker GROUP BY DEPARTMENT) AS Counts);

SELECT DEPARTMENT, COUNT() AS DepartmentCount FROM Worker GROUP BY DEPARTMENT HAVING COUNT() = (SELECT MIN(DepartmentCount) FROM (SELECT DEPARTMENT, COUNT(*) AS DepartmentCount FROM Worker GROUP BY DEPARTMENT) AS Counts);

SELECT department, COUNT() AS departmentCount FROM worker GROUP BY department HAVING COUNT() = ( SELECT MAX(departmentCount) FROM ( SELECT COUNT(*) AS departmentCount FROM worker GROUP BY department ) AS subquery );

insert into worker value (008, 'kumar', 'Satish', 75000, '14-01-20 09.00.00', 'Account');

USE ORG1234;

CREATE TABLE WorkerWithCity ( WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT, FIRST_NAME CHAR(25), LAST_NAME CHAR(25), SALARY INT(15), JOINING_DATE DATETIME, DEPARTMENT CHAR(25), CITY varchar(255) DEFAULT 'India' );

INSERT INTO WorkerWithCity (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT, CITY) VALUES (001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR', 'GOA'), (002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin', 'Pondicherry'), (003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR',''), (004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin',''), (005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin',''), (006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account',''), (007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account', 'Jammu');

SELECT * FROM WorkerWithCity;

select * from workerWithCity where city like 'o';

create view Salary_more_than_3lac as select * from workerWithCity where salary > 300000 order by salary desc;

select first_name from salary_more_than_3lac;

create or replace view Salary_more_than_3lac as select first_name from workerWithCity where salary > 300000 order by salary desc;

select * from salary_more_than_3lac;

drop view salary_more_than_3lac;

CREATE DATABASE ORG1235; SHOW DATABASES; USE ORG1235;

CREATE TABLE Worker ( WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT, FIRST_NAME CHAR(25), LAST_NAME CHAR(25), SALARY INT(15), JOINING_DATE DATETIME, DEPARTMENT CHAR(25) );

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES (001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'), (002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'), (003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'), (004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'), (005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'), (006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'), (007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'), (008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus ( WORKER_REF_ID INT, BONUS_AMOUNT INT(10), BONUS_DATE DATETIME, FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE );

INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES (001, 5000, '16-02-20'), (002, 3000, '16-06-11'), (003, 4000, '16-02-20'), (001, 4500, '16-02-20'), (002, 3500, '16-06-11');

select * from worker where first_name not in ('vipul', 'satish');

select * from worker where first_name like '%a';

select * from worker where first_name like '_____h';

select department, count(department) as total_employees from worker group by department order by total_employees desc;

SELECT * FROM Worker UNION ALL SELECT * FROM Worker

SELECT department, COUNT() AS departmentCount FROM worker GROUP BY department HAVING COUNT() < ( SELECT MAX(departmentCount) FROM ( SELECT COUNT(*) AS departmentCount FROM worker GROUP BY department ) AS subquery order by department limit 1 ); -- use offset instead

create table vitBhopal (id int primary key, name varchar(20) not null, department varchar(25) not null); insert into vitbhopal values (104,'Karthik','cs'),(103,'Arun','cs');

create table vit (id int primary key, name varchar(20) not null, college varchar(25) not null); insert into vit values (104,'Karthik','chennai'),(103,'Arun','bhopal'); select * from vit;

select * from vitbhopal;

select name as WinnerOfTheYear from vitbhopal where id = (select id from vit where college='bhopal');

select * from worker;

CREATE DATABASE ORG1236; use org1236; CREATE TABLE Worker ( WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT, FIRST_NAME CHAR(25), LAST_NAME CHAR(25), SALARY INT(15), JOINING_DATE DATETIME, DEPARTMENT CHAR(25) );

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES (001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'), (002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'), (003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'), (004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'), (005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'), (006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'), (007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'), (008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus ( WORKER_REF_ID INT, BONUS_AMOUNT INT(10), BONUS_DATE DATETIME, FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE );

INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES (001, 5000, '16-02-20'), (002, 3000, '16-06-11'), (003, 4000, '16-02-20'), (001, 4500, '16-02-20'), (002, 3500, '16-06-11'); CREATE TABLE Title ( WORKER_REF_ID INT, WORKER_TITLE CHAR(25), AFFECTED_FROM DATETIME, FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE );

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES (001, 'Manager', '2016-02-20 00:00:00'), (002, 'Executive', '2016-06-11 00:00:00'), (008, 'Executive', '2016-06-11 00:00:00'), (005, 'Manager', '2016-06-11 00:00:00'), (004, 'Asst. Manager', '2016-06-11 00:00:00'), (007, 'Executive', '2016-06-11 00:00:00'), (006, 'Lead', '2016-06-11 00:00:00'), (003, 'Lead', '2016-06-11 00:00:00');

SELECT department, COUNT() AS departmentCount FROM worker GROUP BY department HAVING COUNT() = ( SELECT MAX(departmentCount) FROM ( SELECT COUNT(*) AS departmentCount FROM worker GROUP BY department ) AS subquery order by department ); -- use offset instead

SELECT DEPARTMENT FROM Worker GROUP BY DEPARTMENT HAVING COUNT(*) < 5;

select department, count(department) as depCount from worker group by department order by depCount desc limit 5;

create table student ( s_id int primary key, s_name varchar(25) not null, s_department varchar(25) not null );

insert into student values (1001,"Jayanth","ECE"),(1002,"Praveen","CSE"),(1003,"Logesh","Mech"),(1006,'karthick','Aero'),(1007,"Mahesh","Civil");

select * from student;

create table VIT( s_id int primary key, s_cgpa varchar(5) not null ); insert into vit values (1001,'7.2'),(1002,'8.6'),(1007,'9.25'); select * from vit;

select * from student cross join vit;

select * from student inner join vit where student.s_id=vit.s_id;

select * from student natural join vit;

select * from student left outer join vit on (student.s_id=vit.s_id); select * from student right outer join vit on (student.s_id=vit.s_id); -- full outer join not supported;

SELECT * FROM Worker INNER JOIN Bonus ON WORKER_ID = WORKER_REF_ID UNION SELECT * FROM Worker INNER JOIN Title ON WORKER_ID = WORKER_REF_ID;

SELECT w.*, b.BONUS_AMOUNT, b.BONUS_DATE, t.WORKER_TITLE, t.AFFECTED_FROM FROM Worker w LEFT JOIN Bonus b ON w.WORKER_ID = b.WORKER_REF_ID LEFT JOIN Title t ON w.WORKER_ID = t.WORKER_REF_ID;

SELECT w.*, b.BONUS_AMOUNT, b.BONUS_DATE, t.WORKER_TITLE, t.AFFECTED_FROM FROM Worker w INNER JOIN Bonus b ON w.WORKER_ID = b.WORKER_REF_ID INNER JOIN Title t ON w.WORKER_ID = t.WORKER_REF_ID WHERE t.WORKER_TITLE = 'Manager';

use JBSQL1; CREATE DATABASE JBSQL1; CREATE table Customer ( FirstName varchar(50), LastName varchar(50), Age int );

INSERT INTO Customer (FirstName, LastName, Age, City) VALUES ('Joey', 'Tribiani', 40, 'NewYork'), ('Chandler', 'Bing', 41, 'NewYork'), ('Ross', 'Geller', 42, 'NewYork'), ('Phoebe', 'Buffet', 43, 'NewYork'), ('Rachel', 'Something', 44, 'NewYork'), ('Monica', 'Geller', 45, 'NewYork');

SELECT * FROM Customer where FirstName like '%o%' and LastName like '%e%'; -- we can use like with wildchars like %;

-- update update Customer set age=41 where FirstName like '%o%' and LastName like '%e%';

-- DELETE Customer will delete all data in table -- DELETE Customer -- where FirstName='something' -- and LastName='something';

-- add a column alter table Customer add City varchar(50);

update Customer set City='NewYork';

drop table Customer;

create table Customer ( Id int primary key auto_increment, FirstName varchar(25), LastName varchar(25), Age int, City varchar(50) );

select * from Customer;

create table Products ( id int primary key auto_increment, ProductName varchar(50) );

select * from products;

drop table products;

insert into products (ProductName) values ('Baseball'), ('FootBall');

alter table products add Price float;

update products set Price=69.96;
