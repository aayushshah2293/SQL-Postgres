create table graph(source int, target int);

insert into graph values (0,1),(0,3),(1,0),(1,2),(1,3),(1,4),(2,1),(2,4),(3,0),(3,1),(3,4),(4,1),(4,2),(4,3);

create or replace function Hamiltonian()
returns boolean as
$$
declare 
v int;
final boolean;
begin

final := true;

drop table if exists path;
create table path(vertex int, path int);

insert into path ((select distinct source,-1 from graph) union (select target,-1 from graph));

update path set path = 0 where vertex = 0;

if not(select HamCycleUntil(1)) then
final := false;
end if;

return final;
	
end;
$$ language 'plpgsql';

create or replace function HamCycleUntil(pos int)
returns boolean as
$$
declare
v int;
begin

if pos = (select count(*) from path) then
	if exists(select source,target from graph where source = (select path from path where vertex = pos-1) and target = (select path from path where vertex = 0)) then
		return true;
	else
		return false;
	end if;
end if;


for v in 1..(select count(*) from path)
loop
	
	if (select isSafe(v,pos)) then
		update path set path = v where vertex = pos;
		if(HamCycleUntil(pos+1)) then
			return true;
		end if;
		update path set path = -1 where vertex = v;
	end if;
end loop;

return false;

end;
$$ language 'plpgsql';

create or replace function isSafe(v int,pos int)
returns bool as
$$
declare
x int;
begin
	if not exists(select source,target from graph where source = (select path from path where vertex = pos-1) and target = v) then
		return false;
	end if;
	
	for x in (select vertex from path where vertex < pos)
	loop
		if (select path from path where vertex = x) = v then
			return false;
		end if;
	end loop;
	
	return true;
end;
$$language 'plpgsql';

select * from Hamiltonian();
