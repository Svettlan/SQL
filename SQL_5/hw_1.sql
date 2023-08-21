========================================================================
/*---------показать всех клиентов из Австралии---------------
-------------show all customers in Australia-----------------*/
  
select * from classicmodels.customers
where country = 'Australia';
=========================================================================
/*------------показать имя и фамилию клиентов в Мельбурне --------------
----------show First and Last name of customers in Melbourne ----------*/
select Firstname and Lastname 
from classicmodels.custome
where city in Melbourne



=========================================================================
/*показать всех клиентов с кредитным лимитом более 200 000 долларов США
show all customers with Credit Limit over $200,000*/

select * from classicmodels.customers 
where creditlimit > 200000  



==========================================================================
/*кто президент компании?
who is the president of the company?*/
select * from classicmodels.employees
where jobTitl is president


=========================================================================
/*сколько торговых представителей в компании?
how many Sales Reps are in the company?*/



===========================================================================
/*показать платежи в порядке убывания
show payments in descending order*/




===========================================================================
/*какой номер чека для платежа, сделанного 17 декабря 2004 г.
what was the check# for the payment done on December 17th 2004*/




==========================================================================
/*показать продуктовую линейку со словом «реалистичная» в описании
show product line with the word 'realistic' in the description*/



==========================================================================
/*показать название продукта для продавца "Unimax Art Galleries"
show product name for vendor 'Unimax Art Galleries'*/



==========================================================================









