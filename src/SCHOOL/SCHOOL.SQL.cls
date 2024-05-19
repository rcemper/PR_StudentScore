Class SCHOOL.SQL Extends %RegisteredObject
{

ClassMethod InsertStuSQL(stuName, age, sex)
{
	&SQL(
		INSERT INTO SCHOOL.Student
		(
			STU_Name, STU_Age, STU_Sex
		) 
		VALUES 
		(
			:stuName, :age, :sex
		)
	)
	q:(SQLCODE '= 0) SQLCODE 
	q %ROWID
}

ClassMethod InsertSubjSQL(stuId, subject, score)
{
	&SQL(
		INSERT INTO SCHOOL.StuScore
		(
			STUS_PARREF, STUS_Subject, STUS_Score
		) 
		VALUES 
		(
			:stuId, :subject, :score
		)
	)
	q:(SQLCODE '= 0) SQLCODE 
	q %ROWID
}

ClassMethod UpdateScoreSQL(stusId, score)
{
	&SQL(
		UPDATE SCHOOL.StuScore 
		SET 
			STUS_Score = :score
		WHERE 
			STUS_RowId = :stusId
	)
	q:(SQLCODE '= 0) SQLCODE 
	q %ROWID
}

}

