-- SELECT * FROM students;
-- SELECT name,age FROM students;
-- select * from students where age = 15;
-- select * from students where name = 'roman';

-- wildcard ;
-- select * from students where name like '%n';
-- select * from students where name like 'o%';
-- select * from students where name like '%o%';

-- '_' пропустити символ
-- знайти усіх в кого 4й символ "а", все решта після неї всерівно
-- select * from students where name like '___a%';

-- сортування
-- default ASC - сортування від мін до макс, DESC - від макс до мін
-- select * from students order by age;
-- select * from students order by age desc;

-- комбінація запитів
-- select * from students where gender = 'male' order by age desc;

-- select * from students where length(name) = 4;
-- select * from students where age>18;
-- select * from students where age != 18;

-- діпазон
-- select * from students where age between 20 and 30;
-- select * from students where age>=20 and age<=30;
-- select * from students where age>20 and gender like 'f%';
-- select * from students where age>20 or gender like 'f%';

-- select * from students where age = 18 or (name like 'o%' and gender like 'f%');
-- select * from students where age between 20 and 30 and name like 'o%';

-- поганий код
-- select * from students where age = 30 or age = 25 or age = 20; 
-- правильний код
-- select * from students where age in(20,25,30);

-- агрегатні функції min max count sume avg

-- select max(age) from students;
-- select min(age) from students;
-- select avg(age) from students;
-- select count(age) from students;
-- select sum(age) from students;

-- кобінації запитів із функціями тільки через групування
-- select max(age), gender from students group by gender;
-- select max(age), gender from students where gender = 'female' group by gender;

-- alias
-- select 
-- 	avg(rating), 
 --    count(rating), 
 --    student_id 
-- from ratings 
-- group by student_id;


-- select distinct - унікальність
-- select distinct gender from students


-- пагінація
-- limit - к-ть елементів які обрати
-- offset - к-ть елементів що пропустити
-- select  * from students limit 3 offset 0;
-- select * from students limit 3 offset 6

-- на фронті наступне:
-- 'get /users?page=1&perPage=20;'
-- 'select * from students limit ${perPage} offset ${perPage * (page-1)}'


-- delete(softdelte)
-- update 

-- ліміт для безпеки 
-- update students set name='lola2021' where age>30 and gender like 'f%' limit 10;
-- неможливо стерти бо є звязок з іншою схемою
-- delete from stuednts where name='lola2021' limit 10;

delete from students where id=10;




