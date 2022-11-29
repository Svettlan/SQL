--DDL
=====================================================================
--1.Создать таблицу employees
-- id. serial,  primary key,
-- employee_name. Varchar(50), not null
=====================================================================
create table employees(
	id serial  primary key,
	employee_name Varchar(50) not null
);
=====================================================================
--Наполнить таблицу employee 70 строками.
insert into employees(employee_name)
	values ('Ivan'),
		   ('Maria'),
		   ('Ily'),
		   ('Tolya'),
		   ('Alyosha'),
		   ('Andryusha'),
		   ('Borya'),
		   ('Tyoma'),
		   ('Vadik'),
		   ('Arkasha'),
		   ('Valya'),
		   ('Valera'),
		   ('Vasya'),
		   ('Vitya'),
		   ('Vitaliy'),
		   ('Volodya'),
		   ('Vlad'),
		   ('Slava'),
		   ('Vladislav'),
		   ('Gena'),
		   ('Gosha'),
		   ('Grisha'),
		   ('Danila'),
		   ('Denis'),
		   ('Dima'),
		   ('Zhenya'),
		   ('Gosha'),
		   ('Zahar'),
		   ('Seryozha'),
		   ('Vanya'),
		   ('Igor'),
		   ('Ilyusha'),
		   ('Kesha'),
		   ('Iosif'),
		   ('Kirill'),
		   ('Kostya'),
		   ('Lyova'),
		   ('Lev'),
		   ('Lyonya'),
		   ('Max'),
		   ('Matvey'),
		   ('Maxim'),
		   ('Mikhail'),
		   ('Nikita'),
		   ('Nikolay'),
		   ('Oleg'),
		   ('Pasha'),
		   ('Petr'),
		   ('Stas'),
		   ('Styopa'),
		   ('Tima'),
		   ('Timur'),
		   ('Fedor'),
		   ('Fedya'),
		   ('Philipp'),
		   ('Filya'),
		   ('Edik'),
		   ('Eduard'),
		   ('Yura'),
		   ('Yakov'),
		   ('Yuri'),
		   ('Yasha'),
		   ('Ian'),
		   ('Yaroslav'),
		   ('Nastya'),
		   ('Anya'),
		   ('Tonya'),
		   ('Valeria'),
		   ('Varvara'),
		   ('Vera')
==========================================================================	
	--УДАЛИТЬ ТАБЛИЦУ
		   drop table employees
==========================================================================		   
--Создать таблицу salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null

	create table salary(
		id Serial  primary key,
		monthly_salary Int not null
		);
=========================================================================	
	--Наполнить таблицу salary 15 строками
insert into salary(monthly_salary)
	values (1000),
		   (1100),
		   (1200),
		   (1300),
		   (1400),
		   (1500),
		   (1600),
		   (1700),
		   (1800),
		   (1900),
		   (2000),
		   (2100),
		   (2200),
		   (2300),
		   (2400),
		   (2500)
========================================================================		   
--Создать таблицу employee_salary
--- id. Serial  primary key,
--- employee_id. Int, not null, unique
--- salary_id. Int, not null
		   
create table employee_salary(
		id Serial  primary key,
		employee_id Int not null unique,
		salary_id Int not null
		);
=======================================================================	
--Наполнить таблицу employee_salary 40 строками:
-- в 10 строк из 40 вставить несуществующие employee_id

insert into employee_salary(employee_id,salary_id)
	values (25,2),
	       (2,8),
	       (22,10),
	       (4,3),
	       (29,9),
	       (6,12),
	       (7,3),
	       (8,4),
	       (9,5),
	       (10,13),
	       (30,11),
	       (12,1),
	       (13,5),
	       (14,6),
	       (28,14),
	       (27,15),
	       (17,8),
	       (18,6),
	       (19,15),
	       (20,2),
	       (21,8),
	       (3,7),
		   (1,4),
		   (5,9),
		   (40,13),
		   (23,4),
		   (11,2),
		   (52,10),
		   (15,13),
		   (26,4),
		   (16,1),
		   (33,7),
		   (75,8),
		   (92,2),
		   (81,3),
		   (82,6),
		   (83,9),
		   (84,10),
		   (85,1),
		   (101,2)
===================================================================		
	drop table 	 employee_salary
===================================================================	
--Создать таблицу roles
--- id. Serial  primary key,
--- role_name. int, not null, unique
	  
create table roles(
	id Serial primary key,
	role_name int not null unique
);
===================================================================
select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;
select * from roles_employee
===================================================================
--Поменять тип столба role_name с int на varchar(30)

alter table  roles
alter column role_name type varchar(30);
===================================================================
--Наполнить таблицу roles 20 строками:	
insert into roles(role_name)
	values ('Junior Python developer'),
		  ('Middle Python developer'),
		  ('Senior Python developer'),
		  ('Junior Java developer'),
		  ('Middle Java developer'),
		  ('Senior Java developer'),
		  ('Junior JavaScript developer'),
		  ('Middle JavaScript developer'),
		  ('Senior JavaScript developer'),
		  ('Junior Manual QA engineer'),
		  ('Middle Manual QA engineer'),
		  ('Senior Manual QA engineer'),
		  ('Project Manager'),
		  ('Designer'),
		  ('HR'),
		  ('CEO'),
		  ('Sales manager'),
		  ('Junior Automation QA engineer'),
		  ('Middle Automation QA engineer'),
		  ('Senior Automation QA engineer')

===================================================================		 
--Создать таблицу roles_employee
--- id. Serial  primary key,
--- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--- role_id. Int, not null (внешний ключ для таблицы roles, поле id)

create table roles_employee(
	id Serial primary key,
	employee_id Int not null unique,
	 role_id Int not null,
	foreign key (employee_id)
		references employees(id),
	foreign key (role_id)	
		references roles(id)
);

========================================================================

--УДАЛИТЬ ТАБЛИЦУ
drop table roles_employee
========================================================================
--Наполнить таблицу roles_employee 40 строками
insert into roles_employee(employee_id,role_id)
		values	 (7,2),
				 (20,4),
				 (3,9),
				 (5,13),
				 (23,4),
				 (11,2),
				 (10,9),
				 (22,13),
				 (21,3),
				 (34,4),
				 (6,7),
				 (1,5),
				 (2,6),
				 (4,7),
				 (8,8),
				 (9,8),
				 (12,1),
				 (13,5),
				 (14,3),
				 (15,7),
				 (16,4),
				 (17,12),
				 (18,1),
				 (19,7),
				 (27,6),
				 (24,13),
				 (25,14),
				 (26,15),
				 (28,14),
				 (29,1),
				 (30,2),
				 (31,6),
				 (32,7),
				 (33,9),
				 (35,10),
				 (36,12),
				 (37,13),
				 (38,14),
				 (39,8),
				 (40,2)
		   
