-- 1. +Вибрати усіх клієнтів, чиє ім'я має менше ніж 6 символів.
-- select * from client where length(firstname) = 6;

-- 2. +Вибрати львівські відділення банку.+
-- select * from client where city = 'lviv';

-- 3. +Вибрати клієнтів з вищою освітою та посортувати по прізвищу.
-- select * from client where Education = 'high' order by LastName desc;


-- 4.+Виконати сортування у зворотньому порядку над таблицею Заявка і вивести 5 останніх елементів.
-- select * from application order by idApplication desc limit 5 offset 0;

-- 5. +Вивести усіх клієнтів, чиє прізвище закінчується на OV чи OVA.
-- select * from client where lastName like '%yn' or LastName like '%ak';

-- 6. +Вивести клієнтів банку, які обслуговуються київськими відділеннями.
-- select * from client where Department_idDepartment = 1;

-- 7. +Вивести імена клієнтів та їхні номера телефону, погрупувавши їх за іменами.
-- select firstname, Passport from client order by FirstName

-- 8. +Вивести дані про клієнтів, які мають кредит більше ніж на 5000 тисяч гривень.
-- select * from client join application on Client_idClient=idClient where Sum > 5000;
	
-- 9. +Порахувати кількість клієнтів усіх відділень та лише львівських відділень.
-- select sum(Department_idDepartment) from client;
-- select sum(Department_idDepartment), Department_idDepartment from client where Department_idDepartment=2;

-- 10.Знайти кредити, які мають найбільшу суму для кожного клієнта окремо.
-- select max(Sum), Client_idClient from application group by Client_idClient;

-- 11. Визначити кількість заявок на крдеит для кожного клієнта.
-- select  Client_idClient, c.FirstName, c.LastName, count(Client_idClient) as countApp
-- from application as a
-- join client as c on a.Client_idClient = c.idClient
-- group by c.idClient order by a.Client_idClient


-- 12. Визначити найбільший та найменший кредити.
-- select max(Sum) as maxCredit, min(Sum) as minCredit from application


-- 13. Порахувати кількість кредитів для клієнтів,які мають вищу освіту.
-- select count(idApplication) from application
-- join client on client.idClient = application.Client_idClient where client.Education = 'high'


-- 14. Вивести дані про клієнта, в якого середня сума кредитів найвища.
select avg(Sum), a.Client_idClient, c.FirstName, c.LastName, c.Age
from application as a 
join client c on a.Client_idClient = c.idClient
group by a.Client_idClient order by avg(Sum) desc
limit 1;

# 15. Вивести відділення, яке видало в кредити найбільше грошей
select
	sum(Sum) as maxSum, a.Client_idClient, d.DepartmentCity
from application as a
join client c on c.idClient = a.Client_idClient 
join department d on d.idDepartment = c.Department_idDepartment
group by a.Client_idClient
order by maxSum desc
limit 1;




#  16. Вивести відділення, яке видало найбільший кредит.
select
	max(Sum) as S, a.idApplication, d.DepartmentCity
from application as a
join client c on c.idClient = a.Client_idClient 
join department d on d.idDepartment = c.Department_idDepartment
group by a.idApplication
order by S desc
limit 1;

# 17. Усім клієнтам, які мають вищу освіту, встановити усі їхні кредити у розмірі 6000 грн.
update application as a
join client c on c.idClient = a.Client_idClient
set Sum = 6666
where c.Education = 'high';




# 18. Усіх клієнтів київських відділень пересилити до Києва.
update client as c 
join department as d on d.idDepartment = c.Department_idDepartment
set c.City = 'Kyiv2'
where d.DepartmentCity = 'Kyiv';



# 19. Видалити усі кредити, які є повернені.
delete from application as a
where a.CreditState = 'Returned' limit 1000;



# 20. Видалити кредити клієнтів, в яких друга літера прізвища є голосною.



# Знайти львівські відділення, які видали кредитів на загальну суму більше ніж 5000






# Знайти клієнтів, які повністю погасили кредити на суму більше ніж 5000





# /* Знайти максимальний неповернений кредит.*/




# /*Знайти клієнта, сума кредиту якого найменша*/




# /*Знайти кредити, сума яких більша за середнє значення усіх кредитів*/



# /*Знайти клієнтів, які є з того самого міста, що і клієнт, який взяв найбільшу кількість кредитів*/



# місто чувака який набрав найбільше кредитів




