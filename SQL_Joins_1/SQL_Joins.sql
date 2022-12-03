
--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select  e.employee_name,s.monthly_salary
from employees as e join employee_salary  as es on e.id=es.employee_id
join salary as s on s.id=es.salary_id 

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select  e.employee_name,s.monthly_salary
from employees as e join employee_salary  as es on e.id=es.employee_id
join salary as s on s.id=es.salary_id 
where s.monthly_salary<2000

--Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select s.monthly_salary,e.employee_name 
from salary as s left join employee_salary  as es on s.id=es.salary_id
left join employees as e on s.id=es.id

select * from salary
select * from employees
select * from employee_salary

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. 
--(ЗП есть, но не понятно кто её получает.)

select s.monthly_salary,e.employee_name 
from salary as s left join employee_salary  as es on s.id=es.salary_id
left join employees as e on s.id=es.id
where s.monthly_salary<2000 
order by s.monthly_salary asc

-- 5. Найти всех работников кому не начислена ЗП.

select  e.employee_name,s.monthly_salary
from employees as e left join employee_salary  as es on e.id=es.employee_id
left join salary as s on s.id=es.salary_id 
where s.monthly_salary is NULL

-- 6. Вывести всех работников с названиями их должности.
select  e.employee_name,r.role_name
from employees as e join roles_employee as re on e.id=re.employee_id
join roles as r on r.id =re.role_id

-- 7. Вывести имена и должность только Java разработчиков.
select  e.employee_name,r.role_name
from employees as e join roles_employee as re on e.id=re.employee_id
join roles as r on r.id =re.role_id
where r.role_name like '%Java developer'

--8. Вывести имена и должность только Python разработчиков.
select  e.employee_name,r.role_name
from employees as e join roles_employee as re on e.id=re.employee_id
join roles as r on r.id =re.role_id
where r.role_name like '%Python developer'

-- 9. Вывести имена и должность всех QA инженеров.
select  e.employee_name,r.role_name
from employees as e join roles_employee as re on e.id=re.employee_id
join roles as r on r.id =re.role_id
where r.role_name like '%QA engineer'

--10. Вывести имена и должность ручных QA инженеров.
select  e.employee_name,r.role_name
from employees as e join roles_employee as re on e.id=re.employee_id
join roles as r on r.id =re.role_id
where r.role_name like '%Manual QA engineer'

--11. Вывести имена и должность автоматизаторов QA
select  e.employee_name,r.role_name
from employees as e join roles_employee as re on e.id=re.employee_id
join roles as r on r.id =re.role_id
where r.role_name like '%automation QA engineer'

--12. Вывести имена и зарплаты Junior специалистов
select  e.employee_name,r.role_name,s.monthly_salary
from employees as e join roles_employee as re on e.id=re.employee_id
join roles as r on r.id =re.role_id
join employee_salary  as es on e.id=es.employee_id
join salary as s on s.id=es.salary_id 
where r.role_name like 'Junior%'

--13. Вывести имена и зарплаты Middle специалистов
select  e.employee_name,r.role_name,s.monthly_salary
from employees as e join roles_employee as re on e.id=re.employee_id
join roles as r on r.id =re.role_id
join employee_salary  as es on e.id=es.employee_id
join salary as s on s.id=es.salary_id 
where r.role_name like 'Middle%'

--14. Вывести имена и зарплаты Senior специалистов
select  e.employee_name,r.role_name,s.monthly_salary
from employees as e join roles_employee as re on e.id=re.employee_id
join roles as r on r.id =re.role_id
join employee_salary  as es on e.id=es.employee_id
join salary as s on s.id=es.salary_id 
where r.role_name like 'Senior%'

--15. Вывести зарплаты Java разработчиков
select  e.employee_name,r.role_name,s.monthly_salary
from employees as e join roles_employee as re on e.id=re.employee_id
join roles as r on r.id =re.role_id
join employee_salary  as es on e.id=es.employee_id
join salary as s on s.id=es.salary_id 
where r.role_name like '%Java developer'

-- 16. Вывести зарплаты Python разработчиков
select  e.employee_name,r.role_name,s.monthly_salary
from employees as e join roles_employee as re on e.id=re.employee_id
join roles as r on r.id =re.role_id
join employee_salary  as es on e.id=es.employee_id
join salary as s on s.id=es.salary_id 
where r.role_name like '%Python developer'

