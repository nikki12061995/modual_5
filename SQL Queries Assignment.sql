-- 1. Create Table Name : Student and Exam
use test;

-- creat student Table
create table student(
     Rollno int auto_increment,
     Name varchar(50),
     Branch varchar(50),
     primary key(Rollno)
);

-- insert some values
insert into student 
    (Name,Branch)
    values('Jay','Computer Science'),
    ('Suhani','Electronic and Com'),
    ('Kriti','Electronic and Com');

-- create exam table
create table Exam(
     Rollno int,
     S_code varchar(50),
     Marks int,
     P_code varchar(50),
     foreign key(Rollno) references student(Rollno)
   );  
 
 -- insert Exam data
 insert into Exam
    (Rollno,S_code,Marks,P_code)
    values('1','CS11','50','CS'),
    ('1','CS12','60','CS'),
    ('2','EC101','66','EC'),
    ('2','EC102','70','EC'),
    ('3','EC101','45','EC'),
    ('3','EC102','50','EC');

-- 2. Create table given below: Employee and IncentiveTable   

-- create table Employee  
  create table Employee(
	  Employee_id int auto_increment,
      First_name varchar(50),
      Last_name varchar(50),
      salary int,
      Joining_date datetime,
      Department varchar(50),
      primary key(Employee_id)
  );
     
 -- insert values
 insert into employee
 (First_name,Last_name,salary,Joining_date,Department)
 values('John','Abraham',1000000,'2013-01-01 12.00.00','Banking'),
 ('Michael','Clarke',800000,'2013-01-01 12.00.00','Insurance'),
 ('Roy','Thomas',700000,'2013-02-01 12.00.00','Banking'),
 ('Tom','Jose',600000,'2013-02-01 12.00.00','Insurance'),
 ('Jerry','Pinto',650000,'2013-02-01 12.00.00','Insurance'),
 ('Philip','Mathew',750000,'2013-01-01 12.00.00','Services'),
 ('TestName1','123',650000,'2013-01-01 12.00.00','Services'),
 ('TestName2','Lname%',600000,'2013-02-1 12.00.00','Insurance');


-- create table Incentive
create table incentive(
     Employee_ref_id int,
     Incentive_date datetime,
     Incentive_amount int,     
     foreign key (Employee_ref_id) references employee (Employee_id)
     );


insert into incentive (Employee_ref_id,Incentive_date,Incentive_amount)
values('1','2013-02-01',5000),
('2','2013-02-01',3000),
('3','2013-02-01',4000),
('1','2013-01-01',4500),
('2','2013-01-01',3500);


-- 3. Get First_Name from employee table using Tom name “Employee Name”
update Employee set First_name='Employee Name' where Employee_id=4;

-- 4. Get FIRST_NAME, Joining Date, and Salary from employee table.
select First_name,Joining_date,salary from Employee; 

-- 5. Get all employee details from the employee table order by First_Name 
-- Ascending and Salary descending?
select * from Employee order by First_name;
select * from Employee order by salary desc;


-- 6. Get employee detailsfromemployee table whose first name contains ‘J’.
select * from Employee where First_name like 'j%';


-- 7. Get department wise maximum salary from employee table order by
-- 8. salaryascending?

select Department,salary from Employee order by salary;


-- 9. Select first_name, incentive amount from employee and incentives table 
-- forthose employees who have incentives and incentive amount greater than 3000
 
select First_name,Incentive_amount from Employee,incentive where Incentive_amount > 3000; 


-- 10. Create After Insert trigger on Employee table which insert records in viewtable




-- 11. Create table given below: Salesperson and Customer

-- create table Salesperson
create table Salesperson(
sno int primary key,
sname varchar(50),
city varchar(50),
comm varchar(50)
);


insert into Salesperson
(sno,sname,city,comm)
values(1001,'Peel','London','.12'),
(1002,'Serres','San Jose','.13'),
(1004,'Motika','London','.11'),
(1007,'Rafkin','Barcelona','.15'),
(1003,'Axelrod','New York','.1');


-- create table customer
create table customer(
cnm int primary key,
cname varchar(50),
city varchar(50),
rating int,
sno int,
foreign key (sno) references Salesperson (sno)
);

-- insert table
insert into customer (cnm,cname,city,rating,sno)
values
(201,'Hoffman','London',100,1001),
(202,'Giovanne','Roe',200,1003),
(203,'Liu','San Jose',300,1002),
(204,'Grass','Barcelona',100,1002),
(206,'Clemens','London',300,1007),
(207,'Pereira','Roe',100,1004);


