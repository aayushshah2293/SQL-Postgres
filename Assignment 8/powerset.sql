Create table A (x int);
insert into a values (1), (2), (3);

create or replace function supersetof(x int[]) returns 
Table(superet int[]) as 
$$
declare
i integer;
n integer;
d int[];

begin
select count(*) into n from a;

drop table if exists powerset;
create table powerset (y int[]);
insert into powerset values ('{}');


for i in 1..n
loop
	for d in select distinct array_append(p.y,a.x) as arr from a, powerset p where a.x <> all(p.y)
	loop
		if not EXISTS(select p.y from powerset p where p.y <@ d and d <@ p.y)
			then insert into powerset values (d);
		end if;
	end loop;
end loop;
return query select p.y from powerset p where x <@ p.y;
end;
$$ Language 'plpgsql';

select supersetof(array[2,3]);
select supersetof(array[]::integer[]);
