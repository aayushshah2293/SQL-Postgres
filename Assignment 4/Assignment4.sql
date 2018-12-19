CREATE DATABASE aaymshah_adc_4;

\c aaymshah_adc_4;

CREATE TABLE Student(
Sid INTEGER,
Sname VARCHAR(15),
PRIMARY KEY (SID));

CREATE TABLE Major(
Sid INTEGER,
Major VARCHAR(15),
FOREIGN KEY (Sid) REFERENCES Student(SID));

CREATE TABLE Book(
BookNo INTEGER,
Title VARCHAR(30),
Price INTEGER,
PRIMARY KEY (BookNo));

CREATE TABLE Cites(
BookNo INTEGER,
CitedBookNo INTEGER,
PRIMARY KEY (BookNo, CitedBookNo),
FOREIGN KEY (BookNo) REFERENCES Book(BookNo),
FOREIGN KEY (CitedBookNo) REFERENCES Book(BookNo));

CREATE TABLE Buys(
Sid INTEGER,
BookNo INTEGER,
PRIMARY KEY (Sid,BookNo),
FOREIGN KEY (Sid) REFERENCES Student(SID),
FOREIGN KEY (BookNo) REFERENCES Book(BookNo));

INSERT INTO Student(Sid, Sname) VALUES (1001, 'Jean');
INSERT INTO Student(Sid, Sname) VALUES (1002, 'Maria');
INSERT INTO Student(Sid, Sname) VALUES (1003, 'Anna' );
INSERT INTO Student(Sid, Sname) VALUES (1004, 'Chin' );
INSERT INTO Student(Sid, Sname) VALUES (1005, 'John' );
INSERT INTO Student(Sid, Sname) VALUES (1006, 'Ryan');
INSERT INTO Student(Sid, Sname) VALUES (1007, 'Catherine' );
INSERT INTO Student(Sid, Sname) VALUES (1008, 'Emma' );
INSERT INTO Student(Sid, Sname) VALUES (1009, 'Jan' );
INSERT INTO Student(Sid, Sname) VALUES (1010, 'Linda');
INSERT INTO Student(Sid, Sname) VALUES (1011, 'Nick' );
INSERT INTO Student(Sid, Sname) VALUES (1012, 'Eric' );
INSERT INTO Student(Sid, Sname) VALUES (1013, 'Lisa' );
INSERT INTO Student(Sid, Sname) VALUES (1014, 'Filip');
INSERT INTO Student(Sid, Sname) VALUES (1015, 'Dirk' );
INSERT INTO Student(Sid, Sname) VALUES (1016, 'Mary' );
INSERT INTO Student(Sid, Sname) VALUES (1017, 'Ellen' );
INSERT INTO Student(Sid, Sname) VALUES (1020, 'Greg' );
INSERT INTO Student(Sid, Sname) VALUES (1022, 'Qin' );
INSERT INTO Student(Sid, Sname) VALUES (1023, 'Melanie' );
INSERT INTO Student(Sid, Sname) VALUES (1040, 'Pam');

INSERT INTO Major(Sid, Major) VALUES (1001,  'Math');
INSERT INTO Major(Sid, Major) VALUES (1001,  'Physics');
INSERT INTO Major(Sid, Major) VALUES (1002,  'CS');
INSERT INTO Major(Sid, Major) VALUES (1002,  'Math');
INSERT INTO Major(Sid, Major) VALUES (1003,  'Math');
INSERT INTO Major(Sid, Major) VALUES (1004,  'CS');
INSERT INTO Major(Sid, Major) VALUES (1006,  'CS');
INSERT INTO Major(Sid, Major) VALUES (1007,  'CS');
INSERT INTO Major(Sid, Major) VALUES (1007,  'Physics');
INSERT INTO Major(Sid, Major) VALUES (1008,  'Physics');
INSERT INTO Major(Sid, Major) VALUES (1009,  'Biology');
INSERT INTO Major(Sid, Major) VALUES (1010,  'Biology');
INSERT INTO Major(Sid, Major) VALUES (1011,  'CS');
INSERT INTO Major(Sid, Major) VALUES (1011,  'Math');
INSERT INTO Major(Sid, Major) VALUES (1012,  'CS');
INSERT INTO Major(Sid, Major) VALUES (1013,  'CS');
INSERT INTO Major(Sid, Major) VALUES (1013,  'Psychology');
INSERT INTO Major(Sid, Major) VALUES (1014,  'Theater');
INSERT INTO Major(Sid, Major) VALUES (1017,  'Anthropology');
INSERT INTO Major(Sid, Major) VALUES (1022,  'CS');
INSERT INTO Major(Sid, Major) VALUES (1015,  'Chemistry');

