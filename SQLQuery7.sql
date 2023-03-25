--1
CREATE TRIGGER [insertNumberSix]
ON [LessonObject]
AFTER INSERT
AS 
DECLARE @id int
SET @id = (SELECT Id FROM inserted)
SELECT Id
FROM LessonObject
WHERE @id < 6 AND
Id = @id

INSERT INTO LessonObject([Name], [LecturerId], [Description])
VALUES('CFBCFBCF', 1, 'CFBCBCFGBCFB')
GO

--2
CREATE TRIGGER [DeleteLecturer]
ON [Lecturer]
AFTER DELETE
AS
DECLARE @id int
SET @id = (SELECT Id FROM deleted)
DELETE FROM [LessonObject]
WHERE LecturerId = @id
DELETE FROM [LessonsAtDay]
WHERE LessonObjectId = (SELECT Id FROM [LessonObject]) AND
(SELECT LecturerId FROM [LessonObject]) = @id

DELETE FROM Lecturer 
WHERE Id = 1
GO
