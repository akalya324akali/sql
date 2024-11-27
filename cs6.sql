create database learningdb;
use learningdb;


create table courses
(id int primary key auto_increment,
title varchar(100)not null,
description text);
select*from courses;
insert into courses(title,description)
values 
('Introduction to Programming','Learn the basics of programming using Python.'),
('Data Structures and Algorithms','An in-depth course on data structures and algorithms.'),
('web Development','A comprhensive guide to bulding websites using HTML,CSS, and javascript');
select*from courses;


create table instructors 
(id int primary key auto_increment,
name varchar(50)not null,
expertise varchar(50)not null);
select*from instructors;


insert into instructors(name,expertise)
values
('Alice Johnson', 'Python Programming'),
('Bob Smith', 'Web Development'),
('Charles Davis', 'Data Structures');
select*from instructors;

create table students 
(id int primary key auto_increment,
name varchar (50)not null,
email varchar (50)not null unique);


insert into students (name,email)
values
('John Doe', 'john.doe@example.com'),
('Jane Smith', 'jane.smith@example.com'),
('Mark Taylor', 'mark.taylor@example.com');
select*from students;


create table enrollments
(students_id int, foreign key(students_id) references students(id),
courses_id int, foreign key(courses_id)references courses(id),
enrollments_date DATE not null,
primary key(students_id ,courses_id));
 
 
 insert into enrollments (students_id,courses_id,enrollments_date)
 values
 (1,1,'2022-10-03'),
 (2,2,'2022-11-05'),
 (3,3,'2022-10-11');
 
 select*from enrollments; 
 

 select students.name as student_name,courses.title as course_title, enrollments_date 
 from enrollments 
 join students on enrollments.students_id=students.id
 join courses on enrollments.courses_id=courses.id;

select s.name as students_name,count(c.id)count_of_students from students s
join enrollment e 
on s.id=e.student_id
join course c
on c.id=e.course_id
group by s.name;

select courses.title as course_title,count(enrollments.students_id) as student_count
from enrollments 
join courses on enrollments.courses_id=courses.id
group by  courses.title;
 

