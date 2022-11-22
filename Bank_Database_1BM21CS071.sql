create database Bank_Database_1BM21CS071;
use Bank_Database_1BM21CS071;
create table Branch
(
Branch_name varchar(50),
Branch_city varchar(50),
Assests int,
primary key(Branch_name)
);

create table Bank_Account
(
 Acc_no int,
 Branch_name varchar(50),
 Balance int,
 Primary key(Acc_no),
 Foreign Key(Branch_name) references Branch(Branch_name)
 );
 
 create table Bank_Customer
(
Customer_name varchar(50),
Customer_street varchar(50),
city varchar(50),
 Primary key(Customer_name)
 );
 
 create table Depositor
(
 Customer_name varchar(50),
 Acc_no int,
 Primary key(Customer_name,Acc_no),
 Foreign Key(Customer_name) references Bank_Customer(Customer_name),
 Foreign Key(Acc_no) references Bank_Account(Acc_no)
 );
 
 create table Loan
(
 Loan_number int,
 Branch_name varchar(50),
 Amount int,
 Primary key(Loan_number),
 Foreign Key(Branch_name) references Branch(Branch_name)
 );
 
 Insert into Branch
 values("SBI_Chamrajpet","Bangalore",50000),
	    ("SBI_ResidencyRoad","Bangalore",10000),
        ("SBI_ShivajiRoad","Bombay",20000),
		("SBI_ParlimentRoad","Delhi",10000),
        ("SBI_Jantarmantar","Delhi",20000);
select * from Branch;

Insert into Bank_Account
values(1,"SBI_Chamrajpet",2000),
	  (2,"SBI_ResidencyRoad",5000),
      (3,"SBI_ShivajiRoad",6000),
      (4,"SBI_ParlimentRoad",9000),
      (5,"SBI_Jantarmantar",8000),
      (6,"SBI_ShivajiRoad",4000),
      (8,"SBI_ResidencyRoad",4000),
      (9,"SBI_ParlimentRoad",3000),
      (10,"SBI_ResidencyRoad",5000),
      (11,"SBI_Jantarmantar",2000);
select * from Bank_Account;

Insert into Bank_Customer
values("Avinash","Bull_Temple_Road","Bangalore"),
      ("Dinesh","Bannergatta_Road","Bangalore"),
      ("Mohan","NationalCollege_Road","Bangalore"),
      ("Nikil","Akbar_road","Delhi"),
      ("Ravi","Prithviraj_Road","Delhi");
select * from Bank_Customer;

Insert into Depositor
values("Avinash",1),
      ("Dinesh",2),
      ("Nikil",4),
      ("Ravi",5),
      ("Avinash",8),
      ("Nikil",9),
      ("Dinesh",10),
      ("Nikil",11);
select * from Depositor;

insert into Loan
values(1,"SBI_Chamrajpet",1000),
      (2,"SBI_ResidencyRoad",2000),
      (3,"SBI_ShivajiRoad",3000),
      (4,"SBI_ParlimentRoad",4000),
      (5,"SBI_Jantarmantar",5000);
select * from Loan;

select Branch_name,(Assests/100000) as Assests_in_lakhs
from Branch;

create view Loan_view as
select Branch_name,sum(Amount) as Total_loan
from Loan
Group by Branch_name;
select * from Loan_view;

select d.Customer_name
from Bank_Account b,Depositor d
where b.Acc_no=d.Acc_no and branch_name="SBI_ResidencyRoad"
group by  Customer_name
Having count(*)>=2;


