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




