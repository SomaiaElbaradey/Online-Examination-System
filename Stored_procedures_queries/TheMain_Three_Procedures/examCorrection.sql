CREATE PROC examCorrection @examID INT, @studentID INT
WITH ENCRYPTION
AS
BEGIN
	BEGIN TRY
		----Store the model answer for each question compared to the Student answer---
		DECLARE @correctAns TABLE (Qid int, ModelAns varchar(100), userAns varchar(100))
		INSERT @correctAns(Qid, ModelAns, userAns)
		SELECT QuesID, ModelAns, Answer
		FROM St_exam_Q_A, Question
		WHERE QID = QuesID AND StudID = @studentID AND ExamID = @examID


		------Set the grade for the correct answers-------
		UPDATE St_exam_Q_A
		SET Grade = 1
		WHERE QuesID IN
		(
			SELECT Qid FROM @correctAns
			WHERE ModelAns LIKE '%' + userAns + '%'
			AND StudID = @studentID AND ExamID = @examID
		)


		---------Set the null values by zero--------------
		UPDATE St_exam_Q_A
		SET Grade = 0 
		WHERE Grade IS NULL
		AND StudID = @studentID AND ExamID = @examID


		---------Compute student final grade--------------
		DECLARE @StudentDegree FLOAT  = (SELECT SUM(GRADE) FROM St_exam_Q_A
										  WHERE StudID = @studentID AND ExamID = @examID )
		DECLARE @FinalDegree FLOAT = (SELECT COUNT(GRADE) FROM St_exam_Q_A
								   	   WHERE StudID = @studentID AND ExamID = @examID )
		DECLARE @StudentPrec FLOAT = (@StudentDegree/@FinalDegree) * 100

		IF(@StudentPrec IS NULL)
		BEGIN
			SELECT 'Student Did not take this exam'
			RETURN
		END
		SELECT @StudentPrec AS 'Student Degree'
	END TRY

	BEGIN CATCH
		SELECT 'Error in correcting the user exam'
	END CATCH
END
GO

/*
ExamCorrection 2, 35
ExamCorrection 1, 1
ExamCorrection 1, 35
*/