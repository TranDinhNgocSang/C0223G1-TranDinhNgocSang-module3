-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student
where StudentName like 'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select *from Class
where month(StartDate) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from Subject
where Credit between 3 and 5; 

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
set sql_safe_updates = 0;
update Student
set ClassId = 2
where StudentName = 'Hung';
set sql_safe_updates = 1;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select Student.StudentName, `Subject`.SubName, Mark.Mark
from Student
join Mark on Student.StudentId = Mark.StudentId
join `Subject` on Mark.SubId = `Subject`.SubId
order by Mark.Mark desc, Student.StudentName asc;