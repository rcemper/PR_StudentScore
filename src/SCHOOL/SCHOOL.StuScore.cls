Class SCHOOL.StuScore Extends %Persistent [ SqlRowIdName = STUS_RowId, SqlTableName = StuScore, StorageStrategy = SQLStorage ]
{

Relationship STUSPARREF As SCHOOL.Student [ Cardinality = parent, Inverse = ChildStuScore, Required, SqlFieldName = STUS_PARREF ];

Property STUSSubject As %Library.String(COLLATION = "Exact", MAXLEN = 20, TRUNCATE = 0) [ SqlColumnNumber = 2, SqlFieldName = STUS_Subject ];

Property STUSScore As %Library.Integer(MAXVAL = 100, MINVAL = 0) [ SqlColumnNumber = 3, SqlFieldName = STUS_Score ];

Storage SQLStorage
{
<Data name="StuScoreDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>STUSSubject</Value>
</Value>
<Value name="3">
<Value>STUSScore</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("SUBJ")</DataLocation>
<DefaultData>StuScoreDefaultData</DefaultData>
<IdLocation>{%%PARENT}("SUBJ")</IdLocation>
<IndexLocation>^SCHOOL.StuScoreI</IndexLocation>
<StreamLocation>^SCHOOL.StuScoreS</StreamLocation>
<Type>%CacheStorage</Type>
}

Index SubjScore On (STUSSubject, STUSScore);

Index Subject On (STUSPARREF, STUSSubject) [ Unique ];

}

