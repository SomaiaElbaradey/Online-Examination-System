USE [Examination-System]

GO
---------------------------------Table Student --------------------------

---Select Proc From Student---

CREATE PROC getAllStudents
WITH ENCRYPTION
AS 
	SELECT 
		SID AS 'Student_Id',
		fname AS 'First_Name',
		lname AS 'Last_Name',
		age AS 'Student_Age',
		address AS 'Student_Address'
	FROM Student

GO

--*************************************

---Insert Proc From Student---

CREATE PROC insertStudent
			@Student_Id INT,
			@First_Name VARCHAR(20),
			@Last_Name varchar(20),
			@Student_Age INT,
			@Student_Address VARCHAR(30)
WITH ENCRYPTION 
AS 
	BEGIN TRY
		 INSERT INTO Student
		 VALUES (@Student_Id,@First_Name,@Last_Name,@Student_Age,@Student_Address) 
	END TRY
	BEGIN CATCH
		select 'Invalid input or insertion procedure failed'
	END CATCH

GO

--*************************************

--- Update Proc to Student---

CREATE PROC updateStudent 
		@ALiasColumnName VARCHAR(30),
		@ColumnNewValue VARCHAR(30),		
		@ConditionValue VARCHAR(30)
			
WITH ENCRYPTION
AS
	BEGIN TRY
		
		DECLARE @ColumnName VARCHAR(30);
		DECLARE @ParmDefinition1 NVARCHAR(50);		
		DECLARE @ParmDefinition2 NVARCHAR(50);


			IF @ALiasColumnName='Student_Id'				
				SELECT @ColumnName='SID',@ParmDefinition1=N'@ColumnNewValue INT'
			ELSE IF @ALiasColumnName='First_Name'				
				SELECT @ColumnName='fname',@ParmDefinition1=N'@ColumnNewValue VARCHAR(20)'
			ELSE IF @ALiasColumnName='Last_Name'				
				SELECT @ColumnName='lname',@ParmDefinition1=N'@ColumnNewValue VARCHAR(20)'
			ELSE IF @ALiasColumnName='Student_Age'				
				SELECT @ColumnName='age',@ParmDefinition1=N'@ColumnNewValue INT'
			ELSE IF @ALiasColumnName='Student_Address'				
				SELECT @ColumnName='address',@ParmDefinition1=N'@ColumnNewValue VARCHAR(30)'
			ELSE
				SELECT @ColumnName='Invalid',@ParmDefinition1=N'Invalid'


							
				SELECT @ParmDefinition2=N'@ConditionValue INT'
			


		DECLARE @ParmDefinition NVARCHAR(100) = @ParmDefinition1+','+@ParmDefinition2;

		DECLARE @Command NVARCHAR(500)=N'UPDATE Student SET '+@ColumnName+' = @ColumnNewValue '
										+' WHERE SID =@ConditionValue'		 
		EXEC sp_executesql @Command,@ParmDefinition,@ColumnNewValue,@ConditionValue
		
		
	END TRY
	BEGIN CATCH
		select 'Invalid input or update operation failed'
	END CATCH

GO

--*************************************

---Delete Proc From Student---

CREATE PROC deleteStudent				
		@ConditionValue INT
			
WITH ENCRYPTION
AS
	BEGIN TRY
				
		DELETE FROM Student  WHERE SID = @ConditionValue
	
	END TRY
	BEGIN CATCH
		select 'Invalid inputs or deletion procedure failed'
	END CATCH
GO

--*************************************



-------------------------------------------------------------------------
-------------------------------------------------------------------------
---------------------------------Table Department -----------------------------

---Select Proc From Department---

CREATE PROC getAllDepartments
WITH ENCRYPTION
AS 
	SELECT 
		DeptId AS 'Department_Id',
		DeptName AS 'Department_Name'
		
	FROM Department

GO

--*************************************

---Insert Proc From Department---

CREATE PROC insertDepartment
			@Department_Id INT,
			@Department_Name VARCHAR(50)
			
