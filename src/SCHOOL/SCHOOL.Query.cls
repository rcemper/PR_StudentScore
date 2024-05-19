Class SCHOOL.Query Extends SCHOOL.Data
{

/// w ##Class(SCHOOL.Query).QueryStuSubj("{""student"":""student6"",""subject"":""art""}").%ToJSON()
ClassMethod QueryStuSubj(pJsonStr As %String)
{
	s pJson = ..Parse(pJsonStr)
	q:('$IsObject(pJson)) ..RetInfo(-1, "Please check the data")
	s pStudent = pJson.student
	s pSubject = pJson.subject
	s DataArr = []
	s student = ""
	for {
		s student = $O(^SCHOOL.StudentI("NAME",student))
		q:(student = "")
		continue:(pStudent '= "")&&(pStudent '= student)
		s stuId = $O(^SCHOOL.StudentI("NAME", student, ""))
		s stuObj = {}
		s stuData = ..GetStuData(stuId)
		s stuObj.stuData = stuData
		s subjArr = []
		s subject = ""
		for {
			s subject = $O(^SCHOOL.StuScoreI("Subject", stuId, subject))
			q:(subject = "")
			continue:(pSubject '= "")&&(pSubject '= subject)
			s itm = $O(^SCHOOL.StuScoreI("Subject", stuId, subject, ""))
			s stusId = stuId _ "||" _itm
			d subjArr.%Push(..GetSubjData(stusId)) 
		}
		s stuObj.subjData = subjArr
		d DataArr.%Push(stuObj)  
	}
	q DataArr
}

/// w ##Class(SCHOOL.Query).SortByScore("{""subject"":""art"",""passScore"":""60"",""order"":""1""}").%ToJSON()
ClassMethod SortByScore(pJsonStr As %String)
{
	s pJson = ..Parse(pJsonStr)
	q:('$IsObject(pJson)) ..RetInfo(-1, "Please check the data")
	s pSubject = pJson.subject
	s passScore = pJson.passScore
	s order = pJson.order
	s order = $s(order = "" : 1, 1 : order)
	q:(pSubject = "") ..RetInfo(-2, "Please check the subject")
	s DataArr = []
	
	s subject = ""
	for {
		s subject = $O(^SCHOOL.StuScoreI("SubjScore", subject))
		q:(subject = "")
		continue:(pSubject '= "")&&(pSubject '= subject)
		s score = ""
		for {
			s score = $O(^SCHOOL.StuScoreI("SubjScore", subject, score), order)
			q:(score = "")
			continue:(passScore '= "")&&(score < passScore)
			s stuId = ""
			for {
				s stuId = $O(^SCHOOL.StuScoreI("SubjScore", subject, score, stuId))
				q:(stuId = "")
				s stuData = ..GetStuData(stuId)
				s stuName = stuData.Name
				s obj = {}
				s obj.stuName = stuName
				s obj.subject = subject
				s obj.score = score
				d DataArr.%Push(obj)
			}
		}
	}
	q DataArr
}

}

