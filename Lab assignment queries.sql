-- create database
create database order_directory;

use order_directory;

-- 1)	You are required to create tables for supplier,customer,category,product,
-- supplier_pricing,order,rating to store the data for the E-commerce with the schema definition given below.

-- Table:supplier
create table if not exists supplier(
SUPP_ID INT primary key,
SUPP_NAME VARCHAR(50) not null,
SUPP_CITY VARCHAR(50),
SUPP_PHONE VARCHAR(50) not null
);

-- Table:customer
create table if not exists customer(
CUS_ID INT primary key,
CUS_NAME VARCHAR(50) not null,
CUS_PHONE VARCHAR(10) not null,
CUS_CITY VARCHAR(30) not null,
CUS_GENDER CHAR not null
);

-- Table:category
create table if not exists category(
CAT_ID INT primary key,
CAT_NAME VARCHAR(20) NOT NULL
);

-- Table:product
create table if not exists product(
PRO_ID INT not null primary key,
PRO_NAME VARCHAR(20) NOT NULL,
PRO_DESC VARCHAR(60),
CAT_ID INT not null,
foreign key(CAT_ID) references category(CAT_ID)
);

-- Table:supplier_pricing
create table if not exists supplier_pricing(
PRICING_ID INT primary key,
PRO_ID INT not null,
SUPP_ID INT not null,
SUPP_PRICE INT default 0,
foreign key(PRO_ID) references product(PRO_ID),
foreign key(SUPP_ID) references supplier(SUPP_ID)
);

-- Table:order
create table if not exists `order` ( 
ORD_ID INT primary key,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE NOT NULL,
CUS_ID INT not null,
PRICING_ID INT not null,
foreign key(CUS_ID) references customer(CUS_ID),
foreign key(PRICING_ID) references supplier_pricing(PRICING_ID)
);

-- Table:rating
create table if not exists rating(
RAT_ID INT primary key,
ORD_ID INT,
RAT_RATSTARS INT NOT NULL,
foreign key(ORD_ID) references `order`(ORD_ID)
);

-- 2)	Insert the following data in the table created above

-- Supplier table
Insert into supplier values (1,'Rajesh Retails',	'Delhi','1234567890');
Insert into supplier values(2,'Appario Ltd.','Mumbai','2589631470');
Insert into supplier values(3,'Knome products','Banglore','9785462315');
Insert into supplier values(4,'Bansal Retails','Kochi','8975463285');
Insert into supplier values(5,'Mittal Ltd.','Lucknow','7898456532');

-- select * from supplier;

-- customer table
Insert into customer values (1,'AAKASH','9999999999','DELHI','M');
Insert into customer values (2,'AMAN','9785463215',	'NOIDA','M');
Insert into customer values (3,'NEHA','9999999999','MUMBAI','F');
Insert into customer values (4,'MEGHA',	'9994562399','KOLKATA','F');
Insert into customer values (5,	'PULKIT','7895999999','LUCKNOW','M');

-- select * from  customer ;

-- category table
Insert into category values (1,'BOOKS');
Insert into category values (2,'GAMES');
Insert into category values (3,'GROCERIES');
Insert into category values (4,'ELECTRONICS');
Insert into category values (5,'CLOTHES');

 -- select * from category;

-- product table 
Insert into product values (1,'GTA V','Windows 7 and above with i5 processor and 8GB RAM',2);
Insert into product values (2,'TSHIRT','SIZE-L with Black, Blue and White variations',5);
Insert into product values (3,'ROG LAPTOP',	'Windows 10 with 15inch screen, i7 processor, 1TB SSD',4);
Insert into product values (4,'OATS','Highly Nutritious from Nestle',3);
Insert into product values (5,'HARRY POTTER','Best Collection of all time by J.K Rowling',1);
Insert into product values (6,'MILK','1L Toned MIlk',3);
Insert into product values (7,'Boat Earphones','1.5Meter long Dolby Atmos',4);
Insert into product values (8,'Jeans','Stretchable Denim Jeans with various sizes and color',5);
Insert into product values (9,'Project IGI','compatible with windows 7 and above',2);
Insert into product values (10,'Hoodie','Black GUCCI for 13 yrs and above',5);
Insert into product values (11,'Rich Dad Poor Dad','Written by RObert Kiyosaki',1);
Insert into product values (12,'Train Your Brain','By Shireen Stephen',1);

-- select * from product;

-- supplier pricing table
Insert into supplier_pricing values (1,1,2,1500);
Insert into supplier_pricing values (2,3,5,30000);
Insert into supplier_pricing values (4,2,3,2500);
Insert into supplier_pricing values (5,4,1,1000);
Insert into supplier_pricing values(3,5,1,3000);

Insert into supplier_pricing values(6,12,2,780);
Insert into supplier_pricing values(7,12,4,789);
Insert into supplier_pricing values(8,3,1,31000);
Insert into supplier_pricing values(9,1,5,1450);
Insert into supplier_pricing values(10,4,2,999);
Insert into supplier_pricing values(11,7,3,549);
Insert into supplier_pricing values(12,7,4,529);
Insert into supplier_pricing values(13,6,2,105);
Insert into supplier_pricing values(14,6,1,99);
Insert into supplier_pricing values(15,2,5,2999);
Insert into supplier_pricing values(16,5,2,2999);

-- select * from supplier_pricing;

