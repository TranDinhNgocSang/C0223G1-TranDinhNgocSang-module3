use Quanlysinhvien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT * FROM `Subject`
-- WHERE Credit = (SELECT MAX(Credit) FROM `Subject`)
order by Credit desc
limit 1;

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT * FROM `Subject`
JOIN Mark on Mark.SubId = Subject.SubID
order by Mark desc
limit 1;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT s.*, AVG(m.Mark) AS AverageMark
FROM Student s
JOIN Mark m ON s.StudentId = m.StudentId
GROUP BY s.StudentId
ORDER BY AverageMark DESC;
 