    -------------------------------------------------------------------------------------
	-------------------------------- Exam ==> Question ----------------------------------
    -------------------------------------------------------------------------------------

									  --------------------
									  ------ SELECT ------
									  --------------------
CREATE PROC getAllExamsQuestions
WITH ENCRYPTION 
as
	BEGIN
		select ExamID as "Exam_ID",
			   QuesID as "Question_ID"
		from Exam_Ques
	END

GO
									  --------------------
									  ------ UPDATE ------
									  --------------------
CREATE PROC updateExamQuestion  
								@columnName varchar(30)='', 
								@newVal varchar(30)='',
								@EID int='',
								@QID int=''
								
WITH ENCRYPTION 
AS
	BEGIN
		begin try
			declare @colName varchar(20)=(select 
											case
												when @columnName = 'Exam_ID' then 'ExamID'
												when @columnName = 'Question_ID' then 'QuesID'
												else 'Invalid'
											end
										)
			execute('update Exam_Ques 
						set '+@colName+' = '+@newVal+'
						where ExamID= '+@EID+' and QuesID ='+@QID)		
		end try
		begin catch
			select 'Invalid input or update operation failed' 
		end catch
	END

GO
									  --------------------
									  ------ DELETE ------
									  --------------------
CREATE PROC deleteExamQuestion	@EID int='',
								@QID int=''
								
							   
WITH ENCRYPTION 
AS
	BEGIN
		begin try
			delete from Exam_Ques
			where ExamID = @EID and QuesID = @QID
		end try
		begin catch
			select 'Invalid inputs or deletion procedure failed' 
		end catch
	END

GO
									  --------------------
									  ------ INSERT ------
									  --------------------
CREATE PROC insertExamQuestion @EID int='', 
							   @QID int=''
WITH ENCRYPTION 
AS
	BEGIN
		begin try
			insert into Exam_Ques
			values(@EID, @QID)
		end try
		begin catch
			select 'Invalid input or insertion procedure failed'
		end catch
	END

GO
	--SELECT * FROM Exam
		----------------------------------------------------------------------------------------------
		----------------------------------------------------------------------------------------------
		----------------------------------------------------------------------------------------------





---**********************************************************************************************************************************
    -------------------------------------------------------------------------------------
	------------------------------- STUDENT ==> COURSE ----------------------------------
    -------------------------------------------------------------------------------------

					          --------------------
							  ------ SELECT ------
							  --------------------
CREATE PROC getAllStudentsExamsQuestionsGradesAnswers 
WITH ENCRYPTION 
as
	BEGIN
		select StudID as "Student_ID",
			   ExamID as "Exam_ID",
			   QuesID as "Question_ID",
			   Grade  as "Question_Grade",
			   Answer as "Student_Answer"
		from St_exam_Q_A
	END
GO
					          --------------------
							  ------ UPDATE ------
							  --------------------
CREATE PROC updateStudentExamQuestionGradeAnswer
											@columnName varchar(30)='', 
											@newVal varchar(50)='',
											@SID int='',
											@EID int='', 
											@QID int=''
											
WITH ENCRYPTION 
AS
	BEGIN
		begin try
			declare @colName varchar(20)=(select 
											case
												when @columnName = 'Student_ID' then 'StudID'
												when @columnName = 'Exam_ID' then 'ExamID'
												when @columnName = 'Question_ID' then 'QuesID'
												when @columnName = 'Question_Grade' then 'Grade'
												when @columnName = 'Student_Answer' then 'Answer'
												else 'Invalid'
											end
										)
			if(@columnName='Student_Answer')
			begin
				update St_exam_Q_A 
						 set Answer = @newVal
						 where StudID= @SID and ExamID= @EID and QuesID = @QID
			end
			else
			begin
				execute('update St_exam_Q_A 
						 set '+@colName+' = '+@newVal+'
						 where StudID= '+@SID+' and ExamID= '+@EID+' and QuesID ='+@QID)
			end
			
		end try
		begin catch
			select 'Invalid input or update operation failed' 
		end catch
	END
GO
					          --------------------
							  ------ DELETE ------
							  --------------------
CREATE PROC deleteStudentExamQuestionGradeAnswer @SID int='',
											@EID int='', 
											@QID int=''
WITH ENCRYPTION 
AS
	BEGIN
		begin try
			delete from St_exam_Q_A
			where StudID = @SID and ExamID = @EID and QuesID = @QID
		end try
		begin catch
			select 'Invalid inputs or deletion procedure failed' 
		end catch
	END

GO
					          --------------------
							  ------ INSERT ------
							  --------------------
CREATE PROC insertStudentExamQuestionGradeAnswer @SID int='',
											@EID int='', 
											@QID int='', 
											@Qgrade int = '',
											@answer varchar(50)=''
WITH ENCRYPTION 
AS
	BEGIN
		begin try
			insert into St_exam_Q_A
			values(@SID, @EID, @QID, @Qgrade, @answer)
		end try
		begin catch
			select 'Invalid input or insertion procedure failed'
		end catch
	END

GO
	-------------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------------------------------
	-------------------------------------------------------------------------------------------------



---*******************************************************************************************************************************************

    -------------------------------------------------------------------------------------
	------------------------------- STUDENT ==> COURSE ----------------------------------
    -------------------------------------------------------------------------------------

					          --------------------
							  ------ SELECT ------
							  --------------------
CREATE PROC getAllStudentsperCourses 
WITH ENCRYPTION 
as
	BEGIN
		select StudID as "Student_ID",
			   CourseID as "Course_ID",
			   FullGrade as "Full_Grade",
			   Progress as "Student_Progress"
		from Stud_Course
	END

GO
					          --------------------
							  ------ UPDATE ------
							  --------------------
CREATE PROC updateStudentperCourse
									@columnName varchar(30),
									@newVal varchar(50)='',
									@SID int='', 
									@CID int=''
									
WITH ENCRYPTION 
AS
	BEGIN
		begin try
			declare @colName varchar(20)=(select 
											case
												when @columnName = 'Student_ID' then 'StudID'
												when @columnName = 'Course_ID' then 'CourseID'
												when @columnName = 'Full_Grade' then 'FullGrade'
												when @columnName = 'Student_Progress' then 'Progress'
												else 'Invalid'
											end
										)
			if(@colName='Progress')
			begin
				update Stud_Course 
						 set Progress = @newVal
						 where StudID= @SID and CourseID= @CID
			end
			else
			begin
				execute('update Stud_Course 
						 set '+@colName+' = '+@newVal+'
						 where StudID= '+@SID+' and CourseID= '+@CID)
			end
		end try
		begin catch
			select 'Invalid input or update operation failed' 
		end catch
	END

GO
					          --------------------
							  ------ DELETE ------
							  --------------------
CREATE PROC deleteStudentperCourse 
									@SID int='', 
									@CID int=''
WITH ENCRYPTION 
AS
	BEGIN
		begin try
			delete from Stud_Course
			where StudID = @SID and CourseID = @CID
		end try
		begin catch
			select 'Invalid inputs or deletion procedure failed' 
		end catch
	END

GO

					          --------------------
							  ------ INSERT ------
							  --------------------
CREATE PROC insertStudentperCourse 
								@SID int='', 
								@CID int = '', 
								@fgrade int = '',
								@progress varchar(50) =''
WITH ENCRYPTION 
AS
	BEGIN
		begin try
			insert into Stud_Course
			values(@SID, @CID, @fgrade, @progress)
		end try
		begin catch
			select 'Invalid input or insertion procedure failed'
		end catch
	END

GO

	--------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------


---**********************************************************************************************************************************

    -------------------------------------------------------------------------------------
	------------------------------- STUDENT ==> EXAM ------------------------------------
    -------------------------------------------------------------------------------------


									  --------------------
									  ------ SELECT ------
									  --------------------
CREATE PROC getAllStudentsperExams 
WITH ENCRYPTION 
as
	BEGIN
		select StudID as "Student_ID",
			   ExamID as "Exam_ID",
			   Grade as "Student_Grade",
			   Date_Of_Insertion as "Exam_Date"
		from Stud_Exam
	END
GO
									  --------------------
									  ------ UPDATE ------
									  --------------------
CREATE PROC updateStudentperExam 
								@columnName varchar(30) = '', 
								@val varchar(30)='',	
								@SID int='',
								@EID int=''
								
WITH ENCRYPTION 
AS
	BEGIN
		begin try
			declare @colName varchar(20)=(select 
											case
												when @columnName = 'Student_ID' then 'StudID'
												when @columnName = 'Exam_ID' then 'ExamID'
												when @columnName = 'Student_Grade' then 'Grade'
												when @columnName = 'Exam_Date' then 'Date_Of_Insertion'
												else 'Invalid'
											end
										)
			if(@colName='Date_Of_Insertion')
			begin
				SELECT CAST(@val AS datetime);
				update Stud_Exam
				set Date_Of_Insertion = @val where StudID= @SID and ExamID= @EID
			end
			else
			begin
				execute('update Stud_Exam 
						 set '+@colName+' = '+@val+'
						 where StudID= '+@SID+' and ExamID= '+@EID)
			end
		end try
		begin catch
			select 'Invalid input or update operation failed' 
		end catch
	END
GO
									  --------------------
									  ------ DELETE ------
									  --------------------
CREATE PROC deleteStudentperExam @SID int='', 
								 @EID int=''
WITH ENCRYPTION 
AS
	BEGIN
		begin try
			delete from Stud_Exam
			where StudID = @SID and ExamID = @EID
		end try
		begin catch
			select 'Invalid inputs or deletion procedure failed' 
		end catch
	END
GO
									  --------------------
									  ------ INSERT ------
									  --------------------
CREATE PROC insertStudentperExam @SID int='', 
								 @EID int = '', 
								 @grade int = '', 
								 @date datetime =''
WITH ENCRYPTION 
AS
	BEGIN
		begin try
			insert into Stud_Exam
			values(@SID, @EID, @grade, @date)
		end try
		begin catch
			select 'Invalid input or insertion procedure failed'
		end catch
	END

GO


-----------------------------------------------------------------------------------------------------



----*******************************************************************************************************************************