INSERT INTO Book(BookNo, Title, Price) VALUES (2001, 'Databases',40);
INSERT INTO Book(BookNo, Title, Price) VALUES (2002, 'OperatingSystems',25);
INSERT INTO Book(BookNo, Title, Price) VALUES (2003, 'Networks',20);
INSERT INTO Book(BookNo, Title, Price) VALUES (2004, 'AI',45);
INSERT INTO Book(BookNo, Title, Price) VALUES (2005, 'DiscreteMathematics',20);
INSERT INTO Book(BookNo, Title, Price) VALUES (2006, 'SQL',25);
INSERT INTO Book(BookNo, Title, Price) VALUES (2007, 'ProgrammingLanguages',15);
INSERT INTO Book(BookNo, Title, Price) VALUES (2008, 'DataScience',50);
INSERT INTO Book(BookNo, Title, Price) VALUES (2009, 'Calculus',10);
INSERT INTO Book(BookNo, Title, Price) VALUES (2010, 'Philosophy',25);
INSERT INTO Book(BookNo, Title, Price) VALUES (2012, 'Geometry',80);
INSERT INTO Book(BookNo, Title, Price) VALUES (2013, 'RealAnalysis',35);
INSERT INTO Book(BookNo, Title, Price) VALUES (2011, 'Anthropology',50);
INSERT INTO Book(BookNo, Title, Price) VALUES (2014, 'Topology',70);

INSERT INTO Cites(BookNo, CitedBookNo) VALUES (2012,2001);
INSERT INTO Cites(BookNo, CitedBookNo) VALUES (2008,2011);
INSERT INTO Cites(BookNo, CitedBookNo) VALUES (2008,2012);
INSERT INTO Cites(BookNo, CitedBookNo) VALUES (2001,2002);
INSERT INTO Cites(BookNo, CitedBookNo) VALUES (2001,2007);
INSERT INTO Cites(BookNo, CitedBookNo) VALUES (2002,2003);
INSERT INTO Cites(BookNo, CitedBookNo) VALUES (2003,2001);
INSERT INTO Cites(BookNo, CitedBookNo) VALUES (2003,2004);
INSERT INTO Cites(BookNo, CitedBookNo) VALUES (2003,2002);
INSERT INTO Cites(BookNo, CitedBookNo) VALUES (2010,2001);
INSERT INTO Cites(BookNo, CitedBookNo) VALUES (2010,2002);
INSERT INTO Cites(BookNo, CitedBookNo) VALUES (2010,2003);
INSERT INTO Cites(BookNo, CitedBookNo) VALUES (2010,2004);
INSERT INTO Cites(BookNo, CitedBookNo) VALUES (2010,2005);
INSERT INTO Cites(BookNo, CitedBookNo) VALUES (2010,2006);
INSERT INTO Cites(BookNo, CitedBookNo) VALUES (2010,2007);
INSERT INTO Cites(BookNo, CitedBookNo) VALUES (2010,2008);
INSERT INTO Cites(BookNo, CitedBookNo) VALUES (2010,2009);
INSERT INTO Cites(BookNo, CitedBookNo) VALUES (2010,2011);
INSERT INTO Cites(BookNo, CitedBookNo) VALUES (2010,2013);
INSERT INTO Cites(BookNo, CitedBookNo) VALUES (2010,2014);

