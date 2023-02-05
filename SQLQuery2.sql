GO
--1
SELECT S.Sname
FROM S
WHERE S.Status BETWEEN 50 AND 100
GO
--2
SELECT S.Sname
FROM S
WHERE (S.City='Москва')
GO
--3
SELECT T.Price
FROM T, STD
WHERE (T.Tnum = STD.Tnum) AND
(STD.Dnum = 'D1')
GO
--4
SELECT S.Sname, AVG(T.Price * STD.Kolvo) AS AVG_PRICE
FROM T,S, STD, D
WHERE (S.Snum = STD.Snum) AND
(T.Tnum = STD.Tnum)
GROUP BY S.Sname
GO
--5
SELECT D.City, S.City
FROM S, STD, D
WHERE (S.Snum = STD.Snum) AND
(D.Dnum = STD.Dnum)