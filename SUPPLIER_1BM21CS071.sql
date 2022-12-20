create database Supplier_1BM21CS071;
use Supplier_1BM21CS071;
create table Supplier
(
  sid int,
  sname varchar(50),
  city varchar(50),
  primary key(sid)
  );
  
  create table Parts
(
  pid int,
  pname varchar(50),
  color varchar(50),
  primary key(pid)
  );
  
  create table Catalog
  (
   sid int,
   pid int,
   cost int,
   primary key(sid,pid),
   foreign key(sid) references Supplier(sid),
   foreign key(pid) references Parts(pid)
   );
   
   insert into Supplier
   values(10001,"Acme Widget","Bangalore"),
         (10002,"Johns","Kolkata"),
         (10003,"Vimal","Mumbai"),
         (10004,"Reliance","Delhi"),
		 (10005,"Mahindra","Mumbai");

insert into Parts
values(20001,"Book","Red"),
      (20002,"Pen","Red"),
      (20003,"Pencil","Green"),
      (20004,"Mobile","Green"),
      (20005,"Charger","Black");
      
insert into Catalog
values(10001,20001,10),
	   (10001,20002,10),
       (10001,20003,30),
       (10001,20004,10),
       (10001,20005,10),
       (10002,20001,10),
       (10002,20002,20),
       (10003,20003,30),
       (10004,20003,40);
       
select p.pname
from Parts p
where p.pid In (select c.pid
                 from Catalog c);

select s.sname
from Supplier s
where s.sid In ( select c.sid 
                 from Catalog c
                 where c.pid In ( select p.pid
								  from Parts p
                                  where color="Red"));
                                  
select s.sname
from Supplier s
where ((select count(p.pid)
		 from Parts p)    =   (select count(c.pid)
                               from Catalog c
                               where c.sid=s.sid));
                               
Select DISTINCT c.sid
from Catalog c
where c.cost > (select avg(c1.cost)
                from Catalog c1
                where c1.pid=c.pid);
                
select DISTINCT s.sname
from Supplier s,Parts p,Catalog c
where s.sid=c.sid and p.pid=c.pid and c.cost = (select max(c1.cost)
                                                 from Catalog c1
                                                 where c1.pid=p.pid);
                                                 
                                                 
select DISTINCT p.pname
from Parts p,Catalog c,Supplier s
where p.pid=c.pid and c.sid=s.sid and s.sname="Acme Widget" and NOt exists ( select *
																			from Catalog c1,Supplier s1
                                                                            where p.pid=c1.pid and c1.sid=s1.sid and s1.sname<>"Acme Widget");
                                                              
                
                                  



   
   
   
   

   