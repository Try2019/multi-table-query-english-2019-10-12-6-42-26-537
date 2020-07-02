# 1.Query the existence of 1 course
select * from course where id=1;

# 2.Query the presence of both 1 and 2 courses
select * from course where id=1 or id=2;

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select name,id,avgscore from student as temp join (select studentId,avg(score) as avgscore from student_course group by studentId having avg(score)>=60)temp1 on temp.id=temp1.studentId;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
select * from student where id not in (select studentId from student_course);

# 5.Query all SQL with grades
select distinct studentId,sname,sage,ssex from student_course join (select id,name as sname,age as sage,sex as ssex from student)temp1 where studentId=temp1.id;

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select id,name,age,sex from student as a join (select studentId from student_course where courseId=2)temp where id=temp.studentId and id!=1;

# 7.Retrieve 1 student score with less than 60 scores in descending order
select score from student_course where score<60 order by score desc limit 1;

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select courseId,avg(score) from student_course group by courseId order by avg(score) desc,courseId asc;

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select name,sscore from student as temp join (select studentId,score as sscore from student_course,course where student_course.courseId=course.id and course.name='Math' and score<60)temp1 where temp.id=temp1.studentId;