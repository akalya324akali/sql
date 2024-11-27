create database studentdb;
use studentdb;

create table students 
(id int primary key auto_increment, 
name varchar (50)not null,
age int not null,
email varchar (50) not null unique);

insert into students (name,age,email)
values
('kalai',21,'kalai43@gmail.com'),
('gopi',22,'gopi65@gmail.com'),
('akali',20,'akali03gmail.com');
select*from students;


create table course 
(id int primary key auto_increment,
name varchar (59)not null);
insert into course (name)
values 
('bba'),
('b.com'),
('ba');
select*from course;

create table enrollment 
(student_id int,
 foreign key (student_id)references students(id),
course_id int,
foreign key (course_id) references course(id),
grade char(1),primary key (student_id,course_id)
);
insert into enrollment (student_id,course_id,grade)
value 
(1,1,'a'),
(2,2,'c'),
(3,3,'o');
select*from enrollment;

select*from students;
select*from course;


select s.name as students_name,
c.name as course_name
from enrollment e
join students s
on e.student_id =s.id
join course c
on e.course_id=c.id;





select s.name as students_name,count(c.id)count_of_students from students s
join enrollment e 
on s.id=e.student_id
join course c
on c.id=e.course_id
group by s.name;








