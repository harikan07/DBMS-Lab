create database Student_accomodation;
use Student_accomodation;
create table Student
(
 sid int,
 sname varchar(30),
 school varchar(40),
 s_status varchar(50),
 saddress varchar(50),
 special_needs varchar(50),
 scomments varchar(50),
 DOB date,
 sph_no int,
 gender varchar(50),
 nationality varchar(50),
 primary key(sid)
 );

 create table Apartment
 (
  flat_no int,
  no_of_dor int,
  primary key(flat_no)
  );
  
  create table Dormitory
  (
   dno varchar(2),
   daddress varchar(50),
   bno int,
   flat_no int,
   dplace_no varchar(50),
   Bed_rent real,
   primary key(dplace_no),
   foreign key (flat_no) references Apartment(flat_no)
   );
   
   create table VictoriaHall
   (
    vname varchar(50),
    vaddres varchar(50),
    telno int,
    vmanager varchar(50),
    vplace_no varchar(50),
    v_rent real,
    vroom_no varchar(50),
    primary key(vplace_no)
    );
    
    create table PaymentInvoice
    (
     invoice_no int,
     term varchar(2),
     due_payment real,
     sname varchar(30),
     sid int,
     address varchar(50),
     room_no varchar(50),
     place_no varchar(50),
     primary key(invoice_no),
     foreign key(sid) references Student(sid),
     foreign key(place_no) references Dormitory(dplace_no),
     foreign key(room_no) references VictoriaHall(vplace_no)
     );
     

     create table Inspection
     (
      flat_no int,
	  staff_name varchar(50),
      i_comment varchar(100),
      i_date date,
      Satisfactory_con varchar(50),
      primary key(flat_no),
      foreign key (flat_no) references Apartment(flat_no)
   );
   
   create table Additional_Info
   (
    invoice_no int,
    a_date date,
    paid varchar(50),
    method_of_pay varchar(50),
    f_date_rem varchar(50),
    s_date_rem varchar(50),
    primary key(invoice_no),
    foreign key(invoice_no) references PaymentInvoice(invoice_no)
    );

select * from Student;

    insert into Student 
    values(1,"Avi","BMS","placed","Delhi",NULL,NULL,"2003-09-06",123456789,"Male","Indian"),
          (2,"Anish","BMS","placed","Mumbai",NULL,NULL,"2002-10-06",123456789,"Male","Indian"),
          (3,"Akhila","BMS","placed","Delhi",NULL,NULL,"2003-1-07",123456789,"Female","Indian"),
          (4,"Akash","BMS","placed","Kolkota",NULL,NULL,"2003-09-16",123456789,"Male","Indian"),
          (5,"Anath","BMS","placed","Mysore",NULL,NULL,"2002-09-06",123456789,"Male","Indian");
           
insert into Apartment
values(1,1),
	   (2,1),
       (3,1),
       (4,1),
       (5,1);
       
insert into Dormitory
values("D1","Bangalore",1,1,"DP1",10000),
       ("D2","Bangalore",1,2,"DP2",12000),
       ("D3","Bangalore",1,3,"DP3",14000);
       
insert into VictoriaHall
values("Marry Hall","Bangalore",987654321,"Ayra","VP1",30000,"V1"),
       ("Marry Hall","Bangalore",987654321,"Yathish","VP2",30000,"V1"),
       ("Marry Hall","Bangalore",987654321,"Nikhil","VP3",30000,"V1"),
       ("John Hall","Bangalore",987654321,"Dinesh","VP4",30000,"V2"),
       ("John Hall","Bangalore",987654321,"Deeksha","VP5",30000,"V2");
    
select vname as Hall_Name,vroom_no as Hall_no,count(vname) as no_of_halls
from VictoriaHall
group by vname;

insert into PaymentInvoice
values(1,"T1",5000,"Avi",1,"Delhi","VP1",NULL),
       (2,"T2",3000,"Anish",2,"Mumbai",NULl,"DP1"),
       (3,"T1",8000,"Akhila",3,"Delhi","VP2",NULL),
       (4,"T1",4000,"Akash",4,"Kolkota",NULL,"DP2"),
       (5,"T2",5000,"Ananth",5,"Mysore",NULl,"DP3");

select * from Additional_Info;
insert into Additional_Info
values(1, '2022-01-6 ',"yes","cash",NULL,NULL);

select * from PaymentInvoice;

insert into Inspection
values(1,"Abhiram","Well Maintained","2022-1-06","YES"), 
       (2,"Aruna","Every Bed in Dormitory is Well maintained","2022-1-06","YES"),
       (3,"Anu","Rooms are clean","2022-1-06","YES"),
       (4,"Anu","Rooms are shabby","2022-1-06","NO");
       
select staff_name,i_comment as comments
from Inspection
group by staff_name,flat_no;

update PaymentInvoice
set due_payment=0
where sname="Avi";

select *from PaymentInvoice;