-- 17. Вывести имена и зарплаты Junior Python разработчиков
select  e.employee_name,r.role_name,s.monthly_salary
from employees as e join roles_employee as re on e.id=re.employee_id
join roles as r on r.id =re.role_id
join employee_salary  as es on e.id=es.employee_id
join salary as s on s.id=es.salary_id 
where r.role_name like 'Junior Python developer'

--18. Вывести имена и зарплаты Middle JS разработчиков
select  e.employee_name,r.role_name,s.monthly_salary
from employees as e join roles_employee as re on e.id=re.employee_id
join roles as r on r.id =re.role_id
join employee_salary  as es on e.id=es.employee_id
join salary as s on s.id=es.salary_id 
where r.role_name like 'Middle JavaScript developer'

--19. Вывести имена и зарплаты Senior Java разработчиков
select  e.employee_name,r.role_name,s.monthly_salary
from employees as e join roles_employee as re on e.id=re.employee_id
join roles as r on r.id =re.role_id
join employee_salary  as es on e.id=es.employee_id
join salary as s on s.id=es.salary_id 
where r.role_name like 'Senior Java developer'

--20. Вывести зарплаты Junior QA инженеров
select r.role_name,s.monthly_salary
from roles as r join roles_employee as re on re.role_id=r.id 
join employees as e on e.id =re.employee_id 
join employee_salary as es on e.id =es.employee_id
join salary as s on s.id=es.salary_id 
where r.role_name like 'Junior QA engineer'

-- 21. Вывести среднюю зарплату всех Junior специалистов
select r.role_name, round(avg(s.monthly_salary),2)
from roles as r join roles_employee as re on re.role_id=r.id 
join employees as e on e.id =re.employee_id 
join employee_salary as es on e.id =es.employee_id
join salary as s on s.id=es.salary_id 
where r.role_name like 'Junior%'
group by r.role_name

--22. Вывести сумму зарплат JS разработчиков
select r.role_name, sum(s.monthly_salary)
from roles as r join roles_employee as re on re.role_id=r.id 
join employees as e on e.id =re.employee_id 
join employee_salary as es on e.id =es.employee_id
join salary as s on s.id=es.salary_id 
where r.role_name like '%JavaScript developer'
group by r.role_name

-- 23. Вывести минимальную ЗП QA инженеров
select r.role_name, min(s.monthly_salary)
from roles as r join roles_employee as re on re.role_id=r.id 
join employees as e on e.id =re.employee_id 
join employee_salary as es on e.id =es.employee_id
join salary as s on s.id=es.salary_id 
where r.role_name like '%QA engineer'
group by r.role_name

--24. Вывести максимальную ЗП QA инженеров
select r.role_name, max(s.monthly_salary)
from roles as r join roles_employee as re on re.role_id=r.id 
join employees as e on e.id =re.employee_id 
join employee_salary as es on e.id =es.employee_id
join salary as s on s.id=es.salary_id 
where r.role_name like '%QA engineer'
group by r.role_name

--25. Вывести количество QA инженеров
select count(r.role_name)
from roles as r join roles_employee as re on re.role_id=r.id 
join employees as e on e.id =re.employee_id  
where role_name like '%QA engineer'

--26. Вывести количество Middle специалистов.
select count(r.role_name)
from roles as r join roles_employee as re on re.role_id=r.id 
join employees as e on e.id =re.employee_id  
where role_name like 'Middle%'

--27. Вывести количество разработчиков
select count(r.role_name)
from roles as r join roles_employee as re on re.role_id=r.id 
join employees as e on e.id =re.employee_id  
where role_name like '%developer'

--28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(s.monthly_salary)
from roles as r join roles_employee as re on re.role_id=r.id 
join employees as e on e.id =re.employee_id 
join employee_salary as es on e.id =es.employee_id
join salary as s on s.id=es.salary_id 
where r.role_name like '%developer'

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select  e.employee_name,r.role_name,s.monthly_salary
from employees as e join roles_employee as re on e.id=re.employee_id
join roles as r on r.id =re.role_id
join employee_salary  as es on e.id=es.employee_id
join salary as s on s.id=es.salary_id 
order by s.monthly_salary asc

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select  e.employee_name,r.role_name,s.monthly_salary
from employees as e join roles_employee as re on e.id=re.employee_id
join roles as r on r.id =re.role_id
join employee_salary  as es on e.id=es.employee_id
join salary as s on s.id=es.salary_id 
where s.monthly_salary >1700 and s.monthly_salary<2300
order by s.monthly_salary asc

