Class SCHOOL.Student Extends %Persistent [ SqlRowIdName = STU_RowId, SqlTableName = Student, StorageStrategy = SQLStorage ]
{

Relationship ChildStuScore As SCHOOL.StuScore [ Cardinality = children, Inverse = STUSPARREF ];

Property STUName As %Library.String(COLLATION = "Exact", MAXLEN = 20, TRUNCATE = 0) [ SqlColumnNumber = 2, SqlFieldName = STU_Name ];

Property STUAge As %Library.Integer(MINVAL = 6) [ SqlColumnNumber = 3, SqlFieldName = STU_Age ];

Property STUSex As %Library.String(DISPLAYLIST = ",Male,Female", MAXLEN = 6, TRUNCATE = 1, VALUELIST = ",M,F") [ SqlColumnNumber = 4, SqlFieldName = STU_Sex ];

Storage SQLStorage
{
<Data name="StudentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>STUName</Value>
</Value>
<Value name="3">
<Value>STUAge</Value>
</Value>
<Value name="4">
<Value>STUSex</Value>
</Value>
</Data>
<DataLocation>^SCHOOL.StudentD</DataLocation>
<DefaultData>StudentDefaultData</DefaultData>
<IdLocation>^SCHOOL.StudentD</IdLocation>
<IndexLocation>^SCHOOL.StudentI</IndexLocation>
<StreamLocation>^SCHOOL.StudentS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

Index NAME On STUName [ Unique ];

}