WITH ENCRYPTION 
AS 
	BEGIN TRY
		 INSERT INTO Department
		 VALUES (@Department_Id,@Department_Name) 
	END TRY
	BEGIN CATCH
		select 'Invalid input or insertion procedure failed'
	END CATCH

GO

--*************************************

--- Update Proc to Department---

CREATE PROC updateDepartment
		@ALiasColumnName VARCHAR(30),
		@ColumnNewValue VARCHAR(50),		
		@ConditionValue VARCHAR(30)
			
WITH ENCRYPTION
AS
	BEGIN TRY
		
		DECLARE @ColumnName VARCHAR(30);
		DECLARE @ParmDefinition1 NVARCHAR(50);		
		DECLARE @ParmDefinition2 NVARCHAR(50);


			IF @ALiasColumnName='Department_Id'				
				SELECT @ColumnName='DeptId',@ParmDefinition1=N'@ColumnNewValue INT'
			ELSE IF @ALiasColumnName='Department_Name'				
				SELECT @ColumnName='DeptName',@ParmDefinition1=N'@ColumnNewValue VARCHAR(50)'			
			ELSE
				SELECT @ColumnName='Invalid',@ParmDefinition1=N'Invalid'


			
				SELECT @ParmDefinition2=N'@ConditionValue INT'
			


		DECLARE @ParmDefinition NVARCHAR(100) = @ParmDefinition1+','+@ParmDefinition2;

		DECLARE @Command NVARCHAR(500)=N'UPDATE Department SET '+@ColumnName+' = @ColumnNewValue '
										+' WHERE  DeptId =@ConditionValue'		 
		EXEC sp_executesql @Command,@ParmDefinition,@ColumnNewValue,@ConditionValue
		
		
	END TRY
	BEGIN CATCH
		select 'Invalid input or update operation failed'
	END CATCH
GO
--*************************************

---Delete Proc From Department---

CREATE PROC deleteDepartment				
		@ConditionValue INT
			
WITH ENCRYPTION
AS
	BEGIN TRY
		
		DELETE FROM Department  WHERE DeptId = @ConditionValue
		

	END TRY
	BEGIN CATCH
		select 'Invalid inputs or deletion procedure failed'
	END CATCH

GO
--*************************************




-------------------------------------------------------------------------
-------------------------------------------------------------------------
---------------------------------Table Topic -----------------------------

---Select Proc From Topic---

CREATE PROC getAllTopics
WITH ENCRYPTION
AS 
	SELECT 
		TID AS 'Topic_Id',
		TopName AS 'Topic_Name'
		
	FROM Topic
GO
--*************************************

---Insert Proc From Topic---

CREATE PROC insertTopic
			@Topic_Id INT,
			@Topic_Name VARCHAR(100)
			
WITH ENCRYPTION 
AS 
	BEGIN TRY
		 INSERT INTO Topic
		 VALUES (@Topic_Id,@Topic_Name) 
	END TRY
	BEGIN CATCH
		select 'Invalid input or insertion procedure failed'
	END CATCH


GO
--*************************************

--- Update Proc to Topic---

CREATE PROC updateTopic
		@ALiasColumnName VARCHAR(30),
		@ColumnNewValue VARCHAR(100),		
		@ConditionValue VARCHAR(30)
			
WITH ENCRYPTION
AS
	BEGIN TRY
		
		DECLARE @ColumnName VARCHAR(30);
		DECLARE @ParmDefinition1 NVARCHAR(50);		
		DECLARE @ParmDefinition2 NVARCHAR(50);


			IF @ALiasColumnName='Topic_Id'				
				SELECT @ColumnName='TID',@ParmDefinition1=N'@ColumnNewValue INT'
			ELSE IF @ALiasColumnName='Topic_Name'				
				SELECT @ColumnName='TopName',@ParmDefinition1=N'@ColumnNewValue VARCHAR(100)'			
			ELSE
				SELECT @ColumnName='Invalid',@ParmDefinition1=N'Invalid'


		
				SELECT @ParmDefinition2=N'@ConditionValue INT'
		


		DECLARE @ParmDefinition NVARCHAR(100) = @ParmDefinition1+','+@ParmDefinition2;

		DECLARE @Command NVARCHAR(500)=N'UPDATE Topic SET '+@ColumnName+' = @ColumnNewValue '
										+' WHERE TID =@ConditionValue'		 
		EXEC sp_executesql @Command,@ParmDefinition,@ColumnNewValue,@ConditionValue
		
		
	END TRY
	BEGIN CATCH
		select 'Invalid input or update operation failed'
	END CATCH

