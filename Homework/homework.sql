-- 1. +Вибрати усіх клієнтів, чиє ім'я має менше ніж 6 символів.
 select * from client where length(firstname) = 6;
 

-- 2. +Вибрати львівські відділення банку.+
 select * from client where city = 'lviv';
 

-- 3. +Вибрати клієнтів з вищою освітою та посортувати по прізвищу.
 select * from client where Education = 'high' order by LastName desc;
 

-- 4.+Виконати сортування у зворотньому порядку над таблицею Заявка і вивести 5 останніх елементів.
 select * from application order by idApplication desc limit 5 offset 0;
 

-- 5. +Вивести усіх клієнтів, чиє прізвище закінчується на OV чи OVA.
 select * from client where lastName like '%yn' or LastName like '%ak';
 

-- 6. +Вивести клієнтів банку, які обслуговуються київськими відділеннями.
 select * from client where Department_idDepartment = 1;
 

-- 7. +Вивести імена клієнтів та їхні номера телефону, погрупувавши їх за іменами.
 select firstname, Passport from client order by FirstName;
 

-- 8. +Вивести дані про клієнтів, які мають кредит більше ніж на 5000 тисяч гривень.
select * from client join application on Client_idClient=idClient where Sum > 5000;

	
-- 9. +Порахувати кількість клієнтів усіх відділень та лише львівських відділень.
 select count(idClient) as allClientCount
 from client;
 
select
	count(idClient) as clientsFromLviv
from client as c 
join department d on d.idDepartment = c.Department_idDepartment
where d.DepartmentCity = 'Lviv';



-- 10. Знайти кредити, які мають найбільшу суму для кожного клієнта окремо.
select
	c.*, max(Sum) as maxSumOfApplication
from client c
join application a on a.Client_idClient = c.idClient
group by c.idClient;



-- 11. Визначити кількість заявок на крдеит для кожного клієнта.
select 
	c.*, count(Client_idClient) as countOfApplications
from client c
join application a on c.idClient = a.Client_idClient
group by c.idClient;



-- 12. Визначити найбільший та найменший кредити.
select 
	max(Sum) as maxApp, 
	min(Sum) as minApp
from application;


-- 13. Порахувати кількість кредитів для клієнтів,які мають вищу освіту.
select 
	count(idApplication) as countApp 
from application as a
join client c on c.idClient = a.Client_idClient where c.Education = 'high';



-- 14. Вивести дані про клієнта, в якого середня сума кредитів найвища(без врахування валюти).

select 
	avg(Sum) as maxSumApp, c.*
from application as a
join client c on c.idClient = a.Client_idClient
	group by a.Client_idClient
	order by avg(Sum) desc
	limit 1;


-- 15. Вивести відділення, яке видало в кредити найбільше грошей
select 
	d.DepartmentCity,
	sum(Sum) over (partition by d.DepartmentCity) as maxSumForDepCity    
from application as a
join client c on c.idClient = a.Client_idClient
join department d on d.idDepartment = c.Department_idDepartment
order by maxSumForDepCity desc
limit 1;



-- 16. Вивести відділення, яке видало найбільший кредит.
select 
	max(Sum) as maxSumforApp, d.DepartmentCity
from application as a
join client c on c.idClient = a.Client_idClient
join department d on d.idDepartment = c.Department_idDepartment;



# 17. Усім клієнтам, які мають вищу освіту, встановити усі їхні кредити у розмірі 6000 грн.
update application as a
join client c on c.idClient = a.Client_idClient
set Sum = 6006
where c.Education = 'high';



# 18. Усіх клієнтів київських відділень пересилити до Києва.
update client as c 
join department as d on d.idDepartment = c.Department_idDepartment
set c.City = 'Kyiv_'
where d.DepartmentCity = 'Kyiv';



# 19. Видалити усі кредити, які є повернені.
delete from application as a
where a.CreditState = 'Returned' 
limit 1000;

# 20. Видалити кредити клієнтів, в яких друга літера прізвища є голосною.
delete a
from application a
join client c on c.idClient = a.Client_idClient
where 
	c.LastName like '_a%' or
	c.LastName like '_o%' or
	c.LastName like '_u%' or
	c.LastName like '_y%' or
	c.LastName like '_e%' or
	c.LastName like '_i%';



# 21.Знайти львівські відділення, які видали кредитів на загальну суму більше ніж 5000
select 
	sum(Sum) as sumApp, d.*
from application a
join client c on c.idClient = a.Client_idClient
join department d on d.idDepartment = c.Department_idDepartment
where d.DepartmentCity = 'Lviv'
group by d.idDepartment
having sumApp > 5000;




# 22.Знайти клієнтів, які повністю погасили кредити на суму більше ніж 5000
select * from application a
join client c on c.idClient = a.Client_idClient 
where a.Sum > 5000 and a.CreditState = 'Returned';



# 23.Знайти максимальний неповернений кредит.
select *, max(Sum)
from application
where CreditState = 'Not returned';



# 24.Знайти клієнта, сума кредиту якого найменша.
select
	c.*, min(Sum)
from client c
join application a on c.idClient = a.Client_idClient;



# 25.Знайти кредити, сума яких більша за середнє значення усіх кредитів.
select a.*, sum
from application a
where sum > (select avg(Sum) from application);



# 26. Знайти клієнтів, які є з того самого міста, що і клієнт, який взяв найбільшу кількість кредитів




# 27. Місто клієнта з найбільшою кількістю кредитів
