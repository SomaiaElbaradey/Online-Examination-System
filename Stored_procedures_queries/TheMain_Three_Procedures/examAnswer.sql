USE [Examination-System]
GO 

CREATE PROC examAnswer
			@student_Id INT,
			@exam_Id INT,
			@question_ID INT,
			@Student_Answer VARCHAR(50)
WITH ENCRYPTION
AS 
	INSERT INTO St_exam_Q_A (StudID,ExamID,QuesID,Answer)
	VALUES(@student_Id,@exam_Id,@question_ID,@Student_Answer)
	
GO

