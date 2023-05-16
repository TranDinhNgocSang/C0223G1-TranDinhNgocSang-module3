select * from student
where StudentName like 'h%';

select *from Class
where month(StartDate) = 12;

select* from class
where ClassID = (
select student.ClassId from student
where StudentId = (
select mark.StudentId from mark
where SubId = (
select `subject`.SubId from `subject`
where Credit between 3 and 5)));

SELECT *FROM Class
WHERE ClassID = (
    SELECT Student.ClassId
    FROM Student
    WHERE StudentId = (
        SELECT Mark.StudentId
        FROM Mark
        WHERE SubId = (
            SELECT Subject.SubId
            FROM Subject
            WHERE Credit BETWEEN 3 AND 6
        )
    )
);
set sql_safe_updates = 0;
update Student
set ClassId = 2
where StudentName = 'Hung';
set sql_safe_updates = 1;

select Student.StudentName, `Subject`.SubName, Mark.Mark
from ((Student
join Mark on Student.StudentId = Mark.StudentId)
join `Subject` on Mark.SubId = `Subject`.SubId)
order by Mark.Mark desc, Student.StudentName asc;