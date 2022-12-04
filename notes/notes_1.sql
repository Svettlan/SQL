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

 UNION; --объединение по вертикали / условия: совпадение количества столбцов и совпадение типов данных
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
from customers;

=============================================
-- Найти цены тел apple, которые больше средней цены телефонов samsung

select * from phones_apple       -- вариант подзапроса
where price>(select avg(price) from phones_samsung);
=======================
-- Найти цены тел apple, которые равны ценам телефонов samsung

select * from phones_apple       
where price in (select price from phones_samsung);
======================
-- Найти цены тел apple, которые не равны ценам телефонов samsung

select * from phones_apple     
where price not in (select price from phones_samsung);
======================
-- Найти тел.samsung, цены которых меньше самой маленькой цены apple, при условии цена apple <1000

select * from phones_samsung     
where price < all (select price from phones_apple where price <1000 ); -- меньше минимального
======================
-- Найти тел.samsung, цены которых больше максимальной цены apple, при условии цена apple <1000

select * from phones_samsung     
where price > all (select price from phones_apple where price <1000 ); --  больше максимальной 
=======================
-- Найти тел.samsung, цены которых никак не равны ценам apple дешевле 1000

select * from phones_samsung     
where price <> all (select price from phones_apple where price <1000 );
========================
-- Найти тел.samsung, цены которых меньше максимальной цены apple дешевле 1000

select * from phones_samsung     
where price < any (select price from phones_apple where price <1000 ); --меньше максимального
========================
-- Найти тел.samsung, цены которых больше минимальной цены apple дешевле 1000

select * from phones_samsung     
where price > any (select price from phones_apple where price <1000 ); --больше минимального
========================
--Аналогично оператору in

select * from phones_samsung     
where price = any (select price from phones_apple where price <1000 );
========================
--декартово произведение

select * from phones_samsung     
where price <> any (select price from phones_apple where price <1000 );
===============================================================================









