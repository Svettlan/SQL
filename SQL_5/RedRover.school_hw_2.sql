/*Покажите содержимое таблицы исполнителей (артистов)*/
select *
from chinook.artist;
========================================================================================================
/*Покажите фамилии и имена клиентов из города Лондон*/
select FirstName, LastName, City
from chinook.customer
where City = 'London';
========================================================================================================
/*Покажите продажи за 2012 год, со стоимостью продаж более 4 долларов*/
select *
from chinook.invoice
where InvoiceDate like '2012%' and Total > 4;
========================================================================================================
/*Покажите дату продажи, адрес продажи, город в которую совершена продажа и стоимость покупки равную 8.91.
 Присвоить названия столбцам InvoiceDate – Дата_Продажи, 
 BillingAddress – Адрес_Продажи и BillingCity - Город_Продажи.*/
 select InvoiceDate as Дата_Продажи, BillingAddress as Адрес_Продажи, BillingCity as Город_Продажи, Total as Стоимость_Покупки
 from chinook.invoice
 where Total = 8.91;
======================================================================================================== 
 /*Покажите фамилии и имена сотрудников компании, нанятых в 2002 году и проживающих в городе Edmonton*/
select LastName, FirstName, City, HireDate
from chinook.employee
where City = 'Edmonton' and HireDate like '2002%';  
=========================================================================================================
/*Покажите канадские города, в которые были сделаны продажи в августе.*/
select BillingCity, Total, InvoiceDate
from chinook.invoice
where BillingCountry = 'Canada' and InvoiceDate like '_____08%';
=========================================================================================================
/*Покажите Фамилии и имена работников, нанятых в мае. Решите 2-мя способами:
используя оператор like
используя форматирование даты*. Информация по использованию формата даты: 
ссылка_1: https://www.mysqltutorial.org/mysql-date_format/
ссылка_2: https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_date-format*/
select CONCAT(LastName,' ' , FirstName) as Сотрудник, HireDate
from chinook.employee
where HireDate like '_____05%';
====================================
select CONCAT (LastName,' ' , FirstName) as Сотрудник, HireDate
from chinook.employee
where DATE_FORMAT (HireDate, '%c') = '5';
========================================================================================================
/*Покажите фамилии и имена сотрудников, занимающих должность менеджера по продажам и ИТ менеджера. Решите задание двумя способами: 
используя оператор IN
используя логические операции*/
select CONCAT (LastName,' ' , FirstName) as Сотрудник, Title
from chinook.employee 
where Title = 'Sales Manager' or Title = 'IT Manager';
===================================
select CONCAT (LastName,' ' , FirstName) as Сотрудник, Title
from chinook.employee 
where Title in ('Sales Manager', 'IT Manager');
=========================================================================================================
=========================================================================================================
-- Покажите клиентов с именем Френк.
select * 
from chinook.customer
where FirstName = 'Frank';
=====================================================================================
-- Покажите фамилии и имя клиентов, у которых имя Mарк.
select * 
from chinook.customer
where FirstName = 'Mark';
=====================================================================================
-- Покажите название и размер треков в Мегабайтах, применив округление до 2 знаков и отсортировав по убыванию. Столбец назовите MB.
select Name, round((Bytes/1024/1024),2) as MB
from chinook.track
order by Bytes desc;
=====================================================================================
-- Покажите возраст сотрудников, на момент оформления на работу. Вывести фамилию, имя, возраст. дату оформления и день рождения.
-- Столбец назовите age.*
 ====================================================================================
 ====================================================================================
 -------------------------------
-- ------РАБОТА С ДАТАМИ-------
 -- https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_datediff 
 -------------------------------
 ===================================================================================
 ===================================================================================
-- Один из вариантов решения задачи здесь: https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_datediff   
select LastName, FirstName, floor((datediff(HireDate, BirthDate))/365) as AgeDate, HireDate, BirthDate
from chinook.employee;
=====================================================================================
-- Покажите покупателей-американцев без факса.
select *
from chinook.customer
where Country = 'USA' and Fax is NULL;
======================================================================================
-- Покажите почтовые адреса клиентов из домена gmail.com.
select *
from chinook.customer
where Email like '%gmail.com';
=================================
-- Покажите в алфавитном порядке все уникальные должности в компании.
select distinct (Title)
from chinook.employee
order by Title asc;
=======================================================================================
-- Покажите название самой короткой песни.
select Name 
from chinook.track
order by Milliseconds asc
limit 1;
==========================================
-- Покажите название и длительность в секундах самой короткой песни. Столбец назвать sec.
select Name, round((Milliseconds/1000)) as sec
from chinook.track
order by Milliseconds asc
limit 1;
========================================================================================
-- Покажите средний возраст сотрудников, работающих в компании*.
select round(avg(datediff(HireDate,BirthDate)/365)) as age
from chinook.employee;
========================================================================================
-- Проведите аналитическую работу: узнайте фамилию, имя и компанию покупателя (номер 5). 
-- Сколько заказов он сделал и на какую сумму.
--  Покажите 2 запроса Вашей работы.
select CustomerId, LastName, FirstName, Company
from chinook.customer
where CustomerId = 5;
==============================
select *
from chinook.invoice
where CustomerId = 5;
select count(*), sum(Total)
from chinook.invoice
where CustomerId = 5;
=========================================================================================
-- Напишите запрос, определяющий количество треков, где ID плейлиста > 15.
-- Назовите столбцы соответственно их расположения. 
select PlaylistId as 'CONDTTION', count(TrackId) as RESULT
from chinook.playlisttrack
where PlaylistId > 15
group by PlaylistId;
============================
select  *
from chinook.playlisttrack;
=========================================================================================
-- Найти все ID счет-фактур, в которых количество товаров больше или равно 6 и меньше или равно 9.
select InvoiceId, sum(Quantity)
from chinook.invoiceline
group by InvoiceId
-- having sum(Quantity) >=6 and sum(Quantity) <= 9 
having sum(Quantity) between 6 and 9;




