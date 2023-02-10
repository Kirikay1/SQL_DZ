GO
--1
SELECT Snum
FROM STD
WHERE Snum <> 'S1' AND
Tnum = SOME(SELECT Tnum
			FROM STD
			WHERE Kolvo > SOME(SELECT MAX(Kolvo)
							   FROM STD 
							   WHERE Snum = 'S1'))
GO
--2
SELECT Snum
from S
WHERE S.Status < SOME  (SELECT S.Status
						FROM S
						WHERE Snum = 'S1')
GO
--3
CREATE TABLE TovarTemp(
	Id INT PRIMARY KEY IDENTITY,
	Tname nvarchar(50) NOT NULL
	)
DELETE FROM TovarTemp
INSERT INTO TovarTemp
SELECT T.Tname
FROM T
WHERE T.Price > 1000 AND
T.EdIzm = 'ïà÷êà'
GO
--4
UPDATE T 
SET Price = Price - ((Price / 100) * 15)
WHERE T.EdIzm = 'ïà÷êà, 10 êã'
GO
--5
DELETE FROM S
WHERE Status < 20
