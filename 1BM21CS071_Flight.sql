create database Airline_1BM21CS071;
use Airline_1BM21CS071;
create table Flight
( 
 flno int,
 ffrom varchar(50),
 tto varchar(50),
 distance int,
 depart time,
 arrive time,
 price int,
 primary key (flno)
 );
 
 create table Aircraft
 (
  aid int,
  aname varchar(50),
  cruising_range int,
  primary key(aid)
  );
  
  create table Employee
  (
   eid int,
   ename varchar(50),
   salary real,
   primary key(eid)
   );
   
   create table Certified
   (
    aid int,
    eid int,
    primary key(aid,eid),
    foreign key(aid) references Aircraft(aid),
    foreign key(eid) references Employee(eid)
    );
    
    insert into Flight
    values(1,"Bengaluru","New Delhi",500,"6:00:00","9:00:00",5000),
          (2,"Bengaluru","Chennai",300,"7:00:00","8:30:00",3000),
          (3,"Trivandrum","New Delhi",800,"8:00:00","11:30:00",6000),
          (4,"Bengaluru","Frankfurt",10000,"6:00:00","23:30:00",50000),
          (5,"kolkata","New Delhi",2400,"11:00:00","3:30:00",9000),
          (6,"Bengaluru","Frankfurt",8000,"9:00:00","",);
 