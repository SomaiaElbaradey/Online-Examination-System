/**********Registrar*******************/
/*---Insert---*/
CREATE procedure insertRegistrar
	@Reg_ID int,
	@email varchar(50),
	@uname varchar(50),
	@pass nchar(50),
	@utype varchar(20)
WITH ENCRYPTION
as
Begin TRY
	INSERT INTO Registrar (RegID ,Email , username, password ,usertype)
	SELECT @Reg_ID, @email, @uname, @pass, @utype
END TRY
BEGIN CATCH
	select 'Invalid input or insertion procedure failed'
END CATCH

GO

--------------------------------------------------------------------------------------
/*---SELECT---*/
CREATE procedure getAllRegistrars
WITH ENCRYPTION
as 
BEGIN
	SELECT	RegID AS Register_Id,
			Email AS Registeration_Email,
			username AS Registeration_Name,
			password AS Registeration_Password,
			usertype AS Registeration_type
		   
	FROM Registrar
END

GO

--------------------------------------------------------------------------------------
/*---UPDATE---*/
CREATE procedure updateRegistrar
		@ALiasColumnName VARCHAR(30),
		@ColumnNewValue VARCHAR(50),		
		@ConditionValue VARCHAR(20)
WITH ENCRYPTION
as
BEGIN TRY
		
		DECLARE @ColumnName VARCHAR(30);
		DECLARE @ParmDefinition1 NVARCHAR(50);		
		DECLARE @ParmDefinition2 NVARCHAR(50);
	

			IF @ALiasColumnName='Register_Id'				
				SELECT @ColumnName='RegID',@ParmDefinition1=N'@ColumnNewValue INT'
			ELSE IF @ALiasColumnName='Registeration_Email'				
				SELECT @ColumnName='Email',@ParmDefinition1=N'@ColumnNewValue VARCHAR(50)'
			ELSE IF @ALiasColumnName='Registeration_Name'				
				SELECT @ColumnName='username',@ParmDefinition1=N'@ColumnNewValue VARCHAR(50)'
			ELSE IF @ALiasColumnName='Registeration_Password'				
				SELECT @ColumnName='password',@ParmDefinition1=N'@ColumnNewValue NCHAR(50)'
			ELSE IF @ALiasColumnName='Registeration_type'				
				SELECT @ColumnName='usertype',@ParmDefinition1=N'@ColumnNewValue VARCHAR(20)'
			ELSE
				SELECT @ColumnName='Invalid',@ParmDefinition1=N'Invalid'


				SELECT @ParmDefinition2=N'@ConditionValue INT'

		DECLARE @ParmDefinition NVARCHAR(100) = @ParmDefinition1+','+@ParmDefinition2;

		DECLARE @Command NVARCHAR(500)=N'UPDATE Registrar SET '+@ColumnName+' = @ColumnNewValue '
										+' WHERE RegID =@ConditionValue'		 
		EXEC sp_executesql @Command,@ParmDefinition,@ColumnNewValue,@ConditionValue

END TRY
BEGIN CATCH
	select 'Invalid input or update operation failed' 
END CATCH

GO

--------------------------------------------------------------------------------------
/*---DELETE---*/
CREATE procedure deleteRigstrar
	@Reg_ID int
WITH ENCRYPTION
as
BEGIN TRY
	delete from Registrar
	where RegID = @Reg_ID
END TRY
BEGIN CATCH
	select 'Invalid inputs or deletion procedure failed' 
END CATCH

GO
--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

/*******************************QUESTIONS********************************/
/*---INSERT INTO---*/
CREATE procedure insertQuestion
	@Q_ID int,
	@Ques_Text varchar(200),
	@type varchar(10),
	@Model_Ans varchar(30),
	@CrsID int ,
	@adv_Level varchar(50)
WITH ENCRYPTION
as
BEGIN TRY
	INSERT INTO Question (QID , QuesText ,Type , ModelAns , CrsID, advLevel)
	SELECT @Q_ID,@Ques_Text,@type,@Model_Ans,@CrsID,@adv_Level
END TRY
BEGIN CATCH
	select 'Invalid input or insertion procedure failed'
END CATCH

GO

--------------------------------------------------------------------------------------

/*---SELECT---*/
CREATE procedure getAllQuestions
WITH ENCRYPTION
as 
BEGIN
	SELECT	QID AS Question_Id,
			QuesText AS  Question,
			Type AS Question_type,
			ModelAns As Answer,
			CrsID AS Course_Id,
			advLevel As Question_Level
	FROM Question