INSERT INTO Buys(Sid,BookNo) VALUES (1023, 2012);
INSERT INTO Buys(Sid,BookNo) VALUES (1023, 2014);
INSERT INTO Buys(Sid,BookNo) VALUES (1040, 2002);
INSERT INTO Buys(Sid,BookNo) VALUES (1001, 2002);
INSERT INTO Buys(Sid,BookNo) VALUES (1001, 2007);
INSERT INTO Buys(Sid,BookNo) VALUES (1001, 2009);
INSERT INTO Buys(Sid,BookNo) VALUES (1001, 2011);
INSERT INTO Buys(Sid,BookNo) VALUES (1001, 2013);
INSERT INTO Buys(Sid,BookNo) VALUES (1002, 2001);
INSERT INTO Buys(Sid,BookNo) VALUES (1002, 2002);
INSERT INTO Buys(Sid,BookNo) VALUES (1002, 2007);
INSERT INTO Buys(Sid,BookNo) VALUES (1002, 2011);
INSERT INTO Buys(Sid,BookNo) VALUES (1002, 2012);
INSERT INTO Buys(Sid,BookNo) VALUES (1002, 2013);
INSERT INTO Buys(Sid,BookNo) VALUES (1003, 2002);
INSERT INTO Buys(Sid,BookNo) VALUES (1003, 2007);
INSERT INTO Buys(Sid,BookNo) VALUES (1003, 2011);
INSERT INTO Buys(Sid,BookNo) VALUES (1003, 2012);
INSERT INTO Buys(Sid,BookNo) VALUES (1003, 2013);
INSERT INTO Buys(Sid,BookNo) VALUES (1004, 2006);
INSERT INTO Buys(Sid,BookNo) VALUES (1004, 2007);
INSERT INTO Buys(Sid,BookNo) VALUES (1004, 2008);
INSERT INTO Buys(Sid,BookNo) VALUES (1004, 2011);
INSERT INTO Buys(Sid,BookNo) VALUES (1004, 2012);
INSERT INTO Buys(Sid,BookNo) VALUES (1004, 2013);
INSERT INTO Buys(Sid,BookNo) VALUES (1005, 2007);
INSERT INTO Buys(Sid,BookNo) VALUES (1005, 2011);
INSERT INTO Buys(Sid,BookNo) VALUES (1005, 2012);
INSERT INTO Buys(Sid,BookNo) VALUES (1005, 2013);
INSERT INTO Buys(Sid,BookNo) VALUES (1006, 2006);
INSERT INTO Buys(Sid,BookNo) VALUES (1006, 2007);
INSERT INTO Buys(Sid,BookNo) VALUES (1006, 2008);
INSERT INTO Buys(Sid,BookNo) VALUES (1006, 2011);
INSERT INTO Buys(Sid,BookNo) VALUES (1006, 2012);
INSERT INTO Buys(Sid,BookNo) VALUES (1006, 2013);
INSERT INTO Buys(Sid,BookNo) VALUES (1007, 2001);
INSERT INTO Buys(Sid,BookNo) VALUES (1007, 2002);
INSERT INTO Buys(Sid,BookNo) VALUES (1007, 2003);
INSERT INTO Buys(Sid,BookNo) VALUES (1007, 2007);
INSERT INTO Buys(Sid,BookNo) VALUES (1007, 2008);
INSERT INTO Buys(Sid,BookNo) VALUES (1007, 2009);
INSERT INTO Buys(Sid,BookNo) VALUES (1007, 2010);
INSERT INTO Buys(Sid,BookNo) VALUES (1007, 2011);
INSERT INTO Buys(Sid,BookNo) VALUES (1007, 2012);
INSERT INTO Buys(Sid,BookNo) VALUES (1007, 2013);
INSERT INTO Buys(Sid,BookNo) VALUES (1008, 2007);
INSERT INTO Buys(Sid,BookNo) VALUES (1008, 2011);
INSERT INTO Buys(Sid,BookNo) VALUES (1008, 2012);
INSERT INTO Buys(Sid,BookNo) VALUES (1008, 2013);
INSERT INTO Buys(Sid,BookNo) VALUES (1009, 2001);
INSERT INTO Buys(Sid,BookNo) VALUES (1009, 2002);
INSERT INTO Buys(Sid,BookNo) VALUES (1009, 2011);
INSERT INTO Buys(Sid,BookNo) VALUES (1009, 2012);
INSERT INTO Buys(Sid,BookNo) VALUES (1009, 2013);
INSERT INTO Buys(Sid,BookNo) VALUES (1010, 2001);
INSERT INTO Buys(Sid,BookNo) VALUES (1010, 2002);
INSERT INTO Buys(Sid,BookNo) VALUES (1010, 2003);
INSERT INTO Buys(Sid,BookNo) VALUES (1010, 2011);
INSERT INTO Buys(Sid,BookNo) VALUES (1010, 2012);
INSERT INTO Buys(Sid,BookNo) VALUES (1010, 2013);
INSERT INTO Buys(Sid,BookNo) VALUES (1011, 2002);
INSERT INTO Buys(Sid,BookNo) VALUES (1011, 2011);
INSERT INTO Buys(Sid,BookNo) VALUES (1011, 2012);
INSERT INTO Buys(Sid,BookNo) VALUES (1012, 2011);
INSERT INTO Buys(Sid,BookNo) VALUES (1012, 2012);
INSERT INTO Buys(Sid,BookNo) VALUES (1013, 2001);
INSERT INTO Buys(Sid,BookNo) VALUES (1013, 2011);
INSERT INTO Buys(Sid,BookNo) VALUES (1013, 2012);
INSERT INTO Buys(Sid,BookNo) VALUES (1014, 2008);
INSERT INTO Buys(Sid,BookNo) VALUES (1014, 2011);
INSERT INTO Buys(Sid,BookNo) VALUES (1014, 2012);
INSERT INTO Buys(Sid,BookNo) VALUES (1017, 2001);
INSERT INTO Buys(Sid,BookNo) VALUES (1017, 2002);
INSERT INTO Buys(Sid,BookNo) VALUES (1017, 2003);
INSERT INTO Buys(Sid,BookNo) VALUES (1017, 2008);
INSERT INTO Buys(Sid,BookNo) VALUES (1017, 2012);
INSERT INTO Buys(Sid,BookNo) VALUES (1020, 2001);
INSERT INTO Buys(Sid,BookNo) VALUES (1020, 2012);
INSERT INTO Buys(Sid,BookNo) VALUES (1022, 2014);


