CREATE DATABASE aaymshah_adc_5;

\c aaymshah_adc_5;

CREATE TABLE Student(
Sid INTEGER,
Sname VARCHAR(15),
PRIMARY KEY (SID));

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

/* select distinct s.sid,s.sname, b.bookno, b.title
from student s
	cross join book b
	inner join buys t on ((s.sname = ’Eric’ or s.sname = ’Anna’) and
							s.sid = t.sid and
							b.price > 20 and
							t.bookno = b.bookno);
							
--pushing down selections 

select distinct s.sid,s.sname, b.bookno, b.title
from (select * from student s where s.sname = ’Eric’ or s.sname = ’Anna’) as s
	natural join buys t natural join (select * from book b where b.price > 20) as b;
	
--rewriting projections and joins */
select distinct s.sid,s.sname, b.bookno, b.title
from (select s.sid,s.sname from student s where s.sname = 'Eric' or s.sname = 'Anna') as s
	natural join (select t.sid,t.bookno from buys t) as t natural join (select b.bookno,b.title from book b where b.price > 20) as b;

\! echo Q2

/* select distinct s.sid
from student s
		cross join book b
		inner join buys t on ((s.sname = ’Eric’ or s.sname = ’Anna’) and
								s.sid = t.sid and
								b.price > 20 and
								t.bookno = b.bookno);
								
--pushing down selections
select distinct s.sid
from (select * from student s where s.sname = ’Eric’ or s.sname = ’Anna’) as s 
cross join (select * from book b where b.bookno > 20) as b inner join buys t on ((s.sid = t.sid) and (t.bookno = b.bookno));

select distinct s.sid
from (select * from student s where s.sname = ’Eric’ or s.sname = ’Anna’) as s natural join buys t natural join 
(select * from book b where b.bookno > 20) as b;

 --rewriting projections and joins */
select distinct s.sid
from (select s.sid from student s where s.sname = 'Eric' or s.sname = 'Anna') as s natural join buys t natural join 
(select b.bookno from book b where b.bookno > 20) as b;

\! echo Q3
/* select distinct s.sid, b1.price as b1_price, b2.price as b2_price
from (select s.sid from student s where s.sname <> ’Eric’) s
		cross join book b2
		inner join book b1 on (b1.bookno <> b2.bookno and b1.price > 60 and b2.price >= 50)
		inner join buys t1 on (t1.bookno = b1.bookno and t1.sid = s.sid)
		inner join buys t2 on (t2.bookno = b2.bookno and t2.sid = s.sid);
		
--pushing down selections
select distinct s.sid, b1.price as b1_price, b2.price as b2_price
from (select s.sid from student s where s.sname <> ’Eric’) s
		cross join (select * from book b2 where b2.price >= 50) as b2
		inner join (select * from book b1 where b1.price > 60) as b1 on (b1.bookno <> b2.bookno)
		inner join buys t1 on (t1.bookno = b1.bookno and t1.sid = s.sid)
		inner join buys t2 on (t2.bookno = b2.bookno and t2.sid = s.sid);
		
 --rewriting projections and joins
select distinct s.sid, b1.price as b1_price, b2.price as b2_price
from (select s.sid from student s where s.sname <> ’Eric’) s
		cross join (select b2.bookno,b2.price from book b2 where b2.price >= 50) as b2
		inner join (select b1.bookno,b1.price from book b1 where b1.price > 60) as b1 on (b1.bookno <> b2.bookno)
		inner join buys t1 on (t1.bookno = b1.bookno and t1.sid = s.sid)
		inner join buys t2 on (t2.bookno = b2.bookno and t2.sid = s.sid);
--rewriting inner joins as natural joins */

select distinct s.sid, b1.price as b1_price, b2.price as b2_price
from (select s.sid from student s where s.sname <> 'Eric') s
		natural join (select b2.bookno,b2.price from book b2 where b2.price >= 50) as b2 natural join buys t2
		inner join (select b1.bookno,b1.price from book b1 where b1.price > 60) as b1  natural join buys t1 on ((b1.bookno <> b2.bookno) and (t1.sid = s.sid));

						
\! echo Q4
/* select q.sid
from (select s.sid, s.sname
		from student s
		except
		select s.sid, s.sname
		from student s
				inner join buys t on (s.sid = t.sid)
				inner join book b on (t.bookno = b.bookno and b.price > 50)) q;

--pushing down selections
select q.sid
from (select s.sid, s.sname
		from student s
		except
		select s.sid, s.sname
		from student s
				natural join buys t natural join (select * from book b where b.price > 50)as b) q;
 
 --rewriting projections and joins
 select q.sid
from (select s.sid
		from student s
		except
		select s.sid
		from (select s.sid from student s) as s natural join buys t natural join (select b.bookno from book b where b.price > 50)as b) q;

--removing student table since sid is foreign key in buys table  */
select s.sid
	from student s
	except
