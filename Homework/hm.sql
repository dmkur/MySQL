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
-- select count(idClient)as AllClients from client;
-- select count(Department_idDepartment) from client where Department_idDepartment in (2,5)

-- 10. Знайти кредити, які мають найбільшу суму для кожного клієнта окремо.
-- select Client_idClient, max(Sum) from application group by Client_idClient

-- 11. Визначити кількість заявок на крдеит для кожного клієнта.
-- select Client_idClient, count(Client_idClient)  from application group by Client_idClient

-- 12. Визначити найбільший та найменший кредити.
-- select max(Sum), min(Sum) from application