END

GO
--------------------------------------------------------------------------------------
/*---Update---*/
CREATE procedure updateQuestion
		@ALiasColumnName VARCHAR(30),
		@ColumnNewValue VARCHAR(200),		
		@ConditionValue VARCHAR(30)
WITH ENCRYPTION
as 
BEGIN TRY
		
		DECLARE @ColumnName VARCHAR(30);
		DECLARE @ParmDefinition1 NVARCHAR(50);		
		DECLARE @ParmDefinition2 NVARCHAR(50);

			IF @ALiasColumnName='Question_Id'				
				SELECT @ColumnName='QID',@ParmDefinition1=N'@ColumnNewValue INT'
			ELSE IF @ALiasColumnName='Question'				
				SELECT @ColumnName='QuesText',@ParmDefinition1=N'@ColumnNewValue VARCHAR(200)'
			ELSE IF @ALiasColumnName='Question_type'				
				SELECT @ColumnName='Type',@ParmDefinition1=N'@ColumnNewValue VARCHAR(10)'
			ELSE IF @ALiasColumnName='Answer'				
				SELECT @ColumnName='ModelAns',@ParmDefinition1=N'@ColumnNewValue VARCHAR(30)'
			ELSE IF @ALiasColumnName='Course_Id'				
				SELECT @ColumnName='CrsID',@ParmDefinition1=N'@ColumnNewValue INT'
			ELSE IF @ALiasColumnName='Question_Level'				
				SELECT @ColumnName='advLevel',@ParmDefinition1=N'@ColumnNewValue VARCHAR(50)'
			ELSE
				SELECT @ColumnName='Invalid',@ParmDefinition1=N'Invalid'


				SELECT @ParmDefinition2=N'@ConditionValue INT'
			


		DECLARE @ParmDefinition NVARCHAR(100) = @ParmDefinition1+','+@ParmDefinition2;

		DECLARE @Command NVARCHAR(500)=N'UPDATE Question SET '+@ColumnName+' = @ColumnNewValue '
										+' WHERE QID =@ConditionValue'		 
		EXEC sp_executesql @Command,@ParmDefinition,@ColumnNewValue,@ConditionValue
END TRY
	BEGIN CATCH
		select 'Invalid input or update operation failed' 
	END CATCH

GO



--------------------------------------------------------------------------------------
/*---DELETE---*/
CREATE procedure deleteQuestion
	@Q_ID int
WITH ENCRYPTION
as
BEGIN TRY
	delete from Question
	where QID = @Q_ID
END TRY
BEGIN CATCH
	select 'Invalid inputs or deletion procedure failed' 
END CATCH
GO
--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------


/**********************Instructor***************************/
/*---INSERT---*/
CREATE procedure insertInstructor
	@Inst_ID int,
	@F_name varchar(20),
	@L_name varchar(20),
	@Age int,
	@Address varchar(30)
WITH ENCRYPTION
as 
BEGIN TRY
	INSERT INTO Instructor (InstID ,fname,lname,age,address)
	SELECT @Inst_ID,@F_name , @L_name , @Age , @Address
END TRY
BEGIN CATCH
	select 'Invalid input or insertion procedure failed'
END CATCH

GO

--------------------------------------------------------------------------------------
/*---SELECT---*/
CREATE procedure getAllInstructors
WITH ENCRYPTION
as 
BEGIN
	SELECT	InstID AS Instructor_Id,
			fname AS First_Name,
			lname AS Last_Name,
			age AS Instructor_Age,
			address As Instructor_Address
				
	FROM Instructor
END

GO

--------------------------------------------------------------------------------------

/*---UPDATE---*/
CREATE procedure updateInstructor
		@ALiasColumnName VARCHAR(30),
		@ColumnNewValue VARCHAR(30),		
		@ConditionValue VARCHAR(20)
