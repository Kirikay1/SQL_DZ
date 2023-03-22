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
	DELETE FROM [LessonObject]
	WHERE [LessonObject].[Id] = @id
END;
GO

--EXEC [LessonObjectDelete] 3
--GO

--4
CREATE PROC [UpdateLessonObjectLessonsAtDay](
    @day NVARCHAR (255),
	@weekId INT,
	@oldLessonObjectId INT,
	@newLessonObjectId INT)
AS
BEGIN
    declare @dayId int = (SELECT MAX(D.[Id]) 
                          FROM DayType DT JOIN [Day] AS D 
                          ON DT.[Type] = LOWER(@day))
	UPDATE [LessonsAtDay] SET [LessonObjectId] = @newLessonObjectId
	WHERE [LessonsAtDay].DayId = @dayId AND
	[LessonsAtDay].WeekId = @weekId AND
	[LessonsAtDay].LessonObjectId = @oldLessonObjectId;
END;
GO