GO

--*************************************

---Delete Proc From Topic---

CREATE PROC deleteTopic				
		@ConditionValue INT
			
WITH ENCRYPTION
AS
	BEGIN TRY
		

		DELETE FROM Topic  WHERE TID = @ConditionValue	 		


	END TRY
	BEGIN CATCH
		select 'Invalid inputs or deletion procedure failed'
	END CATCH

GO
--*************************************


-------------------------------------------------------------------------
-------------------------------------------------------------------------
---------------------------------Table Course-----------------------------
---Select Proc From Course---

CREATE PROC getAllCourses
WITH ENCRYPTION
AS 
	SELECT 
		CrsID AS 'Course_Id',
		CrsName AS 'Course_Name',
		InstID AS 'Instructor_ID'
		
	FROM Course

GO
--*************************************

---Insert Proc From Course---

CREATE PROC insertCourse
			@Course_Id INT,
			@Course_Name VARCHAR(50),
			@Instructor_ID INT
			
WITH ENCRYPTION 
AS 
	BEGIN TRY
		 INSERT INTO Course
		 VALUES (@Course_Id,@Course_Name,@Instructor_ID) 
	END TRY
	BEGIN CATCH
		select 'Invalid input or insertion procedure failed'
	END CATCH

GO

--*************************************

--- Update Proc to Course---

CREATE PROC updateCourse
		@ALiasColumnName VARCHAR(30),
		@ColumnNewValue VARCHAR(50),		
		@ConditionValue VARCHAR(30)
			
WITH ENCRYPTION
AS
	BEGIN TRY
		
		DECLARE @ColumnName VARCHAR(30);
		DECLARE @ParmDefinition1 NVARCHAR(50);		
		DECLARE @ParmDefinition2 NVARCHAR(50);


			IF @ALiasColumnName='Course_Id'				
				SELECT @ColumnName='CrsID',@ParmDefinition1=N'@ColumnNewValue INT'
			ELSE IF @ALiasColumnName='Course_Name'				
				SELECT @ColumnName='CrsName',@ParmDefinition1=N'@ColumnNewValue VARCHAR(50)'
			ELSE IF @ALiasColumnName='Instructor_ID'				
				SELECT @ColumnName='InstID',@ParmDefinition1=N'@ColumnNewValue INT'
			ELSE
				SELECT @ColumnName='Invalid',@ParmDefinition1=N'Invalid'


			
				SELECT @ParmDefinition2=N'@ConditionValue INT'
			


		DECLARE @ParmDefinition NVARCHAR(100) = @ParmDefinition1+','+@ParmDefinition2;

		DECLARE @Command NVARCHAR(500)=N'UPDATE Course SET '+@ColumnName+' = @ColumnNewValue '
										+' WHERE CrsID =@ConditionValue'		 
		EXEC sp_executesql @Command,@ParmDefinition,@ColumnNewValue,@ConditionValue
		
		
	END TRY
	BEGIN CATCH
		select 'Invalid input or update operation failed'
	END CATCH

GO
--*************************************

---Delete Proc From Course---

CREATE PROC deleteCourse		
		@ConditionValue INT
			
WITH ENCRYPTION
AS
	BEGIN TRY
	

		DELETE FROM Course  WHERE CrsID= @ConditionValue
		


	END TRY
	BEGIN CATCH
		select 'Invalid inputs or deletion procedure failed'
	END CATCH

GO
--*************************************