\! echo Q1
CREATE TABLE W (A INTEGER, B VARCHAR(5));

INSERT INTO W VALUES (1,'John'), (2,'Ellen'), (3,'Ann');

(select distinct w1.a from w as w1 inner join w as w2 on (w1.a = w2.a and w1.b <> w2.b))
 union
( (select a from w)
except
(select distinct w3.a
from w as w3, (w as w1 inner join w as w2 on  w1.a = w2.a and w1.b <> w2.b)));

drop table w;

\! echo Q2 - a
with students_baught_cited_book as
(select distinct sid
from cites  natural join buys)

select sid,sname
from student natural join students_baught_cited_book; 

\! echo Q2 - b
select sid,sname
from student natural join (select distinct m1.sid
from major m1 inner join major m2 on (m1.sid = m2.sid and m1.major<>m2.major)) as q;

\! echo Q2 - c
(select sid from buys)
except
(select distinct bs1.sid from buys bs1 inner join buys bs2 on (bs1.sid = bs2.sid and bs1.bookno <> bs2.bookno));

\! echo Q2 - d
with without_least_amount as 
(select distinct b.bookno,b.title,b.price
from book b,book b1
where NOT(b.price <= b1.price))

(select bookno,title
from without_least_amount)
except
(select w.bookno,w.title
from without_least_amount w, without_least_amount w1
where NOT(w.price <= w1.price));

