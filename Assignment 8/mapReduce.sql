\! echo --- Q10 (a)

create table R(A int,B int);

insert into R values (1,2),(1,4),(5,6),(5,8),(9,0);

with
mapper as 
(select r.a as key,r.a as value from r),

group_phase as 
(select key,array_agg(value) as values from mapper group by key),

reducer as 
(select distinct key,value from group_phase g, unnest(g.values) as value)

select value as a from reducer;

drop table r;

\! echo --- Q10 (b)

create table r(a int);
create table s(a int);

insert into r values (1),(2),(3),(4),(5);
insert into s values (1),(2),(3);

create or replace function mapper(a int, t int)
returns table(key int, t int) as
$$
select a,t;
$$ language 'sql';

create or replace function reducer(t int[])
returns bool as 
$$
select 0 = any(t);
$$ language 'sql';

with map_output as 
(select key,t from r,mapper(r.a,1)
union
select key,t from s,mapper(s.a,0)),

group_phase as 
(select key,array_agg(t) as t from map_output group by key),

reducer_output as
(select key from group_phase where not reducer(t))

select * as a from reducer_output;

drop table r;
drop table s;
drop function mapper;
drop function reducer;

\! echo --- Q10 (c)

create table r (a int, b int);
create table s (b int, c int);

insert into r values (1,2), (3,4),(5,6),(7,8),(9,0);
insert into s values (2,3), (4,5),(6,7);

create type rec as (val int,t text);

create or replace function mapper(key int, value int, t text)
returns table(key int,val rec) as
$$
select key,row(value,t)::rec;
$$ language 'sql';

create or replace function reducer(key int, val rec[])
returns table(b int,a int,c int) as
$$
with a_R as
(select r.val from unnest(val) as r where r.t = 'R'),

c_S as 
(select r.val from unnest(val) as r where r.t = 'S')

select key,r.val,s.val from a_R as r,c_S as s;
$$ language 'sql';

with map_output as 
(select key,val from r,mapper(r.b,r.a,'R')
union
select key,val from s,mapper(s.b,s.c,'S')),

group_phase as 
(select key,array_agg(val) as val from map_output group by key),

reducer_output as
(select a,b,c from group_phase g,reducer(g.key,g.val))

select * from reducer_output;

drop table r;
drop table s;
drop function mapper;
drop function reducer;
drop type rec;
