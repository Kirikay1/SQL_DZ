--1
CREATE PROC[LectureAdd]
	@name  NVARCHAR (255),
    @midlename NVARCHAR (255),
    @lastname    NVARCHAR (255),
	@description NVARCHAR (255) 
    AS
BEGIN
	INSERT INTO [Lecturer] ([Name], [MiddleName], [LastName], [Description])
	VALUES (@name, @midlename, @lastname, @description);
END
GO

--EXEC [LectureAdd] 'maks', 'maksov', 'maksovich', 'kirfdjm'
--GO

CREATE PROC [LessonObjectAdd]
	@lecturerId INT,
	@name NVARCHAR(255),
	@description NVARCHAR(255)
    AS
BEGIN
	INSERT INTO [LessonObject]([LecturerId], [Name], [Description])
	VALUES (@lecturerId, @name, @description)
END
GO

--EXEC [LessonObjectAdd] '1', 'BD', 'DFRGD'
--GO

--2
CREATE FUNCTION [LecturerId](
	@name NVARCHAR(255),
	@middlename NVARCHAR(255),
	@lastname NVARCHAR(255)
)
RETURNS INT 
AS
BEGIN
	DECLARE @id INT = (SELECT [Lecturer].[Id] 
						FROM Lecturer
						WHERE [Name] = @name 
						AND [MiddleName] = @middlename
						AND [LastName] = @lastname)
	RETURN @id;
END;
GO

--DECLARE @id INT;
--EXEC @id = [LecturerId] 'maks', 'maksov', 'maksovich' 
--PRINT @id
--GO

CREATE FUNCTION [LessonObjectId](
	@name NVARCHAR(255)
)
RETURNS INT 
AS
BEGIN
	DECLARE @id INT = (SELECT [LessonObject].[Id] 
						FROM [LessonObject]
						WHERE [Name] = @name)
	RETURN @id;
END;
GO

--DECLARE @id INT;
--EXEC @id = [LessonObjectId] 'BD'
--PRINT @id
--GO

--3
CREATE PROC [LecturerDelete]
	@id INT
AS
BEGIN
	DELETE FROM [LessonsAtDay]
	WHERE LessonObjectId = (SELECT Id FROM [LessonObject]) AND
	(SELECT LecturerId FROM [LessonObject]) = @id
	DELETE FROM [LessonObject]
	WHERE [LessonObject].[LecturerId] = @id
	DELETE FROM [Lecturer]
	WHERE [Lecturer].[Id] = @id
END;
GO

--EXEC [LecturerDelete] 2
--GO

CREATE PROC [LessonObjectDelete]
	@id INT
AS
BEGIN
	DELETE FROM [LessonsAtDay]
	WHERE [LessonsAtDay].[LessonObjectId] = @id
	DELETE FROM [LessonObject]
	WHERE [LessonObject].[Id] = @id
END;
GO

--EXEC [LessonObjectDelete] 3
--GO

--4
CREATE PROC [UpdateLessonObjectId] (
	@id INT,
	@oldLessonObjectId INT,
	@newLessonObjectId INT)
AS
BEGIN
	UPDATE [LessonsAtDay] SET [LessonObjectId] = @newLessonObjectId
	WHERE [LessonsAtDay].Id = @id AND
	[LessonsAtDay].LessonObjectId = @oldLessonObjectId;
END;
GO

--EXEC [UpdateLessonObjectId] 8, 3, 2
--GO
