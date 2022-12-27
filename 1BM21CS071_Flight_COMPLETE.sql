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
    eid int,
    aid int,
    primary key(aid,eid),
    foreign key(aid) references Aircraft(aid),
    foreign key(eid) references Employee(eid)
    );
    
    insert into Flight
    values(1,"Bengaluru","New Delhi",500,"6:00:00","9:00:00",5000),
          (2,"Bengaluru","Chennai",300,"7:00:00","8:30:00",3000),
          (3,"Trivandrum","New Delhi",800,"8:00:00","11:30:00",6000),
          (4,"Bengaluru","Frankfurt",10000,"6:00:00","23:30:00",50000),
          (5,"Kolkata","New Delhi",2400,"11:00:00","3:30:00",9000),
          (6,"Bengaluru","Frankfurt",8000,"9:00:00","23:00:00",40000);
          
insert into Aircraft
values(1,"Airbus",2000),
	  (2,"Boeing",700),
      (3,"JetAirways",550),
      (4,"Indigo",5000),
      (5,"Boeing",4500),
      (6,"Airbus",2200);
      
insert into Employee
values(101,"Avinash",50000),
	  (102,"Lokesh",60000),
      (103,"Rakesh",70000),
      (104,"Santhosh",82000),
      (105,"Tilak",5000);
      
insert into Certified
values(101,2),
	  (101,4),
      (101,5),
      (101,6),
      (102,1),
      (102,3),
      (102,5),
      (103,2),
      (103,3),
      (103,5),
      (103,6),
      (104,6),
      (104,1),
      (104,3),
      (105,3);
      
select a.aname
from Employee e,Certified c,Aircraft a
where a.aid=c.aid and e.eid=c.eid and salary>80000;

select e.ename
from Employee e
where e.salary < (select min(price)
				  from Flight
                  where ffrom="Bengaluru" and tto="Frankfurt");

select e.eid,max(a.cruising_range)
from Employee e,Aircraft a,Certified c
where a.aid=c.aid and e.eid=c.eid
Group by c.eid
having count(c.aid)>3;

select a.aid,a.aname,avg(e.salary)
from Aircraft a,Employee e,Certified c
where  a.aid=c.aid and e.eid=c.eid and a.cruising_range>1000
group by a.aid,a.aname;

select distinct e.ename
from Aircraft a,Employee e,Certified c
where  a.aid=c.aid and e.eid=c.eid and a.aname='Boeing';

select distinct a.aid
from Aircraft a
where cruising_range>=(select distance
					    from Flight
                        where ffrom="Bengaluru" and tto="New Delhi");
      
      