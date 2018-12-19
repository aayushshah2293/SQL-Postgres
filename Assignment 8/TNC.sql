create table graph(s text,t text);
insert into graph values ('A','B'), ('B','C'), ('B','D'), ('D','E'), ('D','F'), ('E','F'), ('F','C');

create or replace function new_paths(l int)
returns table(s text,t text, len int) as
$$
Begin
return query select q.s,q.t,l as len from (
(select c.s,g.t from (select c1.s,c1.t from connected c1) c inner join graph g on c.t = g.s)
except
(select c.s,c.t from connected c))q;
End;
$$ language plpgsql;

create or replace function paths()
returns void as
$$
declare
len int;
begin
len:=0;
drop table if exists connected;
create table connected (s text,t text,len int);
insert into connected ((select distinct s,s,len from graph) union (select distinct t,t,len from graph));
len := 1;
insert into connected (select s,t,len from graph);
len := len + 1;
while exists (select * from new_paths(len))
loop
	insert into connected (select * from new_paths(len));
	len := len + 1;
end loop;
end;
$$ language plpgsql;

create or replace function connectedByEvenLengthPath()
returns table(s text, t text) as
$$
begin
return query (select c.s,c.t from connected c where len % 2 = 0);
end;
$$ language plpgsql;

create or replace function connectedByOddLengthPath()
returns table(s text, t text) as
$$
begin
return query (select c.s,c.t from connected c where len % 2 <> 0);
end;
$$ language plpgsql;

select paths();
select * from connectedByEvenLengthPath();
select * from connectedByOddLengthPath();