--1.Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd
Select model, speed, hd
From PC
Where price <500

--2.Найдите производителей принтеров. Вывести: maker
Select distinct  maker
From product
Where type ='printer'

--3.Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.
Select model, ram, screen
from Laptop
Where price >1000

--4.Найдите все записи таблицы Printer для цветных принтеров.
Select *
From Printer
Where color ='y'

--5.Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.
Select  model,speed,hd
from  PC
Where  CD IN ('12x','24x') and price < 600

--6.Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
SELECT DISTINCT Product.maker, Laptop.speed
FROM Product 
INNER JOIN Laptop
ON Product.model=Laptop.model
WHERE hd >=10

--7.Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
SELECT PC.model, PC.price FROM PC JOIN  Product 
ON PC.model= Product.model
 WHERE maker= 'B'
UNION
SELECT Laptop.model, Laptop.price FROM Laptop JOIN  Product 
ON Laptop.model= Product.model
 WHERE maker= 'B'
UNION
SELECT Printer.model, Printer.price FROM Printer JOIN  Product 
ON Printer.model= Product.model
WHERE maker= 'B'

-- НЕ РАБОТАЕТ!!8.Найдите производителя, выпускающего ПК, но не ПК-блокноты.
/*SELECT Maker
FROM Product
WHERE  type IN 'PC'
EXCEPT 
SELECT model
FROM Laptop*/

--9.Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
SELECT DISTINCT maker
FROM Product
JOIN PC
ON Product.model=PC.model
WHERE speed>=450

--10.Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
SELECT DISTINCT  model, price
FROM Printer
WHERE price=(SELECT MAX(price) 
FROM Printer)

--11.Найдите среднюю скорость ПК.
SELECT AVG(speed)
FROM PC

--12.Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
SELECT AVG(speed)
FROM Laptop
WHERE price>1000

--13.Найдите среднюю скорость ПК, выпущенных производителем A.
SELECT AVG(PC.speed)
FROM Product
JOIN PC
ON Product.model=PC.model
WHERE maker='A'

--14.Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
SELECT Ships.class, Ships.name, Classes.country
FROM  Ships
JOIN Classes
ON Classes.class=Ships.class
WHERE numGuns>=10

--15.Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD
SELECT DISTINCT hd
FROM PC
GROUP BY hd
HAVING COUNT(hd)>1

--16.Найдите пары моделей PC, имеющих одинаковые скорость и RAM.
--  В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), 
--  Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
SELECT DISTINCT A.model AS model_1, B.model AS model_2,A.speed, A.ram 
fROM PC AS A, PC B
WHERE A.speed=B.speed AND A.ram=B.ram AND A.model > B.model

--17.Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
-- Вывести: type, model, speed
SELECT DISTINCT Product.type , L.model, L.speed
FROM Laptop AS L, Product
WHERE L.speed< ALL (SELECT speed 
FROM PC) AND type='Laptop'

--18.Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
-- SELECT DISTINCT maker, Printer.price,color
-- FROM Product,Printer
-- WHERE Printer.price=(SELECT MIN(price) 
-- FROM Printer)


