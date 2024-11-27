create database RetailDB;
use RetailDB;

create table product 
(id int primary key auto_increment,
name varchar(50)not null,
Price decimal(10,2)not null check (Price>0),
stock int not null check (stock>=0));


insert into product (name,price,stock)
values
('books',500,8),
('tv',40000,20),
('phone',20000,40);
select*from product;



create table suppliers
(id int primary key auto_increment,
name varchar (50)not null,
contact varchar(50));
 
 insert into suppliers(name,contact)
 values
 ('bala','bala34@gmail.com'),
 ('mari','mari21@gmail.com'),
 ('sola','sola31@gmail.com');
 select*from suppliers;
 
 
 
 create table sales
 (id int primary key Auto_Increment,
 product_id int, foreign key(product_id) references product(id),
 date DATE not null,
 quantity int not null check (quantity>0),
 total_Price DECIMAL(10,2) not null);
 
 insert into sales(product_id,date,quantity,total_price)
 values
 (1,'2023-09-23',30,20000),
 (2,'2020-03-1',20,30000),
 (3,'2022-04-03',40,50000);
 select*from sales;
 
 
 
 select*from product;
 
 select*from product where stock<10;
 
 select product.name as products_name,sales.total_price from sales 
 join product on sales.product_id=product.id;
 
 select product.name as products_name,sum(sales.total_price) from sales
 join product on sales.product_id=product.id
 group by product.name;
 