-- 12. Retrieve the below data from above table



-- 13. All orders for more than $1000.
select * from orders where order_value > 1000;


-- 14. Names and cities of all salespeople in London with commission above 0.12
select sname,city from Salesperson where city='London' And comm > .12;


-- 15. All salespeople either in Barcelona or in London
select * from Salesperson where city='Barcelona'  or city='London'; 


-- 16. All salespeople with commission between 0.10 and 0.12. (Boundary
-- valuesshould be excluded).
select * from Salesperson where comm between 0.10 and 0.12;


-- 17. All customers excluding those with rating <= 100 unless they are located inRome.
select * from customer where rating <= 100 and city = 'Roe';


-- 18. Write a SQL statement that displays all the information about all salespeople

create table salesman(
salesman_id int,
sal_name varchar(50),
city varchar(50),
commission varchar(50)
);


insert into salesman(salesman_id,sal_name,city,commission)
values
(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5007,'Paul Adam','Rome',0.13),
(5003,'Lauson Hen','San Jose',0.12);

-- 19. From the following table, write a SQL query to find orders that are 
-- delivered by a salesperson with ID. 5001. Return ord_no, ord_date, purch_amt.
create table orders(
    ord_no int,
    purch_amt varchar(50),
    ord_date date,
    customer_id int,
    salesman_id int,
    primary key(ord_no),
    foreign key (salesman_id) references salesman(salesman_id)
);

drop table orders;

insert into orders(ord_no,purch_amt,ord_date,customer_id,salesman_id)
values
(70001,'150.5','2012-10-05',3005,5002),
(70009,'270.65','2012-09-10',3001,5005),
(70002,'65.26','2012-10-05',3002,5001),
(70004,'110.5','2012-08-17',3009,5003),
(70007,'948.5','2012-09-10',3005,5002),
(70005,'2400.6','2012-07-27',3007,5001),
(70008,'5760','2012-09-10',3002,5001),
(70010,'1983.43','2012-10-10',3004,5006),
(70003,'2480.4','2012-10-10',3009,5003),
(70012,'250.45','2012-06-27',3008,5002),
(70011,'75.29','2012-08-17',3003,5007),
(70013,'3045.6','2012-04-25',3002,5001);

select ord_no,purch_amt,ord_date from orders where salesman_id=5001;

-- 20.From the following table, write a SQL query to select a range of 
-- products whose price is in the range Rs.200 to Rs.600. Begin and end 
-- values are included. Return pro_id, pro_name, pro_price, and pro_com.

create table item_mast(
    pro_id int,
pro_name varchar(50),
pro_price varchar(50),
pro_com int,
primary key (pro_id)
);
 
 insert into item_mast(pro_id,pro_name,pro_price,pro_com)
 values
 (101 ,'Mother Board','3200.00',15),
 (102,'Key Board','450.00',16),
 (103,'ZIP drive','250.00',14),
 (104,'Speaker','550.00',16),
 (105,'Monitor','5000.00',11),
 (106,'DVD drive','900.00',12),
 (107,'CD drive','800.00',12),
 (108,'Printer','2600.00',13),
 (109,'Refill cartridge','350.00',13),
 (110,'Mouse','250.00',12);
 
 select * from item_mast where pro_price<=600 and pro_price>=200;
 
 
 -- 21.From the following table, write a SQL query to calculate the average price 
-- for a manufacturer code of 16. Return avg.
select sum(pro_price) from item_mast where pro_price=16;
select avg(pro_price) from item_mast where pro_price=16;


-- 22.From the following table, write a SQL query to display the pro_name as 
-- 'Item Name' and pro_priceas 'Price in Rs.'

select pro_name as 'Item Name', pro_price as 'Price in Rs.' from item_mast;


-- 23.From the following table, write a SQL query to find the items whose prices
-- are higher than or equal to $250. Order the result by product price in 
-- descending, then product name in ascending. Return pro_name and 
-- pro_price.

select pro_name from item_mast where pro_price>=250;
select * from item_mast order by pro_price desc;
select pro_name from item_mast order by pro_name;


-- 24.From the following table, write a SQL query to calculate average price of the 
-- items for each company. Return average price and companycode.
 
select avg(pro_price), pro_com from item_mast where pro_com=11;
select avg(pro_price), pro_com from item_mast where pro_com=12;
select avg(pro_price), pro_com from item_mast where pro_com=13;
select avg(pro_price), pro_com from item_mast where pro_com=14;
select avg(pro_price), pro_com from item_mast where pro_com=15;
select avg(pro_price), pro_com from item_mast where pro_com=16;







 



