use INSURANCE_1BM21CS071;
select *from PARTICIPATED;
update PARTICIPATED
set damage_amoun=25000
where report_num=12 and reg_num=KA031181;

select *from CAR;
select reg_num,model,m_year
from CAR
order by m_year asc;

select *from ACCIDENT;
insert into ACCIDENT
values(16,"2006-04-05","Magadi Road");

select count(CAR.reg_num)
from PARTICIPATED,CAR
where CAR.model="LANCER" and CAR.reg_num=PARTICIPATED.reg_num;

select count(p.driver_id)
from PARTICIPATED p,ACCIDENT a
where p.report_num=a.report_num and accident_date like "2008%";

select AVG(damage_amount)
from PARTICIPATED;

delete from PARTICIPATED
where damage_amount<13600.0000;