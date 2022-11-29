--Покажите  фамилию и имя клиентов из города Прага 
select FirstName,LastName,City
from customers
where City='Prague';

-- Вариант с конкатенацией
select FirstName|| ' ' ||LastName,City
from customers
where City='Prague';

--Покажите  фамилию и имя клиентов у которых имя начинается букву M ?

select FirstName|| ' ' ||LastName
from customers
where FirstName like [M%];

--Покажите  фамилию и имя клиентов у которых имя содержит символ "ch"?
select FirstName|| ' ' ||LastName as Name
from customers
where FirstName like [%ch%];

--Покажите название и размер музыкальных треков в Мегабайтах 
select Name,Bytes
from tracks;

--Покажите  фамилию и имя сотрудников кампании нанятых в 2002 году из города Калгари
select FirstName|| ' ' ||LastName as Name,City,HireDate
from employees
where City ='Calgary' and HireDate >=date('2002-01-01') and HireDate<date('2002-12-31');

--Покажите  фамилию и имя сотрудников кампании нанятых в возрасте 40 лет и выше
select FirstName|| ' ' ||LastName as Name,HireDate-BirthDate as age
from employees
where HireDate-BirthDate>=40;

--Покажите покупателей-амерканцев без факса
select FirstName|| ' ' ||LastName as Name,Country,Fax
from customers
where Country=('USA') and Fax is NULL;

--Покажите канадские города в которые сделаны продажи в августе и сентябре месяце
select ShipCity,ShipCountry,SalesDate ask
from sales
where ShipCountry=('Canada') and SalesDate like('_____08%') or SalesDate like('_____09%')
order by SalesDate;  

--Покажите  почтовые адреса клиентов из домена gmail.com 
select FirstName|| ' ' ||LastName as Name, Address|| ','||City||','||Country,Email
from customers 
where Email like('%@gmail.com');

--Покажите сотрудников  которые работают в кампании уже 18 лет и более 
select FirstName|| ' ' ||LastName as Name, ('2022-12-01') -HireDate as D
from employees
where D>=18;

--Покажите  в алфавитном порядке все должности в кампании
select Title 
from employees
order by Title asc;

--Покажите  в алфавитном порядке Фамилию, Имя и год рождения покупателей
select LastName|| ' ' ||FirstName as FIO,('2022')-Age as BirthDate
from customers
order by LastName asc;

--Сколько секунд длится самая короткая песня
select min(Milliseconds) 
from tracks;

--Покажите название и длительность в секундах самой короткой песни
select Name,min(Milliseconds) 
from tracks;

--Покажите средний возраст клиента для каждой страны
select avg(Age),Country
from customers
group by Country;

--Покажите Фамилии работников нанятых в октябре
select LastName,HireDate
from employees
where HireDate like ('_____10%');

--Покажите фамилию самого старого по стажу сотрудника в кампании
select LastName,min(HireDate)
from employees;

select *
from employees
