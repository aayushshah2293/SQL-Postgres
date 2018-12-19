create table graph(source int, target int);

insert into graph values (0,1),(1,0),(1,2),(2,1),(2,3),(3,2),(2,0),(0,2),(3,0),(0,3);

create or replace function threeColourable()
returns boolean as
$$
declare 
v int;
final boolean;
begin

final := true;

drop table if exists color;
create table color(vertex int, color int);

insert into color ((select distinct source,0 from graph) union (select target,0 from graph));

if not(select graphColoringUntil(0)) then
final := false;
end if;

return final;
	
end;
$$ language 'plpgsql';

create or replace function graphColoringUntil(v int)
returns boolean as
$$
declare
c int;
begin

if v = (select count(*) from color) then
return true;
end if;


for c in 1..3
loop
	
	if (select isSafe(v,c)) then
		update color set color = c where vertex = v;
		if(graphColoringUntil(v+1)) then
			return true;
		end if;
		update color set color = 0 where vertex = v;
	end if;
end loop;

return false;

end;
$$ language 'plpgsql';

create or replace function isSafe(v int,c int)
returns bool as
$$
declare
x int;
begin
	for x in ((select target from graph where source = v) union (select source from graph where target = v))
	loop
		if (select color from color where vertex = x) = c then
			return false;
		end if;
	end loop;
	return true;
end;
$$language 'plpgsql';

select * from threeColourable();
