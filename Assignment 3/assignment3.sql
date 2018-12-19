CREATE DATABASE aaymshah_adc_3;

\c aaymshah_adc_3;


\! echo Q1
CREATE TABLE A (X INTEGER);

INSERT INTO A VALUES (1),(2),(3),(4),(5);

SELECT X AS x, 
SQRT(X) AS square_root_x,
(X*X) AS x_squared,
POWER(2,X) AS two_to_the_power_x,
X! AS x_factorial,
LN(X) AS logarithm_x 
FROM A;

DROP TABLE A;

\! echo Q2
CREATE TABLE A (X INTEGER);
CREATE TABLE B (Y INTEGER);

INSERT INTO A VALUES (1),(2),(3);
INSERT INTO B VALUES (1),(3),(4),(5);

SELECT 
NOT EXISTS((SELECT X FROM A) EXCEPT (SELECT Y FROM B)) AS empty_a_minus_b,
EXISTS(((SELECT X FROM A) EXCEPT (SELECT Y FROM B)) UNION ((SELECT Y FROM B) EXCEPT (SELECT X FROM A))) AS not_empty_symmetric_difference,
NOT EXISTS((SELECT X FROM A) INTERSECT (SELECT Y FROM B)) AS empty_a_intersection_b;

DROP TABLE A;
DROP TABLE B; 

\! echo Q3

CREATE TABLE A (X INTEGER, Y INTEGER);
INSERT INTO A VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3),(2,4),(3,1),(3,2),(3,3),(3,4),(4,1),(4,2),(4,3),(4,4);

SELECT A1.X,A1.Y,A2.X,A2.Y
FROM A A1, A A2
WHERE A1.X <> A2.X AND A1.Y <> A2.Y AND A1.X + A1.Y = A2.X + A2.Y;

DROP TABLE A;

\! echo Q4
CREATE TABLE A (P BOOLEAN, Q BOOLEAN, R BOOLEAN );
INSERT INTO A VALUES ('t', 't','t'),
('t', 't','f'),
('t', 't', NULL),
('t', 'f','t'),
('t', 'f','f'),
('t', 'f', NULL),
('t', NULL,'t'),
('t', NULL,'f'),
('t', NULL, NULL),
('f', 't','t'),
('f', 't','f'),
('f', 't', NULL),
('f', 'f','t'),
('f', 'f','f'),
('f', 'f', NULL),
('f', NULL,'t'),
('f', NULL,'f'),
('f', NULL, NULL),
(NULL, 't','t'),
(NULL, 't','f'),
(NULL, 't', NULL),
(NULL, 'f','t'),
(NULL, 'f','f'),
(NULL, 'f', NULL),
(NULL, NULL,'t'),
(NULL, NULL,'f'),
(NULL, NULL, NULL);

SELECT p, q, r, (not(not(p) or q) or r) AS "not(not(p) or q) or r" 
FROM A;

DROP Table A;

\! echo Q5
CREATE TABLE A (X INTEGER);
CREATE TABLE B (Y INTEGER);
CREATE TABLE C (Z INTEGER);

INSERT INTO A VALUES (1),(2);
INSERT INTO B VALUES (1),(4),(5);
INSERT INTO C VALUES (3),(4);

\! echo Q5 - a - Using EXCEPT\INTERSECT

SELECT
EXISTS((SELECT X FROM A) INTERSECT (SELECT Y FROM B)) AS answer;

\! echo Q5 - a - Without Using EXCEPT\INTERSECT
SELECT 
EXISTS(SELECT X FROM A
		WHERE X IN (SELECT Y FROM B))AS answer;
		
\! echo Q5 - b - Using EXCEPT\INTERSECT
SELECT NOT EXISTS(SELECT X FROM A
					EXCEPT
					SELECT Y FROM B) AS answer;
		
		
\! echo Q5 - b - Without Using EXCEPT\INTERSECT
SELECT NOT EXISTS((SELECT X FROM A WHERE X NOT IN (SELECT Y FROM B)))AS answer;

\! echo Q5 - c - Using EXCEPT\INTERSECT
SELECT NOT EXISTS(SELECT Y FROM B WHERE Y NOT IN ((SELECT X FROM A) INTERSECT (SELECT Y FROM B))) AS answer;


