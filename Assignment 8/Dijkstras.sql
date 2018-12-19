create table graph (source int, target int, weight int);

insert into graph values (0,1,2),
(1,0,2),
(0,4,10),
(4,0,10),
(1,3,3),
(3,1,3),
(1,4,7),
(4,1,7),
(2,3,4),
(3,2,4),
(3,4,5),
(4,3,5),
(4,2,6),
(2,4,6);


create or replace function Dijkstra(s integer)
returns table(target int, distancetotarget int) as
$$
declare
n int;
t int;
w int;
tempweight int;
c int;
i int;
begin

drop table if exists distance;
create table distance(node int,shortestdistance int);

drop table if exists visited;
create table visited(node int);

insert into distance ((select distinct g.source,2147483647 from graph g) union (select distinct g.target,2147483647 from graph g));

update distance d set shortestdistance = 0 where d.node = s;

select distinct count(*) into c from distance; 
c := c-1;

for i in 1..c
loop
	select q. node into n from (select * from distance d where not exists (select (1) from visited v where v.node = d.node))q
	where q.shortestdistance <= all(select d.shortestdistance from distance d where not exists (select (1) from visited v where v.node = d.node));

	insert into visited values (n);

	for t,w in (select g.target,g.weight from graph g where g.source = n)
	loop
		select d.shortestdistance into tempweight from distance d where d.node = n;
		tempweight := tempweight + w;
		if tempweight < (select d.shortestdistance from distance  d where d.node = t) then
			update distance set shortestdistance = tempweight where node = t;
		end if;
	end loop;  
end loop;

return query select * from distance order by node;

end;
$$ language 'plpgsql';

select * from Dijkstra(0);
