--1
CREATE TRIGGER [GetNumber]
ON [LessonsAtDay]
AFTER INSERT
AS 
DECLARE @id int
SET @id = (SELECT Number FROM inserted)
SELECT DISTINCT Number
FROM LessonsAtDay
WHERE @id < 6 AND
Number = @id

INSERT INTO LessonsAtDay([DayId], [WeekId], [LessonObjectId], [Number])
VALUES(1, 1, 1, 1)
GO

--2
CREATE TRIGGER [DeleteLecturer]
ON [Lecturer]
INSTEAD OF DELETE
AS
DECLARE @id int
SET @id = (SELECT Id FROM deleted)
DELETE FROM [LessonsAtDay]
WHERE LessonObjectId = (SELECT Id FROM [LessonObject]) AND
(SELECT LecturerId FROM [LessonObject]) = @id
DELETE FROM [LessonObject]
WHERE [LessonObject].[LecturerId] = @id
DELETE FROM [Lecturer]
WHERE [Lecturer].[Id] = @id
GO

DELETE FROM Lecturer
WHERE Id = 2
GO
