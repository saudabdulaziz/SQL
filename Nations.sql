CREATE TABLE Nations (
	Name varchar(20) NOT NULL,
	Domain varchar(3),
	Capital varchar(20),
	Latitude int,
	N_S char(1),
	Longitude int,
	E_W char(1),
	Interest varchar(20),
	PRIMARY KEY (Name)
	
);

INSERT INTO Nations VALUES ('Ireland', 'IE', 'Dublin', 52, 'N', 7, 'W', 'History');
INSERT INTO Nations VALUES ('Israel', 'IR', 'Jerusalem', 32, 'N', 35, 'E', 'History');
INSERT INTO Nations VALUES ('Italy', 'IT', 'Rome', 42, 'N', 12, 'E', 'Art');
INSERT INTO Nations VALUES ('Jamaica', 'JM', 'Kingston', 18, 'N', 77, 'W', 'Beach');
INSERT INTO Nations VALUES ('Japan', 'JP', 'Tokyo', 35, 'N', 143, 'E', 'Kabuki');
INSERT INTO Nations VALUES ('Gabon', 'GA', 'Libreville', 23, 'N', 927, 'E', 'Swimming');


SELECT * FROM Nations;
SELECT * FROM Nations WHERE Interest = 'BEACH';
SELECT * FROM Nations WHERE (N_S='S' AND Interest='BEACH');
SELECT Name FROM Nations;
SELECT Name, Domain From Nations;
SELECT Name, Domain From Nations WHERE Interest='Kabuki';
SELECT * From Nations Order By Name;
SELECT * FROM Nations ORDER BY Interest DESC;
SELECT Name, Interest From Nations Order By Interest DESC;
SELECT * FROM Nations WHERE Name LIKE 'C%';
SELECT * FROM Nations WHERE Name LIKE '%land';
SELECT * FROM Nations WHERE Name LIKE '%w%';
SELECT * FROM Nations WHERE Name LIKE '_____';
SELECT COUNT(*) FROM Nations WHERE Interest = 'History';

UPDATE Nations SET Interest = 'Reggae' WHERE Name = 'Jamaica';
DELETE FROM Nations WHERE Name = 'Jamaica';