create database Employe_1BM21CS071;
use Employe_1BM21CS071;
create table DEPT
(
 DEPTNO int,
 DNAME varchar(50),
 DLOC varchar(50),
 primary key (DEPTNO)
 );
 
 create table EMPLOYEE
 (
   EMPNO int,
   ENAME varchar(50),
   MGR_NO int,
   HIREDATE date,
   SAL int,
   DEPTNO int,
   Primary key (EMPNO),
   Foreign Key(DEPTNO) references DEPT(DEPTNO)
   );

create table PROJECT
(
  PNO int,
  PLOC varchar(50),
  PNAME varchar(50),
  primary key(PNO)
  );

create table ASSIGNED_TO
(
 EMPNO int,
 PNO int,
 JOB_ROLE varchar(50),
 primary key(EMPNO,PNO),
 Foreign Key(EMPNO) references EMPLOYEE(EMPNO),
 Foreign Key(PNO) references PROJECT(PNO)
 );

create table INCENTIVES
(
  EMPNO int,
  INCENTIVE_DATE date,
  INCENTIVE_AMOUNT int,
  primary key(EMPNO,INCENTIVE_DATE),
   Foreign Key(EMPNO) references EMPLOYEE(EMPNO)
  );
 
insert into DEPT
values(1,"Sales","Bangalore"),
      (2,"Marketing","Mysore"),
      (3,"Resource","Hyderabad"),
      (4,"Production","Bangalore"),
      (5,"Information","Mumbai"),
      (6,"Security","Delhi");
	
insert into EMPLOYEE
values (11,"Mohan",12,"2000-06-18",60000,1),
	   (12,"Avinash",20,"2000-02-17",80000,1),      
       (13,"Nikil",20,"2000-05-05",80000,3),
       (14,"Ravi",13,"2000-10-20",80000,3),
       (15,"Ram",20,"2000-06-06",70000,2),
       (16,"Siri",15,"2000-05-20",60000,2),
       (17,"Seetha",20,"2000-06-16",70000,4),
       (18,"Mohana",17,"2000-10-10",50000,4),
       (19,"Sam",17,"2000-11-12",50000,4),
       (20,"Keerthi",NULL ,"2000-01-01",90000,5);
       
insert into PROJECT
values(1,"Bangalore","Sales_report"),
	  (2,"Bangalore","Production_report"),
      (3,"Mumbai","Survey_report"),
      (4,"Mysore","Infographics"),
      (5,"Delhi","Data_security"),
      (6,"Mysore","Advertisement");
      
insert into ASSIGNED_TO
values(11,1,"Associate"),
       (15,4 ,"Assistant"),
       (16,4,"Assistant"),
       (18,2,"Assistant"),
       (19,2,"Associate"),
       (20,5,"Manager");
       
insert into INCENTIVES
values(20,"2006-06-09",5000),
       (15,"2005-05-10",3000),
       (12,"2005-01-01",4000),
       (17,"2005-02-01",4000),
       (18,"2005-03-02",1000);
       
select EMPNO
from EMPLOYEE
where EMPNO IN (select EMPNO
           from ASSIGNED_TO
           where PNO in (select PNO
					     from PROJECT
                         where PLOC IN ("Bangalore","Hydrebad","Mysore")));
                         
select EMPNO
from EMPLOYEE E
where E.EMPNO NOT IN (select I.EMPNO
                       from INCENTIVES I);
                       
select E.ENAME, E.EMPNO, D.DEPTNO, A.JOB_ROLE, D.DLOC
from  EMPLOYEE E,DEPT D,PROJECT P,ASSIGNED_TO A
where P.PNO=A.PNO and E.EMPNO=A.EMPNO and E.DEPTNO=D.DEPTNO and P.PLOC=D.DLOC;