\! echo Q5 - c - Without Using EXCEPT\INTERSECT
SELECT NOT EXISTS(SELECT Y FROM B WHERE Y NOT IN (SELECT X FROM A, B WHERE X = Y)) As answer;

\! echo Q5 - d - Using EXCEPT\INTERSECT
SELECT EXISTS(((SELECT X FROM A)EXCEPT(SELECT Y FROM B))UNION((SELECT Y FROM B)EXCEPT(SELECT X FROM A))) AS answer;

\! echo Q5 - d - Without Using EXCEPT\INTERSECT
SELECT EXISTS(SELECT X FROM A WHERE X NOT IN (SELECT Y FROM B)UNION(SELECT Y FROM B WHERE Y NOT IN (SELECT X FROM A))) AS answer;

\! echo Q5 - e - Using EXCEPT\INTERSECT
WITH I AS
((SELECT X FROM A) 
INTERSECT
(SELECT Y FROM B)) 

SELECT NOT EXISTS(SELECT I1.X FROM I I1 WHERE
EXISTS (SELECT I2.X FROM I I2 WHERE I2.X <> I1.X AND 
EXISTS (SELECT I3.X FROM I I3 WHERE I3.X <> I2.X AND I3.X <> I1.X))) AS answer;

\! echo Q5 - e - Without Using EXCEPT\INTERSECT
SELECT NOT EXISTS (SELECT A1.X 
FROM A A1 
WHERE A1.X IN (SELECT Y FROM B) AND 
EXISTS(SELECT A2.X FROM A A2 WHERE A2.X <> A1.X AND A2.X IN (SELECT Y FROM B) AND
EXISTS(SELECT A3.X FROM A A3 WHERE A3.X <> A2.X AND A3.X <> A1.X AND A3.X IN (SELECT Y FROM B)))) AS answer;

\! echo Q5 - f - Using EXCEPT\INTERSECT
WITH U AS (
(SELECT X FROM A)
UNION
(SELECT Y FROM B)
)
SELECT NOT EXISTS ((SELECT X FROM U) EXCEPT (SELECT Z FROM C)) AS answer;

\! echo Q5 - f - Without Using EXCEPT\INTERSECT
WITH U AS (
(SELECT X FROM A)
UNION
(SELECT Y FROM B)
)
SELECT NOT EXISTS(SELECT X FROM U WHERE X NOT IN (SELECT Z FROM C)) AS answer;

\! echo Q5 - g - Using EXCEPT\INTERSECT
With union_difference AS(
((SELECT X from A) EXCEPT (SELECT Y FROM B))
UNION
((SELECT Y FROM B) EXCEPT (SELECT Z FROM C))
)

SELECT NOT EXISTS (SELECT U1.X FROM union_difference U1 WHERE EXISTS (SELECT U2.X FROM union_difference U2 WHERE U2.X <> U1.X)) AS answer;

\! echo Q5 - g - Without Using EXCEPT\INTERSECT
With union_difference AS(
(SELECT X from A WHERE X NOT IN (SELECT Y FROM B))
UNION
(SELECT Y FROM B WHERE Y NOT IN (SELECT Z FROM C)))

SELECT NOT EXISTS (SELECT U1.X FROM union_difference U1 WHERE EXISTS (SELECT U2.X FROM union_difference U2 WHERE U2.X <> U1.X)) AS answer;

\! echo Q6 - a
SELECT(
SELECT COUNT(1) FROM ((SELECT X FROM A) INTERSECT (SELECT Y FROM B))q) >=1 AS answer;

\! echo Q6 - b
SELECT(SELECT COUNT (1) FROM (SELECT X FROM A
								EXCEPT
								SELECT Y FROM B)q) = 0 AS answer;


\! echo Q6 - c
SELECT(SELECT Count(1) FROM (SELECT Y FROM B WHERE Y NOT IN ((SELECT X FROM A) INTERSECT (SELECT Y FROM B)))q) = 0 AS answer;

\! echo Q6 - d
SELECT(SELECT Count(1) FROM (((SELECT X FROM A)EXCEPT(SELECT Y FROM B))UNION((SELECT Y FROM B)EXCEPT(SELECT X FROM A)))q) >=1 AS answer;

