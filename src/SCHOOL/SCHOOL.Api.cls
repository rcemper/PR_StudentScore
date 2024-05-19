Class SCHOOL.Api Extends %RegisteredObject
{

/// w ##Class(SCHOOL.Api).Api("InitSutdentInfo").%ToJSON()	
/// w ##Class(SCHOOL.Api).Api("UpdateScore", "{""student"":""student6"",""subject"":""art"",""score"":""99""}").%ToJSON()
/// w ##Class(SCHOOL.Api).Api("QueryStuSubj", "{""student"":"""",""subject"":""""}").%ToJSON()
/// w ##Class(SCHOOL.Api).Api("QueryStuSubj", "{""student"":""student6"",""subject"":""art""}").%ToJSON()
/// w ##Class(SCHOOL.Api).Api("SortByScore", "{""subject"":""art"",""passScore"":""60"",""order"":""1""}").%ToJSON()
ClassMethod Api(MethodName, InputStr = "")
{
	q $case(MethodName,
		"InitSutdentInfo"	: ##class(Operate).InitSutdentInfo(),
		"UpdateScore"		: ##class(Operate).UpdateScore(InputStr),
		"QueryStuSubj"		: ##class(Query).QueryStuSubj(InputStr),
		"SortByScore"		: ##class(Query).SortByScore(InputStr),
							: "{}"
	)
}

}

