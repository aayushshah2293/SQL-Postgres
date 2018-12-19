create table dataset(p int,x float,y float);
insert into dataset values(1,1,1), (2,1,0),(3,0,2),(4,2,4),(5,3,5);

create or replace function calculate_distance(x1 float,y1 float,x2 float,y2 float)
returns float as
$$
select sqrt(pow((x2-x1),2)+pow((y2-y1),2));
$$ language 'sql';

create or replace function new_centroid_x(k int)
returns float as
$$
declare
x float;
begin
select sum(dt.x)/count(*) into x from distance t, dataset dt where t.id = k and t.p=dt.p;
return x;
end;
$$ language 'plpgsql';

create or replace function new_centroid_y(k int)
returns float as
$$
declare
y float;
begin
select sum(dt.y)/count(*) into y from distance t, dataset dt where t.id = k and t.p=dt.p;
return y;
end;
$$ language 'plpgsql';

create or replace function Kmeans(K int)
returns table(id int,x float,y float) as
$$
declare
c record;
dt record;
it int;
begin
it := 0;

drop table if exists clusters;
create table clusters(id serial,x float,y float);

drop table if exists old_clusters;
create table old_clusters(id int, x float,y float);

drop table if exists distance;
create table distance(p int,dist float,id int);

insert into clusters(x,y)
(select d.x,d.y from dataset d order by random() limit k);

insert into distance
(select distinct d.p,'infinity'::float,0 from dataset d); 

while exists((select * from clusters) except (select * from old_clusters)) and (it < 100)
loop
	for c in select * from clusters  
	loop
		for dt in select * from dataset
		loop
			if (select calculate_distance(c.x,c.y,dt.x,dt.y)) < (select t.dist from distance t where dt.p = t.p) then
				update distance set dist = (select calculate_distance(c.x,c.y,dt.x,dt.y)), id = c.id where p=dt.p;
			end if;
		end loop;
	end loop;
	
	insert into old_clusters (select * from clusters);
	
	for c in select * from clusters
	loop
		update clusters as k set x = new_centroid_x(c.id), y = new_centroid_y(c.id) where k.id = c.id;
	end loop;
	it := it + 1;
end loop;

return query (select * from clusters);
end;
$$ language'plpgsql';

select * from Kmeans(2);
