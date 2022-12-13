use Employe_1BM21CS071;
select m.ENAME,count(*)
from EMPLOYEE e,EMPLOYEE m
where e.MGR_NO=m.EMPNO
group by m.ENAME
having count(*)=(select MAX(mycount)
				from(select count(*) mycount
                      from EMPLOYEE
                       group by MGR_NO)a);
		
select m.ENAME
from EMPLOYEE m
where SAL>(select avg(e.SAL)
           from EMPLOYEE e
           where m.EMPNO=e.MGR_NO
           group by MGR_NO);
           
insert into INCENTIVES
values(16,"2005-01-15",3000);

select * from INCENTIVES;

select *
from EMPLOYEE e,INCENTIVES i
where e.EMPNO=i.EMPNO and   1=(select count(*)
		                     from INCENTIVES j
							 where i.INCENTIVE_AMOUNT<j.INCENTIVE_AMOUNT
							 );
							

				
          