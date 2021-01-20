--1
CREATE Proc stud_info @DeptID int
with encryption
as
	Select s.SID as[student id] ,s.fname+' '+s.lname as [student name] ,s.age as[student age] ,s.address as[student address]
	from Student s ,Dept_Stud ds
	where  ds.studID=s.SID and ds.DeptID=@DeptID
	order by ds.DeptID
GO
--stud_info 3
---------------------------------------------------------
--2
CREATE Proc stud_grade @StudID int
with encryption
as
	Select sc.FullGrade as [full grade],c.CrsName as [course name] ,c.CrsID as [course id]
	from Stud_Course  sc,Course c
	where sc.StudID=@StudID and  c.CrsID=sc.CourseID

GO
--stud_grade 3
--------------------------------------------------------
--3
CREATE Proc NCourse_NumStud @InstID int
with encryption
as
	Select  c.CrsName as[course name] ,count(s.StudID) as[number of students]
	from Course c ,Stud_Course s
	where  c.InstID=@InstID and c.CrsID=s.CourseID
	group by c.CrsName

GO
--NCourse_NumStud 3
-----------------------------------------------------------
--4
CREATE Proc topics @CoureID int
with encryption
as
	Select t.TopName as[course's topics]
	from Course_Topics ct ,Topic t
	where  ct.CourseID=@CoureID and ct.TopicID=t.TID

GO
--topics 2
------------------------------------------------------------
--5
CREATE Proc questions @ExamID int
with encryption

as
	Select q.QID as [questions id],q.QuesText as[questions],q.Type as[question type] ,q.advLevel as[advanced question level]
	from Exam_Ques eq ,Question q
	where  eq.ExamID=@ExamID and eq.QuesID=q.QID

GO
--questions 1
------------------------------------------------------------
--6
CREATE Proc questions_studAnswer @ExamID int , @StudID int
with encryption
as
	Select q.QuesText as[questions],sa.Answer as[student answer]
	from Question q , St_exam_Q_A sa
	where  sa.ExamID=@ExamID and sa.StudID=@StudID and q.QID=sa.QuesID

GO
--questions_studAnswer 1,1
