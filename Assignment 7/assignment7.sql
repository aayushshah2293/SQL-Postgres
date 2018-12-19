CREATE DATABASE aaymshah_adc_7;

\c aaymshah_adc_7;

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
create or replace function setunion(A anyarray, B anyarray)
returns anyarray as
$$ select ARRAY(select unnest(A)
union
select unnest(B));
$$ language sql;

create or replace function setintersection(A anyarray, B anyarray)
returns anyarray as
$$ select ARRAY(select unnest(A)
intersect 
select unnest(B));
$$ language sql;

create or replace function setdifference(A anyarray, B anyarray)
returns anyarray as 
$$ select ARRAY (select unnest(A)
except
select unnest(B));
$$ language sql;

create or replace function memberof(x anyelement, A anyarray)
returns boolean as
$$
select x = SOME(A);
$$ language sql;

\! echo Q2

create or replace view student_books as
select s.sid as sid, array(select t.bookno
							from buys t
							where t.sid = s.sid
							order by bookno) as books
from student s
order by sid;

\! echo Q2 - a
create or replace view book_students as
select b.bookno as bookno, array(select t.sid
									from buys t
									where t.bookno = b.bookno) as sids
from book b
order by bookno;

\! echo Q2 - b
create or replace view book_citedbooks as
select b.bookno as bookno, array(select c.citedbookno
									from cites c
									where c.bookno = b.bookno) as citingbooknos
from book b
order by bookno;

\! echo Q2 - c
create or replace view book_citingbooks as 
select b.bookno as bookno, array(select c.bookno
									from cites c
									where c.citedbookno = b.bookno) as citedbooknos
from book b
order by bookno;

\! echo Q2 - d
create or replace view major_students as 
select distinct m.major as major,array_agg(m.sid) as sids
from major m
group by (m.major)
order by major;



\! echo Q2 - e
create or replace view student_majors as
select s.sid as sid, array(select m.major
							from major m
							where m.sid = s.sid) as majors
from student s
order by sid;


\! echo Q3

\! echo Q3 - a
select sb.sid
from student_books sb
where cardinality(sb.books) = 2;

\! echo Q3 - b

select sb.sid
from student_books sb
where (setdifference((select sb1.books from student_books sb1 where sb1.sid = 1001),(select sb1.books from student_books sb1 where sb1.sid = sb.sid))) <@ '{}';

--check with professor
with books_bought_by_sid as
(select sb.books as books from student_books sb where sb.sid = 1001)

select sb.sid
from student_books sb
where (select books from books_bought_by_sid) <@ sb.books;

\! echo Q3 - c
----- cites atleast 2 books greater than 30
with books_more_than_30 as
(select array_agg(b.bookno) as books from book b where b.price > 30)

select bc.bookno
from book_citedbooks bc
where cardinality(setintersection(bc.citingbooknos,(select books from books_more_than_30))) < 2;


\! echo Q3 - d
with sids_of_CS_and_Math as 
(select setintersection((select ms.sids from major_students ms where ms.major = 'CS'),
(select ms.sids from major_students ms where ms.major = 'Math')) as sids)

select b.bookno, b.title
from book b, book_students bs,sids_of_CS_and_Math scm
where b.bookno = bs.bookno and setdifference(bs.sids,scm.sids) <> '{}';

\! echo Q3 - e
select sb.sid,book
from student_books sb, unnest(sb.books) as book
where cardinality(array(select bc.bookno from book_citedbooks bc, book b where bc.bookno = b.bookno and memberof(book,bc.citingbooknos) and b.price < 50)) >= 2;

\! echo Q3 - f
select setintersection((select ms.sids from major_students ms where ms.major = 'CS'),
(select ms.sids from major_students ms where ms.major = 'Math')) as students;

\! echo Q3 - g
select sm.sid,sm.majors
from student_majors sm
where setintersection((select sb.books from student_books sb where sb.sid = sm.sid), (select sb.books from student_books sb where sb.sid = 1001)) <@ '{}';

\! echo Q3 - h
select array (select distinct unnest(sb.books)
from student_books sb, major_students ms
where ms.major = 'CS' and memberof(sb.sid,ms.sids)) as books;

\! echo Q3 - i
select array( select distinct unnest(bs.sids)
from book_students bs, book_citedbooks bc
where bs.bookno = bc.bookno and cardinality(bc.citingbooknos) >= 2) as students;

\! echo Q3 - j
select bs.bookno as book, array_agg(student) as students
from book_students bs, unnest(bs.sids) as student, major_students ms
where (ms.major = 'CS' and memberof(student,ms.sids)) 
group by bs.bookno
union
select bs.bookno as book, bs.sids as students
from book_students bs
where bs.sids <@ '{}';

\! echo Q3 - k
with  books_bought_by_math as 
(select array ( select distinct unnest(sb.books) as book
from student_books sb, student_majors sm
where sb.sid = sm.sid and memberof('Math',sm.majors)) as books) 

select sb.sid
from student_books sb, student_majors sm, books_bought_by_math bm
where sb.sid = sm.sid and memberof('CS',sm.majors) and setintersection(sb.books,bm.books) <@ '{}';

\! echo Q3 - l
select bs1.bookno,bs2.bookno
from book_students bs1, book_students bs2
where bs1.bookno <> bs2.bookno and bs1.sids <@ bs2.sids and bs2.sids <@ bs1.sids;

\! echo Q3 - m

select distinct bs1.bookno,bs2.bookno
from book_students bs1, book_students bs2
where bs1.bookno <> bs2.bookno and
cardinality(setintersection(bs1.sids,(select ms1.sids from major_students ms1 where ms1.major = 'Math'))) <
cardinality(setintersection(bs2.sids,(select ms2.sids from major_students ms2 where ms2.major = 'CS')));


\! echo Q3 - n
with books_more_than_50 as
(select array_agg(b.bookno) as books from book b where b.price > 50)

select distinct sb.sid
from student_books sb
where cardinality(setintersection(sb.books,(select books from books_more_than_50))) = (cardinality((select books from books_more_than_50))) - 1;

\c postgres;


DROP DATABASE aaymshah_adc_7;