select t.sid
	from buys t natural join (select b.bookno from book b where b.price > 50)as b;
		
\! echo Q5
/* select q.sid, q.sname
from (select s.sid, s.sname, 2007 as bookno
		from student s
		cross join book b
	intersect
	select s.sid, s.sname, b.bookno
		from student s
		cross join book b
		inner join buys t on (s.sid = t.sid and t.bookno = b.bookno and b.price <25)) q;

--pushing down selections

select q.sid, q.sname
from (select s.sid, s.sname, 2007 as bookno
		from student s cross join book b
	intersect
	select s.sid, s.sname, b.bookno
		from student s
		cross join (select * from book b where b.price < 25) as b
		inner join buys t on (s.sid = t.sid and t.bookno = b.bookno)) q;
		
 --rewriting projections and joins, removing first sub query of intersect since it is redundant */
	select s.sid, s.sname
		from student s natural join buys t natural join (select b.bookno from book b where b.price < 25 and b.bookno = 2007) as b;

\! echo Q6
/* select distinct q.bookno
from (select s.sid, s.sname, b.bookno, b.title
from student s
	cross join book b
	except
	select s.sid, s.sname, b.bookno, b.title
	from student s
	cross join book b
	inner join buys t on (s.sid = t.sid and t.bookno = b.bookno and b.price <20)) q;

--rewriting projections and joins
select distinct q.bookno
from (select s.sid, b.bookno
from student s
	cross join book b
	except
	select s.sid, b.bookno
	from student s
	cross join book b
	inner join buys t on (s.sid = t.sid and t.bookno = b.bookno and b.price <20)) q;

--pushing down selections
select distinct q.bookno
from (select s.sid, b.bookno
from (select s.sid from student s) as s
	cross join (select b.bookno from book b) as b
	except
	select s.sid, b.bookno
	from (select s.sid from student s) as s natural join buys t
	natural join (select b.bookno from book b where b.price <20) as b) q;

--removing student since sid is foreign key in buys table. */
select distinct q.bookno
from (select s.sid, b.bookno
from (select s.sid from student s) as s
	cross join (select b.bookno from book b) as b
	except
	select t.sid, b.bookno
	from buys t natural join (select b.bookno from book b where b.price <20) as b) q order by q.bookno;

\! echo Q7
/* select s.sid
from student s
except
(select s1.sid
from student s1
		inner join student s2 on (s1.sid <> s2.sid)
		inner join buys t1 on (s1.sid = t1.sid)
union
select s1.sid
from student s1
		inner join student s2 on (s1.sid <> s2.sid)
		inner join buys t1 on (s1.sid = t1.sid)
		inner join buys t2 on (t1.bookno = t2.bookno and t2.sid = s2.sid)
		inner join book b on (t2.bookno = b.bookno and b.price = 80));

--pushing down selection
select s.sid
from student s
except
(select s1.sid
from student s1 natural join buys t1
		inner join student s2 on (s1.sid <> s2.sid)
union
select s1.sid
from student s1 natural join buys t1
		inner join student s2  natural join buys t2 natural join (select * from book b where b.price = 80) as b on (s1.sid <> s2.sid));
		
--rewriting projections and joins
select s.sid
from (select s.sid from student s)as s
except
(select s1.sid
from (select s1.sid from student s1) as s1 natural join (select t1.sid from buys t1) as t1
		inner join (select s2.sid from student s2) as s2 on (s1.sid <> s2.sid)
union
select s1.sid
from (select s1.sid from student s1) as s1 natural join (select t1.sid from buys t1) as t1
		inner join (select s2.sid from student s2) as s2  natural join buys t2 natural join (select b.bookno from book b where b.price = 80) as b on (s1.sid <> s2.sid));

--remove student.sid since sid is foreign keys in buys table
select s.sid
from (select s.sid from student s)as s
except
(select t1.sid
from (select t1.sid from buys t1) as t1
		inner join (select s2.sid from student s2) as s2 on (t1.sid <> s2.sid)
union
select t1.sid
from (select t1.sid from buys t1) as t1
		inner join buys t2 natural join (select b.bookno from book b where b.price = 80) as b on (t1.sid <> t2.sid));

--the second query in union is sub set of first query hence the answer will always be output of first query, also removing second copy of student since it is not required */
select s.sid from student s
except
select t1.sid from buys t1;
		
\c postgres;


DROP DATABASE aaymshah_adc_5;