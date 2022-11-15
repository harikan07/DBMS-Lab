create database INSURANCE_1BM21CS071;
use INSURANCE_1BM21CS071;
create table PERSON
(
 driver_id varchar(20),
 d_name varchar(30),
 address varchar(50),
 primary key(driver_id)
 );
 create table CAR
 (
  reg_num varchar(10),
  model varchar(20),
  m_year int,
  primary key(reg_num)
  );
  create table ACCIDENT
  (
   report_num int,
   accident_date date,
   location varchar(20),
   primary key(report_num)
   );
 create table OWNS
 (
  driver_id varchar(20),
  reg_num varchar(10),
  primary key(driver_id,reg_num),
  foreign key(driver_id) references PERSON(driver_id),
  foreign key(reg_num) references CAR(reg_num)
  );
  create table PARTICIPATED
  (
   driver_id varchar(20),
   reg_num varchar(10),
    report_num int,
   damage_amount int,
   primary key( driver_id ,reg_num,report_num),
   foreign key(driver_id) references PERSON(driver_id),
   foreign key(reg_num) references CAR(reg_num),
   foreign key(report_num) references ACCIDENT(report_num)
   );
   insert into PERSON
   values('A01','Richard','Srinivas nagar'),('A02','Pradeep','Rajajinagar'),('A03','Smith','Ashok nagar'),('A04','Venu','NR colony'),('A05','Jhon','Hanumanth nagar');
   insert into CAR
   values('KA052250','Indica',1990),('KA031181','Lancer',1957),('KA095477','Toyoto',1998),('KA053408','Honda',2008),('KA041702','Audi',2005);  
   insert into ACCIDENT
   values(11,'2003-01-01','Mysore Road'),(12,'2004-02-02','South End Circle'),(13,'2003-01-21','Bull temple Road'),(14,'2008-02-01','Mysore Road'),(15,'2005-03-04','Kanakpura Road');
   insert into OWNS
  values('A01','KA052250'),('A02','KA031181'),('A03','KA095477'),('A04','KA053408'),('A05','KA041702');
  insert into PARTICIPATED
  values('A01','KA052250',11,10000),('A02','KA031181',12,50000),('A03','KA095477',13,25000),('A04','KA053408',14,3000),('A05','KA041702',15,5000);
  select *from PERSON;
  select *from CAR;
  select *from ACCIDENT;
  select *from OWNS;
  select *from PARTICIPATED;
  select accident_date,location
  from ACCIDENT;
  select driver_id
  from PARTICIPATED
  where damage_amount>=25000;
  
  