CREATE DATABASE aaymshah_adc_2;

\c aaymshah_adc_2;

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

CREATE VIEW SnameMajor AS
SELECT S.Sid, S.Sname, M.Major
FROM Student S, Major M
WHERE S.Sid = M.Sid;

\! echo Q1
SELECT DISTINCT S.Sid, S.Major
FROM SnameMajor S, Buys Bs
WHERE Bs.Sid = S.Sid AND Bs.BookNo IN (SELECT B.BookNo
										FROM Book B
										WHERE B.Price < 20);
										
\! echo Q2
SELECT B.BookNo, B.Title
FROM Book B
WHERE B.Price BETWEEN 20 AND 40 AND B.BookNo IN (SELECT C.CitedBookNo
													FROM Cites C);
													
\! echo Q3
SELECT DISTINCT S.Sid, S.Sname
FROM SnameMajor S,Buys Bs
WHERE Bs.Sid = S.Sid AND S.Major = 'CS'
AND Bs.BookNo IN (SELECT C.CitedBookNo
FROM Cites C, Book B1, Book B2
WHERE B2.BookNo = C.CitedBookNo AND B1.BookNo = C.BookNo AND B1.Price < B2.Price);

\! echo Q4
SELECT DISTINCT B.BookNo, B.Title
From Cites C, Book B
WHERE B.BookNo = C.CitedBookNo AND C.BookNo IN (SELECT C1.CitedBookNo
					FROM Cites C1);

\! echo Q5
SELECT B.BookNo
FROM Book B
WHERE B.Price <= ALL(SELECT Price FROM Book);

\! echo Q6
SELECT B.BookNo, B.Title
FROM Book B
WHERE NOT EXISTS (SELECT B1.BookNo
					FROM Book B1
					WHERE B.BookNo <> B1.BookNo AND
					B1.Price > B.Price);

\! echo Q7
CREATE VIEW SecHighest AS
SELECT B.BookNo,B.Title, B.Price
FROM Book B
WHERE B.Price <> (SELECT B.Price
					FROM Book B
					WHERE B.Price >= ALL (SELECT Price FROM Book));
					
SELECT B.BookNo, B.Title
FROM SecHighest B
WHERE B.Price >= ALL (SELECT Price From SecHighest);

\! echo Q8
(SELECT B.BookNo, B.Price
FROM Book B
WHERE EXISTS (SELECT C.CitedBookNo
				FROM Cites C
				WHERE C.CitedBookNo = B.BookNo AND 
				EXISTS (SELECT C1.BookNo
							FROM Cites C1, Book B1
							WHERE C1.BookNo = B.BookNo AND B1.BookNo = C1.CitedBookNo AND B1.Price > 20)))
UNION
(SELECT B.BookNo, B.Price
FROM Book B
WHERE B.BookNo NOT IN (SELECT CitedBookNo FROM Cites C));

\! echo Q9
SELECT DISTINCT B.BookNo, B.Title
FROM Book B, Buys Bs
WHERE B.BookNo = Bs.BookNo AND Bs.Sid IN (SELECT M.Sid FROM Major M WHERE M.Major = 'Biology' OR M.Major = 'Psychology');

\! echo Q10
SELECT B.BookNo, B.Title
FROM Book B
WHERE EXISTS((SELECT S.Sid
				FROM Major S
				WHERE S.Major = 'CS')
			EXCEPT
			(SELECT Bs.Sid
				FROM Buys Bs
				WHERE Bs.BookNo = B.BookNo));

\! echo Q11

SELECT B.BookNo
FROM Book B
WHERE NOT EXISTS((SELECT Bs.Sid
					FROM Buys Bs
					WHERE Bs.BookNo = B.BookNo)
				EXCEPT
				(SELECT S.Sid
				FROM Major S
				WHERE S.Major = 'Biology'));


\! echo Q12

CREATE VIEW MajorMathCS AS
(SELECT M.Sid
FROM Major M 
WHERE M.Major = 'Math')
INTERSECT
(SELECT M.Sid
FROM Major M
WHERE M.Major = 'CS');

SELECT B.BookNo,B.Title
FROM Book B
WHERE NOT EXISTS((SELECT M.Sid
					FROM MajorMathCS M)
				EXCEPT
				(SELECT Bs.Sid
					FROM Buys Bs
					WHERE Bs.BookNo = B.BookNo));
\! echo Q13
CREATE VIEW Atleast_2_fromCS AS
SELECT B.BookNo
FROM Book B
WHERE EXISTS (SELECT Bs1.Sid, Bs2.Sid
				FROM Buys Bs1, Buys Bs2
				WHERE Bs1.BookNo = B.BookNo AND Bs2.BookNo = B.BookNo 
				AND Bs1.Sid <> Bs2.Sid AND 
				Bs1.Sid IN (SELECT S.Sid
							FROM SnameMajor S
							WHERE S.Major = 'CS') AND
				Bs2.Sid IN (SELECT S.Sid
							FROM SnameMajor S
							WHERE S.Major = 'CS'));
							

