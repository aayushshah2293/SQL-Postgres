create table partSubPart(pid int, sid int, quantity int);
create table basicPart(pid int,weight int);

insert into partSubPart values (1,2,4),
(1,3,1),
(3,4,1),
(3,5,2);

insert into basicPart values (2,5),(4,50),(5,3);

create or replace function aggregatedWeight(p int)
returns int as 
$$
declare
weight int;
s int;
q int;

begin
weight := 0;
if exists(select * from basicPart b where b.pid = p) then
select b.weight into weight from basicPart b where b.pid = p;

else
for s,q in select ps.sid,ps.quantity from partSubPart ps where ps.pid = p
loop
	select (aggregatedWeight(s) * q) + weight into weight;
end loop;
end if;
return weight;
end;
$$ language 'plpgsql';

select * from aggregatedWeight(1);
