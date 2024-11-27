create database empolyeemanagement ;
use empolyeemanagement ;


create table departments 
(id int primary key auto_increment,
name varchar (50) not null);
select*from departments;

insert into departments (id,name)
       values 
       (1,'HR'),
	    (2,'IT'),
        (3,'FINANCE'),
        (4,'ACCOUNTING'),
        (5,'SALES');
        select*from departments;
	
create table employees
(id int  primary key auto_increment,
 name varchar(40) not null ,
 age int not null,
 gender varchar (10)not null,
 salary int not null check (salary >30000),
 department_id int,
 foreign key (department_id ) references departments(id)
);


 insert into employees values
    (1,'banu',32,'female',40000,2),
    (2,'janu',26,'female',34000,4),
    (3,'prabhu',24,'male',43000,1),
    (4,'gopal',32,'male',43000,5),
    (5,'abi',25,'female',54000,3),
    (6,'kumar',39,'male',40000,3);
select*from employees;


create table projects
 (id int primary key auto_increment,
 name varchar (50) not null,
 budget int not null check  (budget>10000)
 );
 
 insert into projects values
    ( 1,'project a',20000),
    (2,'project b',30000),
    (3,'project c',20000),
    (4,'project d',30000);
    
insert into projects values
(5,'project e',658454),
(6,'project f',58450);
 select*from projects;
 
  create table employee_projects
  ( employee_id int,
  project_id int ,
  primary key (employee_id,project_id),
  foreign key (employee_id ) references employees(id),
  foreign key (project_id) references projects(id)
  );
  
  insert into employee_projects values
  (2,3),
  (3,1),
  (1,2),
  (5,4),
  (4,5),(6,6);
  
  select*from employee_projects;

  
  create table attendance
  ( id int primary key auto_increment,
    employee_id int,
     date date not null,
     status enum ('present','absent','on leave')not null ,
       foreign key (employee_id) references employees(id)
       );
       
insert into attendance values
(1,1,'2024-11-12',1),
(2,2,'2024-11-10','present');

insert into attendance values 
(3,1,'2024-10-3',3),
(4,2,'2024-02-23',2),
(5,3,'2024-02-11',1),
(6,4,'2024-04-24',2),
(7,5,'2024-05-29',1),
(8,6,'2024-05-26',3);
select*from attendance;

select*from employees where id=2;
select*from projects where budget>50000;
select e.id as employee_id,e.name as employee_name,p.id as project_id,
 p.name as project_name from employees e
join employee_projects ep on e.id=ep.employee_id
join projects p on p.id=ep.project_id
;


select d.name,count(e.id) as count_of_employee from departments d
join employees e
on d.id=e.department_id
group by d.name;


select e.name,e.salary from employees e
where e.salary>50000;

select e.name,a.date,a.status from attendance a
join employees e
on a.employee_id=e.id
where e.name='abi' or e.id=3;



update employees set  salary=salary*1.10
where department_id=1;
select*from employees;

update employees set department_id =2
where id=4;
select*from employees;
       
delete from employees 
where name='abi';
delete from attendance 
where id=5;  
delete from employee_projects 
where employee_id=5;   
   
    
delete from projects
where id=2;
delete from employee_projects
where    project_id=2;

select*from projects;
    
alter table employees add column email varchar(50);

update employees set email='banusri12@gmail.com'
where name='banu';
update employees set email='janu@gmail.com'
where name='janu';
update employees set email='gopal@gmail.com'
where name='gopal';
update employees set email='prabhu@gmail.com'
where name='prabhu';
update employees set email='kumarr@gmail.com'
where name='kumar';
update employees set email='abi@gmail.com'
where name='abi';

alter table employees add  check (age>18);
insert into employees values
    (1,'banu',16,'female',40000,2,'banu@gmail.com');

alter table employees 
alter gender set default 'unknown';

insert into employees 
(id,name,age,salary,department_id,email)
values 
(7,'jai',28,40000,4,'jai23@gmail.com');