\! echo Q2 - e
with book_join_student as
(select *
from (select sid from student where sid = 1001) as q1 cross join (select bookno from book) AS q2),

not_only as 
(select distinct bookno
from ((select *
from buys)
except
(select *
from book_join_student b1)) as q3)

select b.bookno, b.title
from ((select bookno from book) except (select * from not_only)) as F, book b
where b.bookno = f.bookno;

\! echo Q2 - f
with student_bought_lessthan as 
(select bs.sid,bs.bookno
from buys bs natural join  (select bookno from book b where b.price < 50) as Q)

select distinct s1.sid, s.sname
from (student_bought_lessthan s1 inner join student_bought_lessthan s2 on (s1.sid = s2.sid and s1.bookno <> s2.bookno)) inner join student s on s.sid = s1.sid;

\! echo Q2 - g
with student_major_cs as
(select sid from major where major = 'CS'),

csmajor_cross_join_book as 
(select * from student_major_cs cross join (select bookno from book) as q)

select distinct bookno from 
((select * from csmajor_cross_join_book)
except
(select * from buys)) as q;

\! echo Q2 - h
(select distinct bookno
from book)
except	
(select c.citedbookno
from cites c natural join book b
where b.price > 50);

\! echo Q2 - i
with books_less_than as 
(select b.bookno
from book b
where b.price < 30),

student_cross_join_books_lessthan as 
(select *
from (select sid from student) as q cross join books_less_than)

select distinct sid from
(select * from buys
except
select * from student_cross_join_books_lessthan) as q;

\! echo Q2 - j
with e1 as(
select *
from buys cross join (select bookno as citedbookno from book) as q),
e2 as(
select bs.sid,bs.bookno,c.citedbookno
from buys bs inner join cites c on bs.bookno = c.bookno)

select count(1) from (select distinct sid,citedbookno from
(select  * from e1 except select  * from e2) as q)as q1;

\! echo Q2 - k
with e1 as
(select bs.sid,bs.bookno from buys bs inner join (select * from major m where m.major = 'CS') as m on  bs.sid = m.sid),


e2 as
(select * from (select bs.bookno,bs.sid from e1 bs) as q1 cross join (select bookno as bbookno from book) as q),

e3 as
(select * from (select bookno as bbookno from book) as q1 cross join e1),

e4 as
((select * from e2)
except
(select * from e3)),

e5 as 
((select * from e3)
except
(select * from e2)),

e6 as 
(select bbookno,bookno from (select * from e4 union select * from e5) as q),

e7 as (
select b1.bookno, b2.bookno from book b1 inner join book b2 on b1.bookno <> b2.bookno)

select distinct * from (select * from e7 except select * from e6) as q;


\! echo Q2 - l
with e1 as
(select * from buys cross join (select sid from student) as q),

e2 as
(select * from (select sid as ssid from student) as q1 cross join (select bs.bookno,bs.sid from buys bs) as q),

e3 as (
select ssid,sid from (select * from e2 except select * from e1) as q),

e4 as (
select s1.sid, s2.sid from student s1 inner join student s2 on s1.sid <> s2.sid)

select count(1) from (select distinct * from (select * from e4 except select * from e3) as q)as q1;

\! echo Q2 - m
with e1 as(
select c.citedbookno,q.bookno from cites c inner join (select b.bookno from book b) as q on q.bookno <> c.bookno),

e2 as(
select distinct a.citedbookno from e1 as a inner join e1 as b on (a.citedbookno = b.citedbookno and a.bookno <> b.bookno))

select * from (select c.citedbookno from cites c except select * from e2)as q;


\! echo Q3 - a

/* select m.sid, m.major
from major m
where m.sid in (select t.sid
from buys t, book b
where t.bookno = b.bookno and b.price < 20);

translating IN

select distinct m.sid, m.major
from major m, buys t, book b
where t.bookno = b.bookno and b.price < 20 and m.sid = t.sid;

converting to joins */

