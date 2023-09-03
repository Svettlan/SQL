-- CREATE DATABASE database_name;
--     DROP DATABASE database_name;
--     CREATE SCHEMA database_name;
--     DROP SCHEMA database_name;
--     CREATE TABLE table_name 
--     (column1 datatype,	
-- 	 column2 datatype,	
-- 	 column3 datatype);
--      CREATE DATABASE mywork;
CREATE DATABASE mywork;
CREATE TABLE mywork.EMPLOYEE_TEST (
EMPLOYEE_ID int not null,
FIRST_NAME varchar (75),
LAST_NAME varchar (75),
ADDRESS varchar (100),
CITY varchar (30),
STATE  varchar (20),
ZIP_CODE varchar (20),
PHONE varchar (25),
COUNTRY varchar (50),
HIREDATE date,
SALARY decimal (8,2),
PRIMARY KEY (EMPLOYEE_ID));

select * from mywork.EMPLOYEE_TEST;
-- DROP TABLE mywork.EMPLOYEE_TEST
-- ALTER TABLE table_name	
-- 	ADD column column_name datatype;
    
    ALTER TABLE mywork.EMPLOYEE_TEST add column EMAIL varchar (50);
    ALTER TABLE mywork.EMPLOYEE_TEST drop column EMAIL;
    
    select * from mywork.EMPLOYEE_TEST;
    
    INSERT INTO mywork.EMPLOYEE_TEST (EMPLOYEE_ID, HIREDATE, LAST_NAME, FIRST_NAME, PHONE, SALARY)  
    VALUES (999999, DATE '2018-12-01', 'Smith', 'Kathy', '415-999-9999', 100000.00);
    
    select * from mywork.EMPLOYEE_TEST;
    
     UPDATE mywork.EMPLOYEE_TEST SET SALARY = (SALARY * 1.1);
    DELETE FROM mywork.EMPLOYEE_TEST WHERE FIRST_NAME = 'Kathy';
  
  CREATE TABLE mywork.emp (
empno INT (10) NOT NULL,
ename VARCHAR(10) DEFAULT NULL,
job VARCHAR(9) DEFAULT NULL,
mgr INT(10) DEFAULT NULL,
hiredate DATE,
sal NUMERIC(7,2),
comm NUMERIC(7,2) NULL,
dept INT (10),
 PRIMARY KEY (empno));
 select * from mywork.emp; 
 
 insert into mywork.emp (empno,ename,job,mgr,hiredate,sal,comm,dept)
values
    (1,'JOHNSON','ADMIN',6,'1990-12-17',18000,NULL,4);
    
insert into mywork.emp (empno,ename,job,mgr,hiredate,sal,comm,dept)
values
    (2,'HARDING','MANAGER',9,'1990-12-17',52000,300,3),
	(3,'TAFT','SALES I',2,'1995-12-17',25000,500,3),
    (4,'HOOVER','SALES I',2,'1990-04-02',27000,NULL,3),
    (5,'LINCOLN','TECH',6,'1994-06-23',22500,1400,4),
    (6,'GARFIELD','MANAGER',9,'1993-05-01',54000,NULL,4),
    (7,'POLK','TECH',6,'1997-09-22',25000,NULL,4),
    (8,'GRANT','ENGINEER',10,'1997-03-30',32000,NULL,2),
    (9,'JACKSON','CEO',NULL,'1990-01-01',75000,NULL,4),
    (10,'FILLMORE','MANAGER',9,'1994-08-09',56000,NULL,2),
    (11,'ADAMS','ENGINEER',10,'1996-03-15',34000,NULL,2),
    (12,'WASHINGTON','ADMIN',6,'1998-04-16',18000,NULL,4),
    (13,'MONROE','ENGINEER',10,'2000-12-03',30000,NULL,2),
    (14,'ROOSEVELT','CPA',9,'1995-10-12',35000,NULL,1);
    
    select * from mywork.emp;
alter table mywork.emp rename column job to job_title;
update mywork.emp set ename = 'SMITH' where ename = 'POLK';
delete from mywork.emp where ename = 'ROOSEVELT';
alter table mywork.emp add column bonus_percent int (3); 
alter table mywork.emp drop column bonus_percent;

CREATE TABLE IF NOT EXISTS mywork.dept (
deptno INT NOT NULL,
dname VARCHAR(14),
loc VARCHAR(13),
 PRIMARY KEY (deptno));
 
 select * from mywork.dept;
 
 ALTER TABLE mywork.emp
ADD FOREIGN KEY fk_dept(dept)
REFERENCES dept(deptno)
ON DELETE NO ACTION
ON UPDATE CASCADE;
 
insert into mywork.dept values (1,'ACCOUNTING','ST LOUIS');
insert into mywork.dept values (2,'RESEARCH','NEW YORK');
insert into mywork.dept values (3,'SALES','ATLANTA');
insert into mywork.dept values (4,'OPERATIONS','SEATTLE');

desc mywork.emp;
desc mywork.dept;
select * from mywork.emp;
select * from mywork.dept;

select * from mywork.dept where deptno =4;

select distinct dname from mywork.dept order by dname;

select * from mywork.dept where dname like 'A%';

select * from mywork.dept where deptno between 1 and 3;
select * from mywork.dept where deptno in (1,2,3);
select * from mywork.dept where deptno >=1 and deptno <4;

select * from mywork.dept;

DROP DATABASE IF EXISTS `PETS`;
CREATE DATABASE PETS;

CREATE TABLE pets.pet 
(`name` VARCHAR(20), 
`owner` VARCHAR(20),
species VARCHAR(20), 
sex CHAR(1), 
birth DATE, 
death DATE);

insert into pets.pet  (`name`, `owner`, species, sex, birth, death)
values ('Pepper','Michael', 'hamster', 'F',  '2015-01-01', '2021-02-26');

select * from pets.pet;
truncate table pets.pet;

select * from pets.pet;
rename table pets.pet to pets.mypet;
alter table pets.mypet rename column `owner` to owners; 
select * from pets.mypet;

drop table pets.mypet;
drop database pets;

/*
Homework #3  
Part 1 - mywork database
Write sql 
	1. Add column 'country' to dept table in mywork database
    Добавьте столбец «страна» в таблицу отделов в базе данных mywork.
	2. Rename column 'loc' to 'city'
    Переименуйте столбец «loc» в «city».
	3. Add three more departments: HR, Engineering, Marketing
    Добавьте еще три отдела: HR, Engineering, Marketing.
	4. Write sql statement to show which department is in Atlanta
    Save your work 
    Напишите оператор sql, чтобы показать, какой отдел находится в Атланте.
    Сохраните свою работу