\! echo Q6 - e
SELECT (SELECT COUNT(1) FROM ((SELECT X FROM A) INTERSECT (SELECT Y FROM B))q) <= 2 as answer;

\! echo Q6 - f
WITH U AS (
(SELECT X FROM A)
UNION
(SELECT Y FROM B)
)
SELECT(SELECT COUNT(1) FROM ((SELECT X FROM U) EXCEPT (SELECT Z FROM C))q) = 0 AS answer;

\! echo Q6 - g
SELECT (SELECT COUNT(1) FROM (((SELECT X from A) EXCEPT (SELECT Y FROM B)) UNION ((SELECT Y FROM B) EXCEPT (SELECT Z FROM C)))q) = 1 AS asnwer;


\! echo Q7
CREATE TABLE W (A INTEGER, B VARCHAR(5));

INSERT INTO W VALUES (1,'John'), (2,'Ellen'), (3,'Ann');

(SELECT A FROM W GROUP BY A HAVING COUNT(A) > 1)
UNION
(SELECT A FROM W WHERE NOT EXISTS(SELECT A FROM W GROUP BY A HAVING COUNT(A) > 1));


\! echo Q8

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

\! echo Q8 - a - i

CREATE FUNCTION booksBoughtbyStudent(sno int)
RETURNS TABLE (bookno int, title VARCHAR(30), price int)
AS $$
	SELECT B.BookNo, B.Title, B.Price
	FROM Book B, Buys Bs
	WHERE Bs.Sid = sno AND Bs.BookNo = B.BookNo
$$LANGUAGE SQL;

\! echo Q8 - a - ii

SELECT * FROM booksBoughtbyStudent(1001);

SELECT * FROM booksBoughtbyStudent(1015);

\! echo Q8 - a - iii - A
SELECT S.Sid, S.Sname
FROM Student S
WHERE (SELECT COUNT(1) FROM (SELECT B.BookNo
		FROM booksBoughtbyStudent(S.Sid) AS B
		WHERE B.Price < 50)q) = 1;

\! echo Q8 - a - iii - B
SELECT S1.Sid, S2.Sid
FROM Student S1, Student S2
WHERE S1.Sid <> S2.Sid 
AND NOT EXISTS ((SELECT B1.BookNo
				FROM booksBoughtbyStudent(S1.Sid) AS B1)
			EXCEPT
			(SELECT B2.BookNo
				FROM booksBoughtbyStudent(S2.Sid) AS B2))
AND NOT EXISTS ((SELECT B1.BookNo
				FROM booksBoughtbyStudent(S2.Sid) AS B1)
			EXCEPT
			(SELECT B2.BookNo
				FROM booksBoughtbyStudent(S1.Sid) AS B2));


\! echo Q8 - b - i
CREATE FUNCTION studentsWhoBoughtBook(inbookno int)
RETURNS TABLE (sid int, sname VARCHAR(15)) 
AS $$
SELECT S.Sid, S.Sname
FROM Student S, Buys Bs
WHERE Bs.BookNo = inbookno AND Bs.Sid = S.Sid
$$ LANGUAGE SQL;

\! echo Q8 - b - ii
SELECT * FROM studentsWhoBoughtBook(2001);

SELECT * FROM studentsWhoBoughtBook(2010);

\! echo Q8 - b - iii

WITH CS_Student AS (
SELECT S.Sid
FROM Student S, Major M
WHERE S.Sid = M.Sid AND M.Major = 'CS' AND 
(SELECT COUNT(1) FROM (SELECT B.BookNo
		FROM booksBoughtbyStudent(S.Sid) AS B
		WHERE B.Price > 30)q) >= 1)		

SELECT B.BookNo
FROM Book B
WHERE (SELECT COUNT(1) FROM 
((SELECT S1.Sid
	FROM studentsWhoBoughtBook(B.BookNo) AS S1
	WHERE S1.Sid IN (SELECT Sid FROM CS_Student))
INTERSECT
(SELECT S2.Sid
	FROM studentsWhoBoughtBook(B.BookNo) AS S2
	WHERE S2.Sid IN (SELECT Sid FROM CS_Student))
)q) >=2;