-- order table
Insert into `order` values(101,	1500    ,'2021-10-06',  2,  1);
Insert into `order` values(102,	1000	,'2021-10-12',	3,	5);
Insert into `order` values(103,	30000	,'2021-09-16',	5,	2);
Insert into `order` values(104,	1500	,'2021-10-05',	1,	1);
Insert into `order` values(105,	3000	,'2021-08-16',	4,	3);
Insert into `order` values(106,	1450	,'2021-08-18',	1,	9);
Insert into `order` values(107,	789		,'2021-09-01',	3,	7);
Insert into `order` values(108,	780		,'2021-09-07',	5,	6);
Insert into `order` values(109,	3000	,'2021-00-10',	5,	3);
Insert into `order` values(110,	2500	,'2021-09-10',	2,	4);
Insert into `order` values(111,	1000	,'2021-09-15',	4,	5);
Insert into `order` values(112,	789		,'2021-09-16',	4,	7);
Insert into `order` values(113,	31000	,'2021-09-16',	1,	8);
Insert into `order` values(114,	1000    ,'2021-09-16',	3,	5);
Insert into `order` values(115,	3000	,'2021-09-16',	5,	3);
Insert into `order` values(116,	99		,'2021-09-17',	2,	14);

-- select * from `order`;

Insert into rating values ( 1,	101,	4);
Insert into rating values ( 2,	102	,	3);
Insert into rating values ( 3,	103	,	1);
Insert into rating values ( 4,	104	,	2);
Insert into rating values ( 5,	105	,	4);
Insert into rating values ( 6,	106	,	3);
Insert into rating values ( 7,	107	,	4);
Insert into rating values ( 8,	108	,	4);
Insert into rating values ( 9,	109	,	3);
Insert into rating values ( 10,	110	,	5);
Insert into rating values ( 11,	111	,	3);
Insert into rating values ( 12,	112	,	4);
Insert into rating values ( 13,	113,	2);
Insert into rating values ( 14,	114	,	1);
Insert into rating values ( 15,	115	,	1);
Insert into rating values ( 16,	116,	0);

-- select * from rating;


-- queries :

-- 3)	Display the total number of customers based on
--   gender who have placed orders of worth at least Rs.3000.

select customer.CUS_GENDER, count(customer.CUS_ID)  from customer inner join  `order` 
on customer.CUS_ID = `order`.CUS_ID 
where `order`.ORD_AMOUNT >=3000 group by customer.CUS_GENDER;


-- 4)	Display all the orders along with product name 
-- ordered by a customer having Customer_Id=2 


select p1.ORD_ID, p1.ORD_AMOUNT, p1.ORD_DATE, p1.CUS_ID, p1.PRICING_ID, P.PRO_NAME from (select O.ORD_ID, O.ORD_AMOUNT, O.ORD_DATE, O.CUS_ID, O.PRICING_ID ,S.PRO_ID
from `order` as O  
inner join supplier_pricing as S
on O.PRICING_ID = S.PRICING_ID 
where O.CUS_ID =2  )as p1
inner join product as P
on p1.PRO_ID = p.PRO_ID
;

-- 5)	Display the Supplier details who can supply more than one product.

select S.SUPP_ID, S.SUPP_NAME, S.SUPP_CITY, S.SUPP_PHONE from supplier as S inner join  supplier_pricing as P
on  S.SUPP_ID = P.SUPP_ID 
group by S.SUPP_ID
having count(S.SUPP_ID) > 1
;


-- 6)	Find the least expensive product from each category and
--  print the table with category id, name, product name and price of the product

use order_directory;
select p1.CAT_ID, p1.CAT_NAME, p1.PRO_NAME, min(S.SUPP_PRICE) as MIN_PRICE from 
(select P.PRO_ID, P.PRO_NAME, P.CAT_ID , C.CAT_NAME from 
product as P inner join category as C
on P.CAT_ID = C.CAT_ID ) as p1
inner join supplier_pricing as S
on p1.PRO_ID = S.PRO_ID
group by p1.CAT_ID
;

-- 7)	Display the Id and Name of the Product ordered after “2021-10-05”.

select p1.PRO_ID, p1.PRO_NAME from (select P.PRO_ID, P.CAT_ID, S.PRICING_ID, P.PRO_NAME from 
product  as P inner join supplier_pricing as S
on P.PRO_ID = S.PRO_ID )as p1
inner join `order` as O
on p1.PRICING_ID = O.PRICING_ID
where O.ORD_DATE > '2021-10-05'
;


-- 8)	Display customer name and gender whose names start or end with character 'A'.

select c.CUS_NAME, c.CUS_GENDER from customer as c
where c.CUS_NAME like 'A%' or  c.CUS_NAME like '%A'; 


-- 9)	Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, 
-- If rating =5, print “Excellent Service”,
-- If rating >4 print “Good Service”, 
-- If rating >2 print “Average Service” 
-- else print “Poor Service”.

select p3.SUPP_ID, p3.SUPP_NAME, p3.RAT_RATSTARS, 
CASE 
   WHEN p3.RAT_RATSTARS =5 THEN 'Excellent Service'
   WHEN p3.RAT_RATSTARS >4 THEN 'Good Service'
   WHEN p3.RAT_RATSTARS >2 THEN 'Average Service'
   ELSE 'Poor Service'
END as Type_of_Service
from 
(select p2.SUPP_ID, s.SUPP_NAME, p2.RAT_RATSTARS from (
select S.SUPP_ID, p1.RAT_RATSTARS from (
select R.RAT_RATSTARS, O.PRICING_ID  from  rating as R inner join `order` as O
on O.ORD_ID = R.ORD_ID)  as p1
inner join supplier_pricing as S
on p1.PRICING_ID = S.PRICING_ID) as p2
inner join supplier as s
on s.SUPP_ID = p2.SUPP_ID ) as p3
;

call TypeOfService();



















