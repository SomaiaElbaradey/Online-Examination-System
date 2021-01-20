
-----------------------------------------------------------------------------------------
---------------------------------------------Exam_table
-----------INSERT_PROC

CREATE procedure insertExam
	@ExamID int,
	@ExamTitle varchar(20),
	@Duration FLOAT,
	@date datetime
WITH ENCRYPTION
as
begin TRY
	insert into Exam(ExamID,ExamTitle,Duration,date)
	SELECT @ExamID ,@ExamTitle, @Duration,@date
END TRY
BEGIN CATCH
	select 'Invalid input or insertion procedure failed'
END CATCH

GO
-----------------------------------------------------------------------------------------

-----------UPDATE_PROC

CREATE procedure updateExam
		@ALiasColumnName varchar(30),
		@ColumnNewValue varchar(30),		
		@ConditionValue varchar(20)

with encryption
AS
BEGIN TRY
		DECLARE @ColumnName VARCHAR(30);
		DECLARE @ParmDefinition1 NVARCHAR(30);		
		DECLARE @ParmDefinition2 NVARCHAR(30);

			IF @ALiasColumnName='Exam_Num'				
				SELECT @ColumnName='ExamID',@ParmDefinition1=N'@ColumnNewValue INT'
			ELSE IF @ALiasColumnName='Title_of_Exam'				
				SELECT @ColumnName='ExamTitle',@ParmDefinition1=N'@ColumnNewValue VARCHAR(20)'
			ELSE IF @ALiasColumnName='Exam_Duration'				
				SELECT @ColumnName='Duration',@ParmDefinition1=N'@ColumnNewValue FLOAT'
			ELSE IF @ALiasColumnName='Exam_Date'				
				SELECT @ColumnName='date',@ParmDefinition1=N'@ColumnNewValue DATETIME'			
			ELSE
				SELECT @ColumnName='Invalid',@ParmDefinition1=N'Invalid'


				SELECT @ParmDefinition2=N'@ConditionValue INT'
	
		DECLARE @ParmDefinition NVARCHAR(50) = @ParmDefinition1+','+@ParmDefinition2;

		DECLARE @Command NVARCHAR(500)=N'UPDATE Exam SET '+@ColumnName+' = @ColumnNewValue '
										+' WHERE ExamID =@ConditionValue'		 
		EXEC sp_executesql @Command,@ParmDefinition,@ColumnNewValue,@ConditionValue
		
		
	END TRY
	BEGIN CATCH
		select 'Invalid input or update operation failed' 
	END CATCH

GO

--------------------------------------------------------------------------------------------------

-----------SELECT_PROC

CREATE procedure getAllExams
WITH ENCRYPTION
as
begin
	        SELECT   ExamID AS  Exam_Num,
					 ExamTitle AS  Title_of_Exam,
					 Duration   AS Exam_Duration,
					 date  AS  Exam_Date
            FROM   Exam  		
end

GO
-----------------------------------------------------------------------------------------------------
-----------DELETE_PROC

CREATE proc deleteExam 
 @ExamID int
WITH ENCRYPTION
as 
BEGIN TRY
		DELETE FROM Exam  
        WHERE  ExamID = @ExamID
END TRY

BEGIN CATCH
	select 'Invalid inputs or deletion procedure failed' 
END CATCH

GO

-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------

---------------------------------------------Regis_Inst_table
-----------Insert_PROC

CREATE procedure insertRegisterInstructor
	@InstID int,
	@RegisID int,
	@Date_of_Insertion DATETIME
WITH ENCRYPTION 
as
begin TRY
	insert into Regis_Inst(InstID,RegisID,Date_Of_Insertion)
	SELECT @InstID ,@RegisID, @Date_of_Insertion
END TRY
BEGIN CATCH
	select 'Invalid input or insertion procedure failed'
END CATCH

GO
-------------------------------------------------------------------------
-----------UPDATE_PROC

CREATE procedure updateRegisterInstructor
		@ALiasColumnName VARCHAR(30),
		@ColumnNewValue VARCHAR(50),		
		@ConditionValue1 VARCHAR(20),
		@ConditionValue2 VARCHAR(20)

WITH ENCRYPTION 
AS
BEGIN  TRY 

		DECLARE @ColumnName VARCHAR(30);
		DECLARE @ParmDefinition1 NVARCHAR(50);		
		DECLARE @ParmDefinition2 NVARCHAR(50);

		IF @ALiasColumnName='Instructor_Id'				
			SELECT @ColumnName='InstID',@ParmDefinition1=N'@ColumnNewValue INT'
		ELSE IF @ALiasColumnName='Register_Id'				
			SELECT @ColumnName='RegisID',@ParmDefinition1=N'@ColumnNewValue INT'
		ELSE IF @ALiasColumnName='Insertion_Date'				
			SELECT @ColumnName='Date_Of_Insertion',@ParmDefinition1=N'@ColumnNewValue DATETIME'			
		ELSE
			SELECT @ColumnName='Invalid',@ParmDefinition1=N'Invalid'
							
			SELECT @ParmDefinition2=N'@ConditionValue1 INT,@ConditionValue2 INT'


		DECLARE @ParmDefinition NVARCHAR(100) = @ParmDefinition1+','+@ParmDefinition2;

		DECLARE @Command NVARCHAR(500)=N'UPDATE Regis_Inst SET '+@ColumnName+' = @ColumnNewValue '
										+' WHERE InstID =@ConditionValue1  AND RegisID= @ConditionValue2'		 
		EXEC sp_executesql @Command,@ParmDefinition,@ColumnNewValue,@ConditionValue1,@ConditionValue2
		
