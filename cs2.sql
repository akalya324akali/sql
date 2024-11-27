create database  casestudy;
 use casestudy;

create table books
(id int primary key auto_increment,
title varchar (100)not null,
author varchar(50)not null,
published_year YEAR not null,
genre varchar(30));
 
 insert into books 
 values
 (1,'tamil','kamal',1990,'fiction'),
 (2,'mani','raj',1996,'fiction'),
 (3,'god story','gopal',1992,'fiction'),
(4,'toy story','prabhu',1999,'fiction');
select*from books;

 create table members
(id int primary key auto_increment,
name varchar(50)not null,
membership_date DATE not null); 
insert into members  
values 
(1,'bala','2000-05-1'),
(2,'krish','2002-03-14'),
(3,'vicky','2001-02-21'),
(4,'varun','2000-12-11');

select*from members;

create table borrowing
(id int primary key auto_increment, 
book_id int  ,
foreign key (book_id) references books(id),
members_id int ,
foreign key ( members_id)references members(id),
borrow_date DATE not null,
return_date DATE
);

insert into borrowing (book_id,members_id,brrow_date,return_date)
values
(2,1,'2001-02-1','2001-03-04'),
(3,2,'2003-03-01','2003-08-02'),
(1,3,'2006-07-09','2006-09-08'),
(4,4,'2009-04-04','2009-06-20');
select*from borrowing;

select*from books;
select*from members;

select  m.name ,b.title,brrow_date,br.return_date from borrowing br
join books b
on book_id=b.id
join members m
on members_id=m.id;
 
 select m.name,count(b.id)count_of_book from members m 
 join borrowing br 
on m.id=br.members_id
join books b
on b.id=br.book_id
group by m.name;

 
