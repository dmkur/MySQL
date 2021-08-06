insert into user(name, age) values ('Los', 25);
insert into user(name, age) values ('Lilia', 20);
insert into user(name, age) values ('Nata', 18);
insert into car(user_id, model) values (1,'Lanos');
insert into car(user_id, model) values (1,'Porshe');

select * from user
join car on user_id= car.user_id;

use 'feb-2021';
-- select * from ratings
-- join students on ratings.student_id = students.id
-- join lesson on lesson.id = ratings.lesson_id;

-- замість * пишемо конкретні поля що нам необхідні
-- s,l,r - скорочений еліас. students as s
select
	s.name,
	s.age,
    l.label,
    r.rating
from ratings r
join students s on r.student_id = s.id
join lesson l on l.id = r.lesson_id;

-- concat - поєднанян
select concat(name, '_', age) as fullname from students;


-- мультиселекти
select * from students
where id in (select student_id from ratings where rating = 5)