WITH ENCRYPTION
as 
BEGIN TRY
		DECLARE @ColumnName VARCHAR(30);
		DECLARE @ParmDefinition1 NVARCHAR(50);		
		DECLARE @ParmDefinition2 NVARCHAR(50);

			IF @ALiasColumnName='Instructor_Id'				
				SELECT @ColumnName='InstID',@ParmDefinition1=N'@ColumnNewValue INT'
			ELSE IF @ALiasColumnName='First_Name'				
				SELECT @ColumnName='fname',@ParmDefinition1=N'@ColumnNewValue VARCHAR(20)'			
			ELSE IF @ALiasColumnName='Last_Name'				
				SELECT @ColumnName='lname',@ParmDefinition1=N'@ColumnNewValue VARCHAR(20)'			
			ELSE IF @ALiasColumnName='Instructor_Age'				
				SELECT @ColumnName='age',@ParmDefinition1=N'@ColumnNewValue INT'			
			ELSE IF @ALiasColumnName='Instructor_Address'				
				SELECT @ColumnName='address',@ParmDefinition1=N'@ColumnNewValue VARCHAR(30)'
			ELSE
				SELECT @ColumnName='Invalid',@ParmDefinition1=N'Invalid'

			
			SELECT @ParmDefinition2=N'@ConditionValue INT'

		DECLARE @ParmDefinition NVARCHAR(100) = @ParmDefinition1+','+@ParmDefinition2;

		DECLARE @Command NVARCHAR(500)=N'UPDATE Instructor SET '+@ColumnName+' = @ColumnNewValue '
										+' WHERE  InstID =@ConditionValue'		 
		EXEC sp_executesql @Command,@ParmDefinition,@ColumnNewValue,@ConditionValue

END TRY
BEGIN CATCH
	select 'Invalid input or update operation failed' 
END CATCH

GO
--------------------------------------------------------------------------------------
/*---DELETE---*/
CREATE procedure deleteInstructor
	@Inst_ID int
WITH ENCRYPTION
as
BEGIN TRY
	delete from Instructor
	where InstID = @Inst_ID
END TRY
BEGIN CATCH
	select 'Invalid inputs or deletion procedure failed' 
END CATCH

GO

--------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
/***********************ANSWER**************************/
/*---INSERT---*/
CREATE procedure insertAnswer
		@Ans_Id int,
		@Ans_Text varchar(30),
		@Q_ID int
WITH ENCRYPTION
as
BEGIN TRY
	INSERT INTO Answer (AnsId ,AnsText, QID)
	SELECT @Ans_Id, @Ans_Text, @Q_ID
END TRY
BEGIN CATCH
	select 'Invalid input or insertion procedure failed'
END CATCH

GO

--------------------------------------------------------------------------------------

/*---SELECT---*/
CREATE procedure getAllAnswers
WITH ENCRYPTION
as
BEGIN
	SELECT	AnsId AS Answer_Num,
			AnsText AS Answer,
			QID AS Question_ID
	FROM Answer
END
GO


--------------------------------------------------------------------------------------
/*---UPDATE---*/
CREATE procedure updateAnswer
		@ALiasColumnName VARCHAR(30),
		@ColumnNewValue VARCHAR(30),		
		@ConditionValue VARCHAR(20)
WITH ENCRYPTION
as
BEGIN TRY
		
		DECLARE @ColumnName VARCHAR(30);
		DECLARE @ParmDefinition1 NVARCHAR(50);		
		DECLARE @ParmDefinition2 NVARCHAR(50);

			IF @ALiasColumnName='Answer_Num'				
				SELECT @ColumnName='AnsId',@ParmDefinition1=N'@ColumnNewValue INT'
			ELSE IF @ALiasColumnName='Answer'				
				SELECT @ColumnName='AnsText',@ParmDefinition1=N'@ColumnNewValue VARCHAR(30)'			
			ELSE IF @ALiasColumnName='Question_ID'				
				SELECT @ColumnName='QID',@ParmDefinition1=N'@ColumnNewValue INT'						
			ELSE
				SELECT @ColumnName='Invalid',@ParmDefinition1=N'Invalid'



			SELECT @ParmDefinition2=N'@ConditionValue INT'
			


		DECLARE @ParmDefinition NVARCHAR(100) = @ParmDefinition1+','+@ParmDefinition2;

		DECLARE @Command NVARCHAR(500)=N'UPDATE Answer SET '+@ColumnName+' = @ColumnNewValue '
										+' WHERE  AnsId =@ConditionValue'		 
		EXEC sp_executesql @Command,@ParmDefinition,@ColumnNewValue,@ConditionValue
		
END TRY
BEGIN CATCH
	select 'Invalid input or update operation failed' 
END CATCH
GO

--------------------------------------------------------------------------------------

/*---DELETE---*/
CREATE procedure deleteAnswer
	@Ans_Id int
WITH ENCRYPTION
as
BEGIN TRY
	delete from Answer
	where AnsId = @Ans_Id
		
END TRY
BEGIN CATCH
	select 'Invalid inputs or deletion procedure failed' 
END CATCH
GO

--------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------