select distinct m.sid, m.major
from major m inner join (buys t inner join (select * from book b where b.price < 20) as b on t.bookno = b.bookno) as q on m.sid = q.sid;

\! echo Q3 - b

/* select distinct t.sid, b.bookno
from buys t, book b
where t.bookno = b.bookno and
b.price <= ALL (select b1.price
					from buys t1, book b1
					where t1.bookno = b1.bookno and t1.sid = t.sid);

removing where clause
select distinct t.sid, b.bookno
from buys t inner join book b on t.bookno = b.bookno
where b.price <= ALL(select b1.price
						from buys t1 inner join book b1 on t1.bookno = b1.bookno
						where t1.sid = t.sid);
						
converting ALL
select q.sid,q.bookno from 
((select distinct t.sid, b.bookno, b.price
from buys t inner join book b on t.bookno = b.bookno)
except
(select distinct t.sid, b.bookno, b.price
from buys t inner join book b on t.bookno = b.bookno, buys t1 inner join book b1 on t1.bookno = b1.bookno
where t1.sid = t.sid and NOT(b.price <= b1.price)))as q

removing where clause */
select q.sid,q.bookno from 
((select distinct t.sid, b.bookno, b.price
from buys t inner join book b on t.bookno = b.bookno)
except
(select distinct t.sid, b.bookno, b.price
from (buys t inner join book b on t.bookno = b.bookno) inner join  (buys t1 inner join book b1 on t1.bookno = b1.bookno) on t1.sid = t.sid
where NOT(b.price <= b1.price)))as q;

\! echo Q3 - c
/* select b.bookno, b.title
from book b
where 20 <= b.price and b.price <= 40 and
b.bookno in (select c.citedbookno
from cites c);

converting IN
select distinct b.bookno, b.title
from book b, cites c
where 20 <= b.price and b.price <= 40 and b.bookno = c.citedbookno;

removing where clause */
select distinct b.bookno, b.title
from (select * from book b where 20 <= b.price and b.price <= 40) as b inner join cites c on b.bookno = c.citedbookno;

\! echo Q3 - d
/* select s.sid, s.sname
from student s
where s.sid in (select m.sid from major m where m.major = 'CS') AND
		exists (select 1
				from buys t, cites c, book b1, book b2
				where s.sid = t.sid and t.bookno = c.citedbookno and
					c.citedbookno = b1.bookno and c.bookno = b2.bookno and
					b1.price > b2.price);

converting IN
select s.sid, s.sname
from student s, major m
where m.major = 'CS' and s.sid = m.sid and exists (select 1
				from buys t, cites c, book b1, book b2
				where s.sid = t.sid and t.bookno = c.citedbookno and
					c.citedbookno = b1.bookno and c.bookno = b2.bookno and
					b1.price > b2.price);
					
converting exists
select distinct s.sid, s.sname
from student s, major m, buys t, cites c, book b1, book b2
where m.major = 'CS' and s.sid = m.sid and s.sid = t.sid and t.bookno = c.citedbookno and
					c.citedbookno = b1.bookno and c.bookno = b2.bookno and
					b1.price > b2.price;
					
removing join conditions from where clause */
select distinct s.sid, s.sname
from ((((student s inner join (select * from major m where m.major = 'CS') as m on s.sid = m.sid) inner join buys t on s.sid = t.sid) inner join cites c on t.bookno = c.citedbookno) 
 inner join (book b1 inner join book b2 on b1.price > b2.price) on c.citedbookno = b1.bookno and c.bookno = b2.bookno);