\! echo Q8 - c - i

SELECT S.Sid, M.Major
FROM Student S, Major M
WHERE S.Sid = M.Sid AND (SELECT COUNT(1) FROM (SELECT B.BookNo
								FROM booksBoughtbyStudent(S.Sid) AS B
								WHERE B.Price > 30)q) >=4; 

\! echo Q8 - b - ii
SELECT S1.Sid, S2.Sid
FROM Student S1,Student S2
WHERE S1.Sid <> S2.Sid AND 
(SELECT SUM(B.Price) FROM booksBoughtbyStudent(S1.Sid) AS B) = (SELECT SUM(B.Price) FROM booksBoughtbyStudent(S2.Sid) AS B);

\! echo Q8 - c - iii
WITH CS_AVG AS (
SELECT AVG(sum)
FROM(
SELECT S.Sid, SUM(B.Price) AS sum
FROM Student S, booksBoughtbyStudent(S.Sid) AS B, Major M
WHERE M.Sid = S.Sid AND M.Major = 'CS'
GROUP BY S.Sid)q)

SELECT S.Sid, S.Sname
FROM Student S
WHERE (SELECT SUM(B.Price) FROM booksBoughtbyStudent(S.Sid) AS B) > (SELECT avg FROM CS_AVG);

\! echo Q8 - c - iv
SELECT B1.BookNo, B1.Title
FROM ( SELECT B.BookNo, B.Title, B.Price, RANK() OVER(ORDER BY B.Price DESC)
		FROM Book B) AS B1
WHERE B1.RANK = 3;

\! echo Q8 - c - v
SELECT B.BookNo,B.Title
FROM Book B
WHERE (SELECT COUNT(1) FROM ((SELECT S1.Sid
					FROM studentsWhoBoughtBook(B.BookNo) AS S1)
				EXCEPT
				(SELECT S2.Sid
					FROM Major S2
					WHERE S2.Major = 'CS'))q) = 0;

\! echo Q8 - c - vi
WITH AtLeast_2_CS AS (
SELECT B.BookNo
FROM Book B
WHERE(SELECT COUNT(1) FROM (SELECT S1.Sid
								FROM studentsWhoBoughtBook(B.BookNo) AS S1, Major M
								WHERE S1.Sid = M.Sid AND M.Major = 'CS')q)>=2)

SELECT S.Sid,S.Sname
FROM Student S
WHERE (SELECT COUNT(1) FROM ((SELECT B2.BookNo
								FROM booksBoughtbyStudent(S.Sid) AS B2)
							EXCEPT
							(SELECT B1.BookNo
								FROM AtLeast_2_CS AS B1))q)>=1;
								
\! echo Q8 - c - vii
SELECT S.Sid,B.BookNo
FROM Student S, booksBoughtbyStudent(S.Sid) AS B
WHERE B.Price < (SELECT AVG(B1.Price) FROM booksBoughtbyStudent(S.Sid) AS B1);

\! echo Q8 - c - viii
SELECT S1.Sid,S2.Sid
FROM Major S1, Major S2
WHERE S1.Sid <> S2.Sid AND S1.Major = S2.Major
AND (SELECT COUNT(*) FROM booksBoughtbyStudent(S1.Sid)) = (SELECT COUNT(*) FROM booksBoughtbyStudent(S2.Sid));
					
\! echo Q8 - c - ix
SELECT DISTINCT S1.Sid,S2.Sid,
(SELECT COUNT(*) FROM ((SELECT BookNo FROM booksBoughtbyStudent(S1.Sid)) EXCEPT (SELECT BookNo FROM booksBoughtbyStudent(S2.Sid)))q) AS n
FROM Major S1,Major S2
WHERE S1.Sid <> S2.Sid AND S1.Major = S2.Major;

\! echo Q8 - c - x
WITH CS_Student AS 
(SELECT S.Sid
FROM Major S
WHERE S.Major = 'CS')

SELECT B.BookNo
FROM Book B
WHERE (SELECT COUNT(*)
FROM CS_Student S1
WHERE S1.Sid NOT IN (SELECT S.Sid FROM studentsWhoBoughtBook(B.BookNo) AS S)) <= 1;


