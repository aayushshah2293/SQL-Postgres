create table document (doc int, words text[]);

insert into document values (1,array['A','B','E']),
(2,array['B','D']),
(3,array['B','C']),
(4,array['A','B','D']),
(5,array['A','C']),
(6,array['B','C']),
(7,array['A','C']),
(8,array['A','B','C','E']),
(9,array['A','B','C']);


create or replace function calculate_frequency(x text[])
returns bigint as 
$$
select count(*) from document d where x <@ d.words;
$$ language 'sql';


create or replace function frequentSets(t int)
returns table(words text[],frequency int) as 
$$
begin
drop table if exists frequency;
drop table if exists elements;
drop table if exists less_frequent;
create table frequency(words text[],frequency int);
create table elements(word text);
create table less_frequent(words text[]);

insert into elements(
select distinct word
from document d, unnest(d.words) as word
);

insert into frequency(
select array_append('{}',q.word_set),q.frequency 
from (select word as word_set,count(word) as frequency
from document d,unnest(d.words) as word
group by(word))q
where q.frequency >= t);

insert into less_frequent(
select array_append('{}',q.word_set) 
from (select word as word_set,count(word) as frequency
from document d,unnest(d.words) as word
group by(word))q
where q.frequency < t);


while exists(select * from new_sets(t))
loop
	insert into frequency (select * from new_sets(t));
end loop;

return query select * from frequency;
end;
$$ language 'plpgsql';


create or replace function new_sets(t int)
returns table(w text[], freq bigint) as 
$$
declare
word text;
begin
drop table if exists sets;
create table sets(x text[]);
for word in select e.word from elements e
loop
insert into sets(
select q.arr
from (select array_append(f.words,word) as arr from frequency f where word <> all(f.words))q
where not exists (select t.x from sets t where t.x <@ q.arr and q.arr <@ t.x) and 
not exists(select ls.words from less_frequent ls where ls.words <@ q.arr));
end loop;

insert into less_frequent(
select q.x from (select t.x,calculate_frequency(t.x) as freq from sets t )q where q.freq < t);

return query ((select q.x,q.freq from (select t.x,calculate_frequency(t.x) as freq from sets t )q where q.freq >= t)
				except
				(select f.words, f.frequency from frequency f));
end;
$$ language 'plpgsql';

select * from frequentSets(2);
select * from frequentSets(3);
select * from frequentSets(5);