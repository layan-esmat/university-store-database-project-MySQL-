create database UniversityStore; 
use UniversityStore;

-- STUDENT TABLE
create table student(studentID int primary key, studentName varchar(20) not null, nationality varchar(20) default 'saudi', age int check(age between 18 and 40), major varchar(20) not null);

-- PRODUCT TABLE
create table product( productID int primary key, productName varchar(20) not null, category varchar(20) default 'stationary', price decimal check(price>0));

-- PURCHASE TABLE 
create table purchase(purcahseID int primary key, studentID int, productID int, purchaseDate date default (current_date), constraint fk1 foreign key(studentID) references student(studentID), constraint fk2 foreign key(productID) references product(productID));

-- DATA INSERTION
insert into student
values (1, 'sarah', 'saudi', 22, 'civil engineering'),
(2, 'suzy', 'jordanian', 19, 'biology'),
(3, 'emily', 'american', 21, 'fashion'),
(4, 'lilah', 'duch', 20, 'data science');

insert into product
values(1001, 'pencil', 'stationary', 3),
(1002, 'pencil case', 'storage items',6),
(1003, 'book', 'books',25),
(1004, 'calculator', 'electronics',50);

insert into purchase
values(232, 1, 1001, '2025-12-05'),
(212, 2, 1002, '2025-12-01'),
(245, 3, 1003, '2025-11-24'),
(264, 4, 1004, '2025-12-23');

-- QUERIES
select studentName, nationality, price 
from student inner join purchase 
on student.studentID = purchase.studentID 
inner join product 
on product.productID = purchase.productID;

insert into student
values(5, 'narah', 'saudi', 25, 'mathematics');

select studentName, productName
from student left join purchase
on student.studentID = purchase.studentID 
left join product on product.productID = purchase.productID;

select studentName, category 
from student, purchase ,product
where student.studentID = purchase.studentID and product.productID = purchase.productID and student.nationality = 'saudi';
-- another way
select studentName, category
from student inner join purchase on student.studentID = purchase.studentID inner join product on product.productID = purchase.productID
where nationality = 'saudi';

select studentName, count(productID) as products_purchased
from  student left join purchase 
on student.studentID = purchase.studentID 
group by student.studentID, student.studentName;

select studentName as who_payed_more_than_20, price
from student s inner join purchase p on s.studentID = p.studentID inner join product pr on pr.productID = p.productID
where pr.price>20;

-- VIEWS 
create view v_studentPurchases
as select studentName, productName, category, price
from student, product, purchase
where product.category = 'stationary';
