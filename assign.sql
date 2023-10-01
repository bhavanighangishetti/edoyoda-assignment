create database assign;
use assign;
create table SalesPeople (Snum int primary key,Sname varchar(50) unique,City varchar(50),Comm int);
create table Customers( Cnum int primary key,Cname varchar(70),city varchar(70) NOT NULL,Snum int,foreign key(Snum) references SalesPeople(Snum));
create table Orders( Onum int primary key,Amt float,Odate varchar(255),Cnum int,Snum int, foreign key (Cnum) references Customers(Cnum),foreign key(Snum) references SalesPeople(Snum)) ;
update Orders set Odate=date_format(Odate,"%d-%b-%y");
insert into SalesPeople (Snum,Sname,City,Comm) values (1001,"Peel","London",12),(1002,"Serres","Sanjose",13),(1004,"Motika","London",11),(1007,"Rifkin","Barcelona",15),(1003,"Axelrod","Newyork",10);
insert into Customers(Cnum,Cname,City,Snum) values (2001,"Hoffman","London",1001),(2002,"Giovanni","Rome",1003),(2003,"Liu","Sanjose",1002),(2004,"Grass","Berlin",1002),(2006,"Clemens","London",1001),(2008,"Cisneros","Sanjose",1007),(2007,"Pereira","Rome",1004);
insert into Orders(Onum,Amt,Odate,Cnum,Snum) values (3001,18.69,"3-10-1990",2008,1007),(3003,767.19,"3-10-1990",2001,1001),(3002,1900.10,"3-10-1990",2007,1004),(3005,5160.45,"3-10-1990",2003,1002),(3006,1098.16,"03-10-1990",2008,1007),(3009,1713.23,"4-10-1990",2002,1003),(3007,75.75,"4-10-1990",2004,1002),(3008,4273.00,"5-10-1990",2006,1001),
(3010,1309.95,"6-10-1990",2004,1002),(3011,9891.88,"6-10-1990",2006,1001);

-- Count the number of Salesperson whose name begin with ‘a’/’A’.

select count(*) from SalesPeople where Sname like "A%" or Sname like "a%";

-- Display all the Salesperson whose all orders worth is more than Rs. 2000.

select  * from SalesPeople where Snum in (select Snum from Orders where Amt > 2000);

-- Count the number of Salesperson belonging to Newyork.

select count(*) from SalesPeople where City= "Newyork";

-- Display the number of Salespeople belonging to London and belonging to Paris.

select City,count(*) from SalesPeople where City="London" or City="Paris" group by City;

-- Display the number of orders taken by each Salesperson and their date of orders.


select count(*),Odate,Snum from Orders group by Snum,Onum;




select * from SalesPeople;

