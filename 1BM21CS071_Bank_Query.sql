use Bank_Database_1BM21CS071;
create table Borrower
(
 Customer_name varchar(50),
 Loan_number int,
 Primary key(Customer_name,Loan_number),
 Foreign Key(Customer_name) references Bank_Customer(Customer_name),
 Foreign Key(Loan_number) references Loan(Loan_number)
 );
 
 select * from Borrower;
 
 Insert into Borrower
 values("Avinash",1),
 ("Dinesh",2),
 ("Mohan",3),
 ("Nikil",4),
 ("Ravi",5);
  
insert into Branch
values("SBI_MantriMarg","Delhi",200000);
select * from Branch;

insert into Bank_Account
values(12,"SBI_MantriMarg",2000);
select * from Bank_Account;

insert into Depositor
values("Nikil",12);
select *from Depositor;

select * from Bank_Customer;


select Customer_name
from Borrower
where Customer_name NOT IN (
                            select Customer_name
                            from Depositor
                            );
	
DELETE from Bank_Account
where Branch_Name IN (select Branch_Name
                      from Branch
                      where Branch_city="Bombay");

Select Customer_name
from Borrower b
where b.Loan_number= any (select l.Loan_number
                          from Loan l
                          where l.Branch_name = any(select Branch_name
                                                    from Branch
                                                    where Branch_city="Bangalore"))
                          and Customer_name in (Select Customer_name
												from Depositor
                                                where Customer_name= any (select Customer_name
																		  from Bank_customer
                                                                          where city="Bangalore"));
select Branch_name 
from Branch
where Assests >(select max(Assests)
                from Branch
                where Branch_city="Bangalore") and Branch_city<>"Bangalore";
                

UPdate Bank_Account
set Balance=1.05*Balance;
select *from  Bank_Account;
 