DROP TABLE Student;
DROP TABLE Book;
DROP TABLE Major;
DROP TABLE Buys;

\! echo Q9

CREATE TABLE Student (Sid INT, Sname TEXT, PRIMARY KEY (Sid));
CREATE TABLE Course(Cno INT, Cname TEXT, Total INT, Max INT, PRIMARY KEY(Cno));
CREATE TABLE Prerequisite(Cno INT, Prereq INT, FOREIGN KEY(Cno) REFERENCES Course(Cno), FOREIGN KEY(Prereq) REFERENCES Course(Cno));
CREATE TABLE HasTaken(Sid INT, Cno INT, FOREIGN KEY(Sid) REFERENCES Student(Sid), FOREIGN KEY(Cno) REFERENCES Course(Cno));
CREATE TABLE Enroll(Sid INT, Cno INT, FOREIGN KEY(Sid) REFERENCES Student(Sid), FOREIGN KEY(Cno) REFERENCES Course(Cno));
CREATE TABLE Waitlist(Sid INT, Cno INT, Position INT, FOREIGN KEY(Sid) REFERENCES Student(Sid), FOREIGN KEY(Cno) REFERENCES Course(Cno));

CREATE VIEW Enroll_View AS
SELECT * FROM Enroll;

CREATE VIEW Waitlist_View AS
SELECT * FROM Waitlist;

--inserting given values

INSERT INTO Course VALUES (201,'Programming',0,3);
INSERT INTO Course VALUES (202,'Calculus',0,3);
INSERT INTO Course VALUES (203,'Probability',0,3);
INSERT INTO Course VALUES (204,'AI',0,2);
INSERT INTO Course VALUES (301,'DiscreteMathematics',0,2);
INSERT INTO Course VALUES (302,'OS',0,2);
INSERT INTO Course VALUES (303,'Databases',0,2);
INSERT INTO Course VALUES (401,'DataScience',0,2);
INSERT INTO Course VALUES (402,'Networks',0,2);
INSERT INTO Course VALUES (403,'Philosophy',0,2);

INSERT INTO Prerequisite VALUES (301,201);
INSERT INTO Prerequisite VALUES (301,202);
INSERT INTO Prerequisite VALUES (302,201);
INSERT INTO Prerequisite VALUES (302,202);
INSERT INTO Prerequisite VALUES (302,203);
INSERT INTO Prerequisite VALUES (401,301);
INSERT INTO Prerequisite VALUES (401,204);
INSERT INTO Prerequisite VALUES (402,302);

INSERT INTO Student VALUES (1,'Jean');
INSERT INTO Student VALUES (2,'Eric');
INSERT INTO Student VALUES (3,'Ahmed');
INSERT INTO Student VALUES (4,'Qin');
INSERT INTO Student VALUES (5,'Filip');
INSERT INTO Student VALUES (6,'Pam');
INSERT INTO Student VALUES (7,'Lisa');

INSERT INTO Hastaken VALUES (1,201);
INSERT INTO Hastaken VALUES (1,202);
INSERT INTO Hastaken VALUES (1,301);
INSERT INTO Hastaken VALUES (2,201);
INSERT INTO Hastaken VALUES (2,202);
INSERT INTO Hastaken VALUES (3,201);
INSERT INTO Hastaken VALUES (4,201);
INSERT INTO Hastaken VALUES (4,202);
INSERT INTO Hastaken VALUES (4,203);
INSERT INTO Hastaken VALUES (4,204);
INSERT INTO Hastaken VALUES (5,201);
INSERT INTO Hastaken VALUES (5,202);
INSERT INTO Hastaken VALUES (5,301);
INSERT INTO Hastaken VALUES (5,204);

--checks if the student has taken all prerequisites required for the given course  
CREATE OR REPLACE FUNCTION prereq_check(StudentNo INT, CourseNo INT) RETURNS BOOLEAN AS
$$
BEGIN
	
	IF (SELECT COUNT(*) FROM (SELECT P.Prereq FROM Prerequisite P WHERE P.Cno = CourseNo AND P.Prereq NOT IN (SELECT H.Cno FROM HasTaken H WHERE H.Sid = StudentNo))C) > 0 THEN
		RETURN FALSE;
	END IF;
	RETURN TRUE;
