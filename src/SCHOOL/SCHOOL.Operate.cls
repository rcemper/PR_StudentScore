Class SCHOOL.Operate Extends (SCHOOL.Data, SCHOOL.SQL)
{

/// w ##Class(SCHOOL.Operate).InitSutdentInfo().%ToJSON()
ClassMethod InitSutdentInfo()
{
	s $zt = "err"
	ts
	s stuArr = ..GetInitSutdentInfo()
	s stuSize = stuArr.%Size()
	for i = 0:1:(stuSize - 1) { 
		s stuObj = stuArr.%Get(i)
		s stuName = stuObj.stuName
		s age = stuObj.age
		s sex = stuObj.sex
		s stuId = ..InsertStuSQL(stuName, age, sex)
		i (stuId < 0) tro  return ..RetInfo(-1, stuId)
		s subjArr = stuObj.subjArr
		s subjSize = subjArr.%Size()
		for j = 0:1:(subjSize - 1) { 
			s subjObj = subjArr.%Get(j)
			s subject = subjObj.subject
			s score = subjObj.score 
			s stusId  = ..InsertSubjSQL(stuId, subject, score)
			i (stusId < 0) tro  return ..RetInfo(-2, stusId)
		}
	}
	tc
	q ..RetInfo(0, "success")
	
err
    s err = ..LogErr()
    q ..RetInfo(-1, err)
}

/// w ##Class(SCHOOL.Operate).UpdateScore("{""student"":""student6"",""subject"":""art"",""score"":""99""}").%ToJSON()
ClassMethod UpdateScore(pJsonStr)
{
	s $zt = "err"
	ts
	s pJson = ..Parse(pJsonStr)
	q:('$IsObject(pJson)) ..RetInfo(-1, "Please check the data")
	s student = pJson.student
	s subject = pJson.subject
	s score   = pJson.score
	q:(student = "")||(subject = "")||(score = "") ..RetInfo(-2, "Please check the data")
	s stuId = $O(^SCHOOL.StudentI("NAME", student, ""))
	q:(stuId = "") ..RetInfo(-3, "Student does not exist")
	s itm = $O(^SCHOOL.StuScoreI("Subject", stuId, subject, ""))
	q:(itm = "") ..RetInfo(-4, "Subject does not exist")
	s stusId = stuId _ "||" _ itm
	s stusId = ..UpdateScoreSQL(stusId, score)
	i (stusId < 0) tro  return ..RetInfo(-5, stusId)
	tc
	q ..RetInfo(0, "success")
	
err
    s err = ..LogErr()
    q ..RetInfo(-1, err)
}

}

