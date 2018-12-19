CREATE DATABASE aaymshah_adc_1;

\c aaymshah_adc_1;

-- Question 1: creation of database with relationship schemas.
CREATE TABLE Sailor ( Sid INTEGER NOT NULL,
Sname VARCHAR(20),
Rating INTEGER,
Age INTEGER,
PRIMARY KEY(Sid));

CREATE TABLE Boat ( Bid INTEGER NOT NULL,
Bname VARCHAR(15),
Color VARCHAR(15),
PRIMARY KEY(bid));

CREATE TABLE Reserves( Sid INTEGER,
Bid INTEGER,
Day VARCHAR(10),
PRIMARY KEY(Sid, Bid),
FOREIGN KEY(Sid) REFERENCES Sailor(Sid),
FOREIGN KEY(Bid) REFERENCES Boat(Bid));

INSERT INTO Sailor VALUES (22,   'Dustin',       7,      45),
(29,   'Brutus',       1,      33),
(31,   'Lubber',       8,      55),
(32,   'Andy',         8,      25),
(58,   'Rusty',        10,     35),
(64,   'Horatio',      7,      35),
(71,   'Zorba',        10,     16),
(74,   'Horatio',      9,      35),
(85,   'Art',          3,      25),
(95,   'Bob',          3,      63);

INSERT INTO Boat VALUES (101,	'Interlake',	'blue'),
(102,	'Sunset',	'red'),
(103,	'Clipper',	'green'),
(104,	'Marine',	'red');

INSERT INTO Reserves VALUES (22,	101,	'Monday'),
(22,	102,	'Tuesday'),
(22,	103,	'Wednesday'),
(31,	102,	'Thursday'),
(31,	103,	'Friday'),
(31,      104,	'Saturday'),
(64,	101,	'Sunday'),
(64,	102,	'Monday'),
(74,	102,	'Saturday');

--Question 3 SQL statements for given queries

--(a) Find the rating of each sailor.
SELECT DISTINCT Sid, Sname, Rating from Sailor ORDER BY Rating DESC;

--(b) Find the bid and color of each boat.
SELECT Bid, Color from Boat;

--(c) Find the name of each sailor whose age is in the range [15, 30]
SELECT Sname FROM Sailor WHERE Age BETWEEN 15 AND 30;

--(d) Find the name of each boat that was reserved during a weekend (i.e., Saturday or Sunday).
SELECT Bname FROM Boat, Reserves WHERE Boat.Bid = Reserves.Bid AND (Reserves.Day = 'Saturday' OR Reserves.Day = 'Sunday');
SELECT Bname FROM Boat WHERE Bid IN (SELECT Bid FROM Reserves WHERE Day = 'Saturday' OR Day = 'Sunday');

--(e) Find the name of each sailor who reserved both a red boat and a green boat.
SELECT Sname FROM Sailor 
WHERE Sid IN
	(SELECT Sid FROM Reserves WHERE Bid IN (SELECT Bid FROM Boat WHERE Color='red'))
AND Sid IN
	(SELECT Sid FROM Reserves WHERE Bid IN (SELECT Bid FROM Boat WHERE Color='green'));
	
--(f) Find the name of each sailor who reserved a red boat but neither a green nor a blue boat.
SELECT Sname FROM Sailor 
WHERE Sid IN
	(SELECT Sid FROM Reserves WHERE Bid IN (SELECT Bid FROM Boat WHERE Color='red'))
AND Sid NOT IN
	(SELECT Sid FROM Reserves WHERE Bid IN (SELECT Bid FROM Boat WHERE Color='green'))
AND Sid NOT IN
	(SELECT Sid FROM Reserves WHERE Bid IN (SELECT Bid FROM Boat WHERE Color='blue'));

--(g) Find the name of each each sailor who reserved two different boats.
SELECT Sname FROM Sailor WHERE Sid IN
	(SELECT Sid FROM Reserves GROUP BY Sid HAVING COUNT(Sid) > 1);
	
--(h) Find the sid of each sailor who did not reserve any boats.
SELECT Sid FROM Sailor WHERE Sid NOT IN
	(SELECT DISTINCT Sid FROM Reserves);
	