END;
$$ LANGUAGE 'plpgsql';

--returns the total number of students enrolled for course
CREATE OR REPLACE FUNCTION Get_Total(CourseNo INT) RETURNS INT AS
$$
DECLARE
Total INT;
BEGIN
	SELECT C.Total INTO Total FROM Course C WHERE C.Cno = CourseNo;
	RETURN Total;
END;
$$ LANGUAGE 'plpgsql';

--gets the min waitlist position for a given course 
CREATE OR REPLACE FUNCTION Get_Min_Waitlist_Position(CourseNo INT) RETURNS INT AS
$$
DECLARE
	MinPos INT := 0;
BEGIN
	IF (SELECT COUNT(*) FROM Waitlist WHERE Cno = CourseNo) <> 0 THEN
		SELECT MIN(W.Position) INTO MinPos FROM Waitlist W WHERE W.Cno = CourseNo;
	END IF;
	RETURN MinPos;
END;
$$ LANGUAGE 'plpgsql';

-- Gets the max waitlist postion for a given course
CREATE OR REPLACE FUNCTION Get_Max_Waitlist_Position(CourseNo INT) RETURNS INT AS
$$
DECLARE
	MaxPos INTEGER := 0;
BEGIN
	IF (SELECT COUNT(*) FROM Waitlist WHERE Cno = CourseNo) <> 0 THEN
		SELECT MAX(W.Position) INTO MaxPos FROM Waitlist W WHERE W.Cno = CourseNo;
	END IF;
	RETURN MaxPos;
END;
$$ LANGUAGE 'plpgsql';

-- gets the max number of students can be enrolled for a given course 
CREATE OR REPLACE FUNCTION Get_Max_Course(CourseNo INT) RETURNS INT AS
$$
DECLARE
	CMax INT;
BEGIN 
	SELECT C.Max INTO CMax FROM Course C WHERE C.Cno = CourseNo;
	RETURN Cmax;
END
$$ LANGUAGE 'plpgsql';

-- Checks if student is enrolled in the given course
CREATE OR REPLACE FUNCTION Check_Enrolled(StudentNo INT, CourseNo INT) RETURNS BOOLEAN AS
$$
DECLARE 
	Enrolled BOOLEAN := False;
BEGIN 
	IF EXISTS (SELECT (1) FROM Enroll E WHERE E.Sid = StudentNo AND E.Cno = CourseNo) THEN
		Enrolled = TRUE;
	ELSIF EXISTS (SELECT (1) FROM Waitlist W WHERE W.Sid = StudentNo AND W.Cno = CourseNo) THEN
		Enrolled = TRUE;
	END IF;
	RETURN Enrolled;
END;
$$ LANGUAGE 'plpgsql';


--Trigger for insert on enroll_view. inserts into enroll if course total is less than max total and increments value of total else puts student on waitlist
CREATE OR REPLACE FUNCTION Insert_Enroll_Waitlist() RETURNS TRIGGER AS
$$
BEGIN
	IF NOT (prereq_check(NEW.Sid,New.Cno)) THEN
		RAISE EXCEPTION 'Student Does Not Meet Prerequisites';
	END IF;
	
	IF Check_Enrolled(New.Sid,New.Cno) THEN
		RAISE EXCEPTION 'Student Already Enrolled/Waitlisted For Course';
	END IF;
	
	IF (Get_Total(NEW.Cno) + 1) <= Get_Max_Course(New.Cno) THEN
		INSERT INTO Enroll VALUES(New.Sid,New.Cno);
		UPDATE Course SET Total = Total + 1 WHERE Cno = New.Cno;
	ELSE
		INSERT INTO Waitlist VALUES(New.Sid, New.Cno, (Get_Max_Waitlist_Position(New.Cno) + 1));
		RAISE NOTICE 'Course % is full % sid is added to waitlist. waitlist position is %',NEW.Cno,New.Sid, Get_Max_Waitlist_Position(New.Cno);
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER Insert_Into_Enroll
	INSTEAD OF INSERT ON Enroll_View
	FOR EACH ROW
	EXECUTE PROCEDURE Insert_Enroll_Waitlist();
	
