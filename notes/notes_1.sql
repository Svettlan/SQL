--У какого композитора самый дорогой музыкальный трек? самый дешевый?
select Composer,max(UnitPrice)
from  tracks
group by Composer
order by max(UnitPrice) desc limit 10;

--2 способ
select Composer,max(UnitPrice)
from  tracks;

select Composer,min(UnitPrice)
from  tracks;

select Composer,min(UnitPrice)
from  tracks
group by Composer
order by min(UnitPrice) asc limit 10;

============================================================================
--Вставить несколько строк в табл.,строки взяты из запроса к другой таблице
Insert into media_types
select *
from genres
where GenreId=26;
--проверить, что получилось
select *
from media_types;

===========================================================================
--Чтобы случайно не удалить/изменить в таблице безвозвратно, нужно:

begin transaction;-- открыть транзакцию

DELETE-- сделать изменения 
 FROM media_types
 WHERE MediaTypeId = 127;

select * --посмотреть результат
from media_types;

commit; --Применить изменения
rollback; --Откатить обратно изменения

============================================================================
--Объединение таблиц

 UNION; --объединение по вертикали
         ALL     -- полный
         DISTINCT --исключаюший дубликаты
 ПОДЗАПРОСЫ
         коррелированный  
         без корреляции
JOIN
     CROSS  -- декартово произведение всех строк одной табл.со всеми строками др. табл.
     INNER  -- внутреннее соединение
     OUTER
         LEFT  --левый
         RIGHT --правый
         FULL  --полный
 EXCEPT    --логическое вычитание
 INTERSECT --логическое пересечение                   
         
===============================================================================
--UNION

select FirstName,LastName,'клиент' from customers --создали искуственное поле "клиент"
UNION ALL
select FirstName,LastName, 'сотрудник' from employees;--создали искуственное поле "сотрудник"

select FirstName from customers 
UNION                             --подразумеват только уникальные значения distinct, отбрасывая дубликаты
select FirstName from employees;

================================================================================
-- EXCEPT

select FirstName from customers 
EXCEPT                           --выводит те данные из customers, которых нет в employees
select FirstName from employees;

=================================================================================
--INTERSECT

select FirstName from customers 
INTERSECT                          --выводит данные, которые есть в обеих таблицах
select FirstName from employees;

=================================================================================
-ПОДЗАПРОСЫ

select * from (
select FirstName,LastName from customers -- подзапрос
UNION                             
select FirstName,LastName from employees)
as t
where FirstName='Aaron' ;           --условие

-- Посчитать для каждого клиента количество продаж подзапросом
-- Вывести фамилию, имя, количество продаж

select CustomerId, FirstName, LastName, (
select count(*) from sales )         --Запрос без корреляции
from customers;

select CustomerId, FirstName, LastName, (
select count(*) from sales 
where sales.CustomerId=customers.CustomerId ) --Условие корреляции- условие связи с таблицами
as count_sales
from customers