--(i) Find the pairs of sids (s1; s2) of different sailors who both reserved a boat on a Saturday.
SELECT R1.Sid, R2.Sid From Reserves R1, Reserves R2 WHERE R1.Day = 'Saturday' AND R2.Day = 'Saturday' AND R1.Sid <> R2.Sid;

--Find the bids of boats that where reserved by only one sailor. (You should write this query without using the COUNT aggregate function.)
SELECT Bid 
FROM Boat 
WHERE Bid NOT IN (SELECT DISTINCT R1.Bid
					FROM Reserves R1, Reserves R2
					WHERE R1.Bid = R2.Bid AND R1.Sid <> R2.Sid);

--Question 2 Examples illustrate presence and abssence of primary and foreign keys on insert and delete statements

INSERT INTO Sailor VALUES (22, 'Dave', 5, 35); -- Query fails since Sid is a primary key and Sid = 22 alredy exist
INSERT INTO Sailor VALUES (23,   'Dustin',       7,      45); -- Query executes successfully since even though all data added is duplicate Sid is unique. hence row is added without any errors
INSERT INTO Reserves VALUES (10, 10, 'Friday'); -- Query Fails since Sid and Bid are foreign keys in Sailor and Boat tables respectively and values entered are not present in those tables.
INSERT INTO Sailor VALUES (NULL,'Sam', 7, 56); -- Query Fails since Sid has NOT NULL CONSTANT on it.
INSERT INTO Reserves VALUES (22, 101, 'Saturday'); -- Query Fails since Sid-Bid pair is repeted in this example and Sid-Bid pair is primary key for the table.
INSERT INTO Reserves VALUES (22, 104, 'Saturday'); -- Query successfully executes as eventhough Sid=22 and bid=104 appears on the table but Sid-Bid pair of 22-104 is unique. hence the row is added. 

DELETE FROM Boat WHERE Bid = 102; -- Query fails since Bid is a foreign key in Reserves table and is refered in that table.
DELETE FROM Sailor WHERE Sid = 71; -- Query executes successfully since even though Sid is a foreign key for Reserves table it is never refered in any row of the table. Hence it can be deleted without any error.
DELETE FROM Reserves WHERE Sid = 22; -- Query executes successfully since there is no columns in sailor and boat table are referes reserves as foreign key.

/*
DROP Table Sailor;   -- Query fails since Sid is a foreign key in Reserves table and is refered in that table.
DROP Table Reserves; -- -- Query executes successfully since there is no columns in sailor and boat table are referes reserves as foreign key.
*/

ALTER TABLE Sailor DROP CONSTRAINT Sailor_pkey; -- Query fails since Sid is also a Foreign Key in Reserves Table. inn order to drop primary key constrain we need to dropn foreign key constrain first.
ALTER TABLE Sailor DROP CONSTRAINT Sailor_pkey CASCADE; -- Query successfully executes since CASCADE drops all the dependent constrains. in this case foreign key constraint on reserves table.

INSERT INTO Sailor VALUES (22, 'Dave', 5, 35); -- Query executes successfully now since primary key constrain is dropped from the table.

ALTER TABLE Sailor ALTER COLUMN Sid DROP NOT NULL; 

INSERT INTO Sailor VALUES (NULL,'Sam', 7, 56); -- Query executes successfully since not null constrain is dropped.

ALTER TABLE Reserves DROP CONSTRAINT reserves_bid_fkey;

INSERT INTO Reserves VALUES (10, 10, 'Friday'); -- Query executes successfully since foreign key constrain on reserves table is dropped. Hence there is no need for data added in Sid and Bid column in reserves table to be present in Sailor and Boat table.
DELETE FROM Boat WHERE Bid = 102; --Query executes successfully since foreign key constrain on reserves table is dropped.

ALTER TABLE Reserves DROP CONSTRAINT reserves_pkey;

INSERT INTO Reserves VALUES (22, 101, 'Saturday'); -- Query executes successfully since primary key constrain is dropped

DROP Table Sailor;
DROP Table Boat;
DROP Table Reserves;

-- Dropping Database
\c postgres;

DROP DATABASE aaymshah_adc_1;

