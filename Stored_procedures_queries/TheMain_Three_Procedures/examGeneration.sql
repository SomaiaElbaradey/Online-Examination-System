ALTER PROC examGeneration @courseID int=1, @tfNum int=5, @mcqNum int=5
WITH ENCRYPTION
AS
BEGIN	
	begin try
	-- Generate random number of the mcq questions
		declare @AllQuestions table(id int, q varchar(200), qt varchar(10), ans varchar(30), course int, ql varchar(50))
		insert into @AllQuestions(id, q, qt, ans, course, ql)
		EXEC('getAllQuestions')
		
		declare @Nmcq int = (select count(*) from @AllQuestions where course = @courseID and qt='MCQ')
		if(@Nmcq < @mcqNum)
			begin 
				select 'MCQ questions is not enough'
				return
			end
		declare @mcqTemp table (id int, q varchar(200), qt varchar(10), ans varchar(30), course int, ql varchar(50))
		insert @mcqTemp(id, q, qt, ans, course, ql)
		select top(@mcqNum)*
		from @AllQuestions
		where qt = 'MCQ' and course = @courseID
		order by newid()
		
	-- Generate random number of the true/false questions
		declare @TFmcq int = (select count(*) from @AllQuestions where course = @courseID and qt='T/F')
		if(@TFmcq < @tfNum)
			begin 
				select 'True/False questions is not enough'
				return
			end
		declare @tfTemp table (id int, q varchar(200), qt varchar(10), ans varchar(30), course int, ql varchar(50))
		insert @tfTemp(id, q, qt, ans, course, ql)
		select top(@tfNum)*
		from @AllQuestions
		where qt = 'T/F'and course = @courseID
		order by newid()	
	-- Union the 2 tables
		declare @examQuestions table (id int, q varchar(200), qt varchar(10), ans varchar(30), course int, ql varchar(50))
		insert into @examQuestions (id, q, qt, ans,course, ql)
		select * from @tfTemp
		union
		select * from @mcqTemp	
	-- Adding new Exam to Exam Table
		declare @allExams table (en int, te varchar(30), ed float, edate datetime)
		insert into @allExams (en, te, ed, edate)
		exec('getAllExams')
		declare @newExamID int = (select max(en) from @allExams)+1
		insert into Exam(ExamID, ExamTitle)
		values(@newExamID, CONCAT('Untitled Exam ',@newExamID))
	-- Adding questions to Exam (@newExamID)
		declare question_cursor cursor 
		for select id
			from @examQuestions
		declare @q int
		open question_cursor
		fetch question_cursor into @q
		while @@FETCH_STATUS=0
			begin
				insert into Exam_Ques(ExamID,QuesID)
				values(@newExamID,@q)
				fetch question_cursor into @q
			end
		close question_cursor
		deallocate question_cursor
	-- OUTPUT the Exam Questions randomly	   
		select id as [Question_ID],
			   q as [Question_Text],
			   qt as [Question_type],
			   ans as [Model answer],
			   course as [Course_ID],
			   ql as [Question_level] from @examQuestions order by NEWID()
	end try
	begin catch
		select 'Error in generating the exam'
	end catch
END

       -------------------------------------------------------------------------------------------
       -------------------------------------------------------------------------------------------
       -------------------------------------------------------------------------------------------

	   /*
	    HOW DOES IT WORK?
		--> ExamGeneration (Course Id), (True/False), (MCQ) 

		-   ExamGeneration 1, 3, 7	 
		-   ExamGeneration 2, 5, 3  
		-   ExamGeneration 2, 10, 2
		-   ExamGeneration 1, 5, 20

		delete from Exam where ExamID in (3,4)

		delete from Exam_Ques
		where ExamID in (3,4)

		select * from Exam_Ques
		order by ExamId 
	   */
