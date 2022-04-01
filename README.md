# first


This application is mainly used to modify and query students' subject scores

The insertion method mainly uses SQL statements, and the query method mainly uses global

The specific operations are as follows:

1. Import 7 CLS files, including school Student ，SCHOOL. Stuscore is an entity class and others are registered classes. SCHOOL. Student is the main table and stores student information. School Score is a sub table, which stores score information

2. Initialize student information table data. The initial data has been prepared and can be inserted directly.

Execute command: W ##class(school.API).Api("InitSutdentInfo").%ToJSON()



3. Query students' performance information

Input parameter format: JSON string

Student: student name (not required)

Subject: account name (not required)

w ##Class(SCHOOL.Api).Api("QueryStuSubj", "{""student"":"""",""subject"":""""}").%ToJSON()



4. Modify students' performance information

Input parameter format: JSON string

Student: student name

Subject: account name (insert if none, update if any)

Score: Score

w ##Class(SCHOOL.Api).Api("UpdateScore", "{""student"":""student6"",""subject"":""art"",""score"":""99""}").%ToJSON()



5. Query the modified student's score information

Input parameter format: JSON string

Student: student name (not required)

Subject: account name (not required)

w ##Class(SCHOOL.Api).Api("QueryStuSubj", "{""student"":""student6"",""subject"":""art""}").%ToJSON()



6. Query the information of students exceeding the passing score of a subject and sort them according to the score

Input parameter format: JSON string

Subject: student name (required)

Passscore: pass score

Order: sorting method, 1 asc, - 1 desc

w ##Class(SCHOOL.Api).Api("SortByScore", "{""subject"":""art"",""passScore"":""60"",""order"":""1""}").%ToJSON()


first
