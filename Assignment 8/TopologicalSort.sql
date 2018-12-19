create table graph(s text, t text);
 
 insert into graph values ('5','0'), ('5','2'), ('4','0'), ('4','1'), ('2','3'), ('3','1'); 


create or replace function topologicalSort()
returns table(x text) as
$$
declare
d text;

begin
drop table if exists stack;
drop table if exists visited;
create table stack(id serial, val text);
create table visited(vis text);
for d in ((select distinct g.s from graph g) union (select distinct g.t from graph g))
loop
	if not exists (select v.vis from visited v where v.vis = d)
		then perform top_sort_until(d);
	end if;
end loop;

return query select s.val from stack s order by s.id desc;

end;
$$ language 'plpgsql'; 

create or replace function top_sort_until(d text)
returns void as
$$
declare x text;

begin
insert into visited values (d);

for x in (select g.t from graph g where g.s = d)
loop
	if not exists (select v.vis from visited v where v.vis = x)
		then perform top_sort_until(x);
	end if;

end loop;

insert into stack(val) values (d);

end;
$$ language 'plpgsql';
 
select * from topologicalSort();