SELECT S.Sid, S.Sname
FROM Student S
WHERE EXISTS((SELECT Bs.BookNo
				FROM Buys Bs
				WHERE Bs.Sid = S.Sid)
			EXCEPT
			(SELECT BookNo
			FROM Atleast_2_fromCS));


\! echo Q14
SELECT S.Sid, S.Sname
FROM Student S
WHERE NOT EXISTS (SELECT Bs.BookNo
					FROM Buys Bs, Book B
					WHERE Bs.Sid = S.Sid AND Bs.BookNo = B.BookNo AND B.Price > 20
					AND EXISTS (SELECT Bs.BookNo
									FROM Buys Bs, Book B1
									WHERE Bs.Sid = S.Sid AND Bs.BookNo = B1.BookNo AND B.Price > 20 AND B1.BookNo <> B.BookNo));

\! echo Q15

SELECT DISTINCT S1.Sid, BookNo B
FROM Student S1, Book B
WHERE EXISTS (SELECT Bs.BookNo
				FROM Buys Bs
				WHERE Bs.Sid = S1.Sid AND Bs.BookNo = B.BookNo AND
				B.Price <= ALL (SELECT B1.Price
								FROM Buys Bs, Book B1
								WHERE Bs.BookNo = B1.BookNo AND Bs.Sid = S1.Sid)) order by S1.Sid;

\! echo Q16
Select count (1) from (
SELECT DISTINCT S1.Sid, S2.Sid
FROM Major S1, Major S2
WHERE S1.Major = S2.Major AND S1.Sid <> S2.Sid
AND EXISTS ((SELECT Bs.BookNo
				FROM Buys Bs
				WHERE Bs.Sid = S1.Sid AND
				Bs.BookNo NOT IN (SELECT Bs.BookNo FROM Buys Bs WHERE Bs.Sid = S2.Sid))
			UNION
			(SELECT Bs.BookNo
				FROM Buys Bs
				WHERE Bs.Sid = S2.Sid AND 
				Bs.BookNo NOT IN (SELECT Bs.BookNo FROM Buys Bs WHERE Bs.Sid = S1.Sid))))x;


\! echo Q17
select count (1) from (
SELECT S1.Sid, S2.Sid,B.BookNo
FROM Student S1, Student S2, Book B
WHERE S1.Sid <> S2.Sid AND EXISTS
							(SELECT B1.BookNo
							FROM Book B1
							WHERE B1.BookNo = B.BookNo AND B1.BookNo IN (SELECT Bs.BookNo from buys bs WHERE bs.sid = s1.sid ) AND
							B1.BookNo NOT IN (SELECT Bs.BookNo from buys bs WHERE bs.sid = s2.sid )))x;


\! echo Q18
SELECT COUNT(1) From(
(SELECT S1.Sid,S2.Sid
FROM Student S1,Student S2
WHERE S1.Sid <> S2.Sid AND EXISTS((SELECT BS.BookNo
				FROM Buys BS
				WHERE Bs.Sid = S1.Sid)
				INTERSECT
			(SELECT BS.BookNo
				FROM Buys BS
				WHERE Bs.Sid = S2.Sid)))
EXCEPT
(SELECT DISTINCT S1.Sid,S2.Sid
FROM Student S1, Student S2
WHERE S1.Sid <> S2.Sid AND EXISTS (SELECT Bs1.BookNo, Bs2.BookNo
				FROM Buys Bs1, Buys Bs2
				WHERE Bs1.Sid = S1.Sid AND Bs2.Sid = S1.Sid AND Bs1.BookNo <> Bs2.BookNo
				AND Bs1.BookNo IN (SELECT Bs.BookNo FROM Buys Bs WHERE Bs.Sid = S2.Sid)
				AND Bs2.BookNo IN (SELECT Bs.BookNo FROM Buys Bs WHERE Bs.Sid = S2.Sid))))x;


\! echo Q19
CREATE VIEW CS_Major AS
SELECT S.Sid
FROM Major S
WHERE S.Major = 'CS';

SELECT B.BookNo
FROM Book B
WHERE NOT EXISTS(SELECT S1.Sid, S2.Sid
					FROM CS_Major S1, CS_Major S2
					WHERE S1.Sid <> S2.Sid AND
					S1.Sid NOT IN (SELECT Bs.Sid FROM Buys Bs WHERE Bs.BookNo = B.BookNo) AND
					S2.Sid NOT IN (SELECT Bs.Sid FROM Buys Bs WHERE Bs.BookNo = B.BookNo));

\c postgres;


DROP DATABASE aaymshah_adc_2;