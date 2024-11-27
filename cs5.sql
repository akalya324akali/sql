create database hospitaldb;
use hospitaldb;
create table patients 
(id int primary key auto_Increment,
name varchar (50) not null,
age int Not Null,
gender varchar(50),
contact varchar(50));
 
 insert into patients(name,age,gender,contact)
 values 
 ('raju',23,'male','raju63@gmail.com'),
 ('jai',38,'male','jai87@gmail.com'),
 ('ram',39,'male','ram23@gmail.com');
 

 select*from patients;
 
 
 create table doctor 
 (id int primary key auto_Increment,
 name varchar (50)not null,
 specialaization varchar (50)not null);
insert into doctor(name,specialaization)
values 
('shamini','cardiologist'),
('poorni','neurologist'),
('siddhar','dentist');
select*from doctor;


create table appointment (
id int primary key auto_increment,
patient_id int,
 foreign key(patient_id) references patients(id),
doctor_id int,
 foreign key(doctor_id) references doctor(id),
appointment_date DATE not null,
status ENUM ('scheduled','completed','cancelled')
);


insert into appointment (patient_id,doctor_id,appointment_date,status)
values
(1,1,'2022-02-22','completed'),
(2,2,'2022-04-02','scheduled'),
(3,3,'2022-03-06','cancelled');
select*from appointment;

select appointment.id as appointments_id,patients.name as patient_name,doctor.name as doctors_name,appointment_date from appointment
join patients on patient_id=patients.id
join doctor on doctor_id=doctor.id;

select s.name as students_name,count(c.id)count_of_students from students s
join enrollment e 
on s.id=e.student_id
join course c
on c.id=e.course_id
group by s.name;





select d.name as doctors_name,count(a.id) as appointment 
from appointment a 
join doctor d 
on a.doctor_id=d.id
group by d.name;


