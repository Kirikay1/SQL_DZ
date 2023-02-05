GO
--¹1
SELECT DISTINCT T.Tname
FROM S, STD, T, D
WHERE (S.Snum = STD.Snum) AND
(D.Dnum = STD.Dnum) AND
(T.Tnum = STD.Tnum) AND
(S.City = D.City)
GO
--¹2
SELECT DISTINCT S.Sname
FROM S, STD
WHERE (S.Snum = STD.Snum) AND
(STD.Dnum = 'D1')
GO
--¹3
SELECT DISTINCT S.City, D.City
FROM S, D, STD
WHERE (S.Snum = STD.Snum) AND
(D.Dnum = STD.Dnum) AND
(NOT(S.City = D.City))
GO
--¹4
SELECT DISTINCT T.Tnum
FROM T, STD, S
WHERE (T.Tnum = STD.Tnum) AND
(S.Snum = STD.Snum) AND
S.Status>50
