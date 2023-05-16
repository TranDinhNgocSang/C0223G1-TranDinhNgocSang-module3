use furama_data;

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * from nhan_vien
where (nhan_vien.ho_va_ten like  'H%' 
or nhan_vien.ho_va_ten like 'T%' 
or nhan_vien.ho_va_ten like 'K%')
and char_length(nhan_vien.ho_va_ten) <=15 ;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang
where (TIMESTAMPDIFF(year,khach_hang.ngay_sinh,curdate()) between 18 and 50)
and (dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng trị');

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo 
-- số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select k.ma_khach_hang, k.ho_va_ten, count(*) as so_lan_dat_phong
from khach_hang k
join hop_dong h on k.ma_khach_hang = h.ma_khach_hang
where ma_loai_khach = 1
group by k.ma_khach_hang
order by so_lan_dat_phong;