\! echo Q3 - e
/* select b.bookno, b.title
from book b
where exists (select m.sid
				from major m
				where m.major = 'CS' and
				m.sid not in(select t.sid
								from buys t
								where t.bookno = b.bookno));
								
converting exists
select distinct b.bookno, b.title
from book b, major m
where m.major = 'CS' and
				m.sid not in(select t.sid
								from buys t
								where t.bookno = b.bookno);
								
taking m.major = cs in from clause
select distinct b.bookno, b.title
from book b, (select * from major m where m.major = 'CS') as m
where m.sid not in(select t.sid
								from buys t
								where t.bookno = b.bookno);
								
converting NOT IN

select distinct q.bookno,q.title from
((select distinct b.bookno, b.title, m.sid
from book b, (select * from major m where m.major = 'CS') as m)
except
(select distinct b.bookno, b.title, m.sid
from book b, (select * from major m where m.major = 'CS') as m, buys t
where t.bookno = b.bookno and m.sid = t.sid)) as q;

converting to joins by removing join condition from where clause */
select distinct q.bookno,q.title from
((select distinct b.bookno, b.title, m.sid
from book b, (select * from major m where m.major = 'CS') as m)
except
(select distinct b.bookno, b.title, m.sid
from book b inner join ((select * from major m where m.major = 'CS') as m inner join buys t on m.sid = t.sid) on t.bookno = b.bookno)) as q;

\! echo Q3 - f
/* select b.bookno, b.title
from book b
where not exists (select s.sid
					from student s
					where s.sid in (select m.sid from major m
									where m.major = 'CS') and
					s.sid in (select m.sid from major m
								where m.major = 'Math') and
					s.sid not in (select t.sid
									from buys t
									where t.bookno = b.bookno));
									
converting not exists
(select b.bookno,b.title
from book b)
except
(select b.bookno,b.title
from book b, student s
where s.sid in (select m.sid from major m
									where m.major = 'CS') and
					s.sid in (select m.sid from major m
								where m.major = 'Math') and
					s.sid not in (select t.sid
									from buys t
									where t.bookno = b.bookno));
									
converting first in
(select b.bookno,b.title
from book b)
except
(select distinct b.bookno,b.title
from book b, student s, major m
where m.major = 'CS' and s.sid = m.sid and
					s.sid in (select m.sid from major m
								where m.major = 'Math') and
					s.sid not in (select t.sid
									from buys t
									where t.bookno = b.bookno));
									
converting second in
(select b.bookno,b.title
from book b)
except
(select distinct b.bookno,b.title
from book b, student s, major m, major m1
where m.major = 'CS' and s.sid = m.sid and m1.major = 'Math' and s.sid = m1.sid and s.sid not in (select t.sid
									from buys t
									where t.bookno = b.bookno));

converting not in
(select b.bookno,b.title
from book b)
except
(select q.bookno,q.title from
((select distinct b.bookno,b.title,b.price,s.sid,s.sname,m.sid,m.major,m1.sid,m1.major
from book b, student s, major m, major m1
where m.major = 'CS' and s.sid = m.sid and m1.major = 'Math' and s.sid = m1.sid)
except
(select distinct b.bookno,b.title,b.price,s.sid,s.sname,m.sid,m.major,m1.sid,m1.major
from book b, student s, major m, major m1, buys t
where m.major = 'CS' and s.sid = m.sid and m1.major = 'Math' and s.sid = m1.sid and t.bookno = b.bookno and s.sid = t.sid))as q);

moving conditions in where clause to from clause */
select q1.bookno, q1.title from
((select b.bookno,b.title,b.price
from book b)
except
(select q.bookno,q.title,q.price from
((select distinct b.bookno,b.title,b.price,s.sid,s.sname,m.major
from book b, (student s inner join (select * from major m where m.major = 'CS') as m on s.sid = m.sid) 
inner join (select * from major m1 where m1.major = 'Math') as m1 on s.sid = m1.sid)
except
(select distinct b.bookno,b.title,b.price,s.sid,s.sname,m.major
from (book b inner join buys t on t.bookno = b.bookno) inner join (student s inner join (select * from major m where m.major = 'CS') as m on s.sid = m.sid
inner join (select * from major m1 where m1.major = 'Math') as m1 on s.sid = m1.sid) on s.sid = t.sid))as q))as q1;

\c postgres;


DROP DATABASE aaymshah_adc_4;