-- Trigger for delete on enroll_view. deletes from enroll and adds a value from waitlist if any one in waitlist else reduces course total by one
CREATE OR REPLACE FUNCTION Delete_Enroll() RETURNS TRIGGER AS
$$
DECLARE
	WaitListSid INT;
BEGIN
	IF NOT EXISTS(SELECT(1) FROM Enroll E WHERE E.Sid = OLD.Sid AND E.Cno = OLD.Cno) THEN
		RAISE EXCEPTION 'Student Not Enrolled For Course';
	END IF;
	
	DELETE FROM Enroll E WHERE E.Sid = OLD.Sid AND E.Cno = OLD.Cno;

	IF EXISTS (SELECT (1) FROM Waitlist W WHERE W.Cno = OLD.Cno) THEN
		SELECT W.Sid INTO WaitListSid FROM Waitlist W WHERE W.Cno = OLD.Cno AND W.Position = Get_Min_Waitlist_Position(Old.Cno);
		INSERT INTO Enroll Values(WaitListSid, OLD.Cno);
		DELETE FROM Waitlist_View W WHERE W.Sid = WaitListSid AND W.Cno = Old.Cno;
	ELSE
		UPDATE Course SET Total = Total - 1 WHERE Cno = OLD.Cno;
	END IF;
	RETURN OLD;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER Delete_From_Enroll
	INSTEAD OF DELETE ON Enroll_View
	FOR EACH ROW
	EXECUTE PROCEDURE Delete_Enroll();

-- Trigger for Delete statement on waitlist_view. deletes the row and updates the position of remaining rows
CREATE OR REPLACE FUNCTION Delete_Waitlist() RETURNS TRIGGER AS
$$
DECLARE 
currPosition INT;
BEGIN
	
	SELECT Position INTO currPosition FROM Waitlist W WHERE Sid = OLD.Sid AND Cno = OLD.Cno;
	DELETE FROM Waitlist WHERE Sid = OLD.Sid AND Cno = OLD.Cno;
	UPDATE Waitlist Set Position = Position - 1 WHERE Cno = OLD.Cno AND Position > currPosition;
	RETURN OLD;
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER Delete_From_Waitlist
	INSTEAD OF DELETE ON Waitlist_View
	FOR EACH ROW
	EXECUTE PROCEDURE Delete_Waitlist();

-- Trigger for insert statement on waitlist_view
CREATE OR REPLACE FUNCTION Insert_Waitlist() RETURNS TRIGGER AS
$$
BEGIN
	RAISE EXCEPTION 'CAN NOT INSERT INTO WAITLIST, Student can be added to waitlist only if course is full';
END;
$$ LANGUAGE 'plpgsql';

CREATE TRIGGER Insert_Into_Waitlist
	INSTEAD OF INSERT ON Waitlist_View
	FOR EACH ROW
	EXECUTE PROCEDURE Insert_Waitlist();
	
/*
To insert delete or view enroll and waitlist records use Enroll_View and Waitlist_view. 
Enroll and Waitlist table are abstracted and are just used to hold data.

Following Queries have been tested with this Database Schema*/
 
INSERT INTO Enroll_View Values(1,301); --inserted into enroll_view
INSERT INTO Enroll_View Values(2,301); --inserted into enroll_view
INSERT INTO Enroll_View Values(4,301); --inserted into waitlist_view
INSERT INTO Enroll_View Values(5,301); --inserted into waitlist_view
INSERT INTO Enroll_View Values(1,302); --error Prerequisites does not match
INSERT INTO Enroll_View Values(1,204); --inserted into enroll_view
INSERT INTO Enroll_View Values(2,204); --inserted into enroll_view
INSERT INTO Enroll_View Values(3,204); --inserted into Waitlist_view
INSERT INTO Enroll_View Values(6,204); --inserted into Waitlist_view
INSERT INTO Enroll_View Values(7,204); --inserted into Waitlist_view

DELETE FROM Enroll_View WHERE Sid = 2 AND Cno = 301; --deletes a row from enroll_view and adds a sid from waitlist to enroll
DELETE FROM Waitlist_View WHERE Sid = 3 AND Cno = 204; --deletes a row from from waitlist_view and updates position of other waitlist positions




\c postgres;


DROP DATABASE aaymshah_adc_3;