Class SCHOOL.Data Extends %RegisteredObject
{

/// w ##Class(SCHOOL.Data).GetInitSutdentInfo().%ToJSON()
ClassMethod GetInitSutdentInfo()
{
	s subjectArr = ["Chinese", "maths", "art", "music"]
	s subjLen = subjectArr.%Size()
	s dataArr = []
	for i = 1:1:10 {
		s stuName = "student" _ i
		s sex = $s((i#2) : "M", 1 : "F")
		s stuObj = {}
		s stuObj.stuName = stuName
		s stuObj.age = ..GetAge()
		s stuObj.sex = sex 
		s subjArr = []
		for j = 0:1:(subjLen - 1) { 
			s subject = subjectArr.%Get(j)
		    s subjObj = {}
		    s subjObj.subject = subject
			s subjObj.score = ..GetScore() 
			d subjArr.%Push(subjObj)
		}
		s stuObj.subjArr = subjArr
		d dataArr.%Push(stuObj)    
	}
	q dataArr
}

/// w ##Class(SCHOOL.Data).GetStuData().%ToJSON()
ClassMethod GetStuData(stuId)
{
	s stuData = ^SCHOOL.StudentD(stuId)
	s dataObj = {}
	s dataObj.name = $lg(stuData, 2)
	s dataObj.age  = $lg(stuData, 3)
	s dataObj.sex  = ..GetSex($lg(stuData, 4))
	q dataObj
}

/// w ##Class(SCHOOL.Data).GetSex("F")
ClassMethod GetSex(sex)
{
	q $S(
		sex = "Male"   : sex,
		sex = "Female" : sex,
		sex = "M"      : "Male",
		sex = "F"      : "Female",
		1              : ""
	)
}

/// w ##Class(SCHOOL.Data).GetSubjData("7||3").%ToJSON()
ClassMethod GetSubjData(stusId)
{
	s stuId = +stusId
	s itm = $P(stusId, "||", 2)
	s subjData = ^SCHOOL.StudentD(stuId, "SUBJ", itm)
	s dataObj = {}
	s dataObj.subject = $lg(subjData, 2)
	s dataObj.score   = $lg(subjData, 3)
	q dataObj
}

/// w ##Class(SCHOOL.Data).GetInitSutdentInfo().%ToJSON()
ClassMethod GetScore()
{
	q $r(50) + 50
}

/// w ##Class(SCHOOL.Data).GetInitSutdentInfo().%ToJSON()
ClassMethod GetAge()
{
	q $r(2) + 6
}

ClassMethod LogErr(error = "")
{
    if ($tlevel > 0) tro
    l
    q $tr($ze, "^", "~")
}

ClassMethod RetInfo(code, msg)
{
    s retObj = {}
    s retObj.code = code
    s retObj.msg = msg
    q retObj
}

ClassMethod Parse(pData)
{
	q:$IsObject(pData) pData
	if ($e(pData,1)="["){
		s pObj=##class(%DynamicArray).%New()
	}else{
		s pObj=##class(%DynamicObject).%New()
	}
	s json=pObj.%FromJSON(pData)
	q json
}

}

