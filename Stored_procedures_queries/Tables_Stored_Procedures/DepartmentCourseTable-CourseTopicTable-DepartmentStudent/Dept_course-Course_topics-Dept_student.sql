USE [Examination-System]

GO
---------------------------------1. DEPT_COURSE-----------------------------
--------------------------------DISPLAY THE DATA----------------------------
CREATE PROCEDURE getAllDepartmentscourse
WITH ENCRYPTION
AS
BEGIN
	SELECT 
		CourseID AS Course_ID, 
		DeptID AS Departement_ID ,
		Date_Of_Insertion AS Insertion_Date
	FROM Dept_Course
END

GO


---------------------INSERT RETATION BETWEEN DEPT AND COURSE------------------

CREATE PROCEDURE insertDepartmentCourse
	@COURSE_ID INT, @DEPT_ID INT, @INSERTDATE DATETIME
WITH ENCRYPTION
AS
BEGIN TRY
	INSERT INTO Dept_Course
	SELECT @COURSE_ID, @DEPT_ID, @INSERTDATE
END TRY
BEGIN CATCH
	select 'Invalid input or insertion procedure failed'
END CATCH

GO


--------------CHANGE THE COURSE TO BE ATTACHED TO DIFF DEPARTEMENT-------------

CREATE PROCEDURE updateDepartmentCourse
		@ALiasColumnName VARCHAR(30),
		@ColumnNewValue VARCHAR(30),		
		@ConditionValue1 VARCHAR(20),
		@ConditionValue2 VARCHAR(20)
WITH ENCRYPTION
AS
BEGIN TRY 
		DECLARE @ColumnName VARCHAR(30);
		DECLARE @ParmDefinition1 NVARCHAR(50);		
		DECLARE @ParmDefinition2 NVARCHAR(50);

			IF @ALiasColumnName='Course_ID'				
				SELECT @ColumnName='CourseID',@ParmDefinition1=N'@ColumnNewValue INT'
			ELSE IF @ALiasColumnName='Departement_ID'				
				SELECT @ColumnName='DeptID',@ParmDefinition1=N'@ColumnNewValue INT'			
			ELSE IF @ALiasColumnName='Insertion_Date'				
				SELECT @ColumnName='Date_Of_Insertion',@ParmDefinition1=N'@ColumnNewValue DATETIME'						
			ELSE
				SELECT @ColumnName='Invalid',@ParmDefinition1=N'Invalid'

				SELECT @ParmDefinition2=N'@ConditionValue1 INT,@ConditionValue2 INT'
			


		DECLARE @ParmDefinition NVARCHAR(100) = @ParmDefinition1+','+@ParmDefinition2;

		DECLARE @Command NVARCHAR(500)=N'UPDATE Dept_Course SET '+@ColumnName+' = @ColumnNewValue '
										+' WHERE  CourseID =@ConditionValue1 AND DeptID =@ConditionValue2 '		 
		EXEC sp_executesql @Command,@ParmDefinition,@ColumnNewValue,@ConditionValue1,@ConditionValue2


		
END TRY
BEGIN CATCH
	select 'Invalid input or update operation failed' 
END CATCH
GO



-----------------------DELETE COURSE FROM DEPT--------------------------------
CREATE PROCEDURE deletedepartmentCourse
	@COURSE_ID INT,
	@DEPT_ID INT
WITH ENCRYPTION
AS
BEGIN TRY
	DELETE FROM Dept_Course
	WHERE CourseID = @COURSE_ID AND DeptID=@DEPT_ID
		
END TRY
BEGIN CATCH
	select 'Invalid inputs or deletion procedure failed' 
END CATCH
GO

-------------------------------------------------------------------------


-------------------------------------------------------------------------
--------------------------------2. COURSE_TOPICS----------------------------
--------------------------------DISPLAY THE DATA----------------------------
CREATE PROCEDURE getAllCoursesTopics
WITH ENCRYPTION
AS
BEGIN
	SELECT 
		TopicID AS Topic_ID, 
		CourseID AS Course_ID 
	FROM Course_Topics
END

GO
-------------------------------------------------------------------------
---------------------INSERT RETATION BETWEEN COURSE AND TOPIC------------------

CREATE PROCEDURE insertCourseTopic
	@TOPIC_ID INT, @COURSE_ID INT
WITH ENCRYPTION
AS
BEGIN TRY
	INSERT INTO Course_Topics
	SELECT @TOPIC_ID, @COURSE_ID
END TRY
BEGIN CATCH
	select 'Invalid input or insertion procedure failed'
END CATCH
GO
-------------------------------------------------------------------------
--------------CHANGE THE COURSE TO BE ATTACHED TO DIFF TOPIC---------------

CREATE PROCEDURE updateCourseTopic
		@ALiasColumnName VARCHAR(30),
		@ColumnNewValue VARCHAR(20),		
		@ConditionValue VARCHAR(20)
			