END TRY
BEGIN CATCH
	select 'Invalid input or update operation failed' 
END CATCH

GO

-----------------------------------------------------------------------------
-----------SELECT_PROC
create procedure getAllRegisterInstructors
WITH ENCRYPTION
as
begin
	        SELECT  InstID AS Instructor_Id,
					RegisID AS Register_Id,
					Date_Of_Insertion AS Insertion_Date
            FROM   Regis_Inst			
end

GO

----------------------------------------------------------------------------
-----------DLETE_PROC
Create proc deleteRegisterInstructor
@InstID int,
@registerID int
WITH ENCRYPTION
as 
BEGIN TRY
		DELETE FROM Regis_Inst  
        WHERE  InstID = @InstID AND RegisID=@registerID
END TRY
BEGIN CATCH
	select 'Invalid inputs or deletion procedure failed' 
END CATCH
GO

----------------------------------------------------------------------------



----------------------------------------------------------------------------
----------------------------------------------------------------------------
---------------------------------Regis_Stud_Table --------------------------------

---------INSERT PROC------
CREATE procedure insertRegisterStudent
	@StudId int,
	@RegisID int,
	@Date_Of_Insertion DATETIME
WITH ENCRYPTION 
as
begin TRY
	insert into Regis_Stud(StudId,RegisID,Date_Of_Insertion)
	SELECT 	@StudId ,@RegisID ,@Date_Of_Insertion 
END TRY

BEGIN CATCH
	select 'Invalid input or insertion procedure failed'
END CATCH

GO
---------------------------------------------------------------------------------

CREATE procedure updateRegisterStudent
		@ALiasColumnName VARCHAR(30),
		@ColumnNewValue VARCHAR(50),		
		@ConditionValue1 VARCHAR(20),
		@ConditionValue2 VARCHAR(20)
WITH ENCRYPTION 
AS
BEGIN TRY 

		DECLARE @ColumnName VARCHAR(30);
		DECLARE @ParmDefinition1 NVARCHAR(50);		
		DECLARE @ParmDefinition2 NVARCHAR(50);

			IF @ALiasColumnName='Student_Id'				
				SELECT @ColumnName='StudId',@ParmDefinition1=N'@ColumnNewValue INT'
			ELSE IF @ALiasColumnName='Register_ID'				
				SELECT @ColumnName='RegisID',@ParmDefinition1=N'@ColumnNewValue INT'
			ELSE IF @ALiasColumnName='Insertion_Date'				
				SELECT @ColumnName='Date_Of_Insertion',@ParmDefinition1=N'@ColumnNewValue DATETIME'			
			ELSE
				SELECT @ColumnName='Invalid',@ParmDefinition1=N'Invalid'
			
			SELECT @ParmDefinition2=N'@ConditionValue1 INT, @ConditionValue2 INT'

		DECLARE @ParmDefinition NVARCHAR(100) = @ParmDefinition1+','+@ParmDefinition2;

		DECLARE @Command NVARCHAR(500)=N'UPDATE Regis_Stud SET '+@ColumnName+' = @ColumnNewValue '
									+' WHERE StudId =@ConditionValue1 AND RegisID=@ConditionValue2'		 
		EXEC sp_executesql @Command,@ParmDefinition,@ColumnNewValue,@ConditionValue1,@ConditionValue2
		
END TRY
BEGIN CATCH
	select 'Invalid input or update operation failed' 
END CATCH

GO
----------------------------------------------------------------------------------------------

CREATE procedure getAllRegisterStudents
WITH ENCRYPTION
as
begin
	        SELECT   StudId AS Student_Id,
					 RegisID AS Register_ID,
					 Date_Of_Insertion AS Insertion_Date
            FROM   Regis_Stud  			
end

GO
----------------------------------------------------------------------------------------------------

CREATE proc deleteRegisterStudent
 @StudId int,
 @RegId int
 WITH ENCRYPTION
 as 
 BEGIN TRY
			DELETE FROM Regis_Stud  
            WHERE  StudId = @StudId AND RegisID=@RegId
 END TRY
 BEGIN CATCH
	select 'Invalid inputs or deletion procedure failed' 
 END CATCH
 GO

----------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------