WITH ENCRYPTION
AS
BEGIN TRY
		
		DECLARE @ColumnName VARCHAR(30);
		DECLARE @ParmDefinition1 NVARCHAR(50);		
		DECLARE @ParmDefinition2 NVARCHAR(50);


			IF @ALiasColumnName='Topic_ID'				
				SELECT @ColumnName='TopicID',@ParmDefinition1=N'@ColumnNewValue INT'
			ELSE IF @ALiasColumnName='Course_ID'				
				SELECT @ColumnName='CourseID',@ParmDefinition1=N'@ColumnNewValue INT'			
			ELSE
				SELECT @ColumnName='Invalid',@ParmDefinition1=N'Invalid'

			SELECT @ParmDefinition2=N'@ConditionValue INT'
		


		DECLARE @ParmDefinition NVARCHAR(100) = @ParmDefinition1+','+@ParmDefinition2;

		DECLARE @Command NVARCHAR(500)=N'UPDATE Course_Topics SET '+@ColumnName+' = @ColumnNewValue '
										+' WHERE TopicID =@ConditionValue'		 
		EXEC sp_executesql @Command,@ParmDefinition,@ColumnNewValue,@ConditionValue
		
		
END TRY
BEGIN CATCH
	select 'Invalid input or update operation failed' 
END CATCH

GO



-----------------------DELETE COURSE FROM TOPIC------------------------------
CREATE PROCEDURE deleteCourseTopic
	@topic_ID INT
WITH ENCRYPTION
AS
BEGIN TRY
	DELETE FROM Course_Topics
	WHERE TopicID = @topic_ID
END TRY
	BEGIN CATCH
		select 'Invalid inputs or deletion procedure failed' 
	END CATCH

GO


-------------------------------------------------------------------------


------------------------------------------------------------------------

--------------------------------3. DEPT_STUDENT-----------------------------
--------------------------------DISPLAY THE DATA----------------------------
CREATE PROCEDURE getAllDepartmentsStudents
WITH ENCRYPTION
AS
BEGIN
	SELECT
		StudID AS Student_ID,
		DeptID AS Department_ID,
		Date_Of_Insertion AS Insertion_date
	FROM Dept_Stud
END

GO

---------------------INSERT RETATION BETWEEN STUDENT AND DEPT---------------

CREATE PROCEDURE insertDepartmentStudent
	@STUDENT_ID INT,
	@DEPT_ID INT,
	@InsertionDate DATETIME
WITH ENCRYPTION
AS
BEGIN TRY
	INSERT INTO Dept_Stud
	SELECT @STUDENT_ID, @DEPT_ID, @InsertionDate
END TRY
BEGIN CATCH
	select 'Invalid input or insertion procedure failed'
END CATCH


GO

--------------CHANGE THE STUDENT TO BE ATTACHED TO DIFF DEPT--------------

CREATE PROCEDURE updateDepartmentStudent
		@ALiasColumnName VARCHAR(30),
		@ColumnNewValue VARCHAR(30),		
		@ConditionValue1 VARCHAR(20),
		@ConditionValue2 VARCHAR(20)
WITH ENCRYPTION
AS
BEGIN TRY
		
		DECLARE @ColumnName VARCHAR(30);
		DECLARE @ParmDefinition1 NVARCHAR(50);		
		DECLARE @ParmDefinition2 NVARCHAR(50);


		IF @ALiasColumnName='Student_ID'				
			SELECT @ColumnName='StudID',@ParmDefinition1=N'@ColumnNewValue INT'
		ELSE IF @ALiasColumnName='Department_ID'				
			SELECT @ColumnName='DeptID',@ParmDefinition1=N'@ColumnNewValue INT'
		ELSE IF @ALiasColumnName='Insertion_date'				
			SELECT @ColumnName='Date_Of_Insertion',@ParmDefinition1=N'@ColumnNewValue DATETIME'
		ELSE
			SELECT @ColumnName='Invalid',@ParmDefinition1=N'Invalid'


		SELECT @ParmDefinition2=N'@ConditionValue1 INT,@ConditionValue2 INT'

		DECLARE @ParmDefinition NVARCHAR(100) = @ParmDefinition1+','+@ParmDefinition2;

		DECLARE @Command NVARCHAR(500)=N'UPDATE Dept_Stud SET '+@ColumnName+' = @ColumnNewValue '
										+' WHERE StudID =@ConditionValue1 AND DeptID=@ConditionValue2'		 
		EXEC sp_executesql @Command,@ParmDefinition,@ColumnNewValue,@ConditionValue1,@ConditionValue2
		
		
	END TRY
	BEGIN CATCH
		select 'Invalid input or update operation failed' 
	END CATCH

GO


-----------------------DELETE STUDENT FROM DEPT-------------------------------
CREATE PROCEDURE deleteDepartmentStudent
	@STUDENT_ID INT,
	@DEPARTMENT_ID INT
WITH ENCRYPTION
AS
BEGIN TRY 
	DELETE FROM Dept_Stud
	WHERE StudID = @STUDENT_ID AND DeptID=@DEPARTMENT_ID
END TRY 
BEGIN CATCH
		select 'Invalid inputs or deletion procedure failed' 
END CATCH

GO

-------------------------------------------------------------------------


------------------------------------------------------------------------