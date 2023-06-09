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
 
 -- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc,
 -- tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng
 -- dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng
 -- phải hiển thị ra).
select kh.ma_khach_hang, kh.ho_va_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu,
 hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, ifnull(dv.chi_phi_thue + ifnull(sum(hdct.so_luong*dvdk.gia),0),0) as tong_tien
from  loai_khach lk
right join khach_hang kh on lk.ma_loai_khach = kh.ma_loai_khach
left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by kh.ma_khach_hang,hd.ma_hop_dong;

 -- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ
 -- chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
 select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.`ten-loai_dich_vu`
 from dich_vu dv
 join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
 where dv.ma_dich_vu not in (
  select dv.ma_dich_vu
 from dich_vu dv
 join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
 where dv.ma_dich_vu in (
 select hd.ma_dich_vu 
 from hop_dong hd
 where ngay_lam_hop_dong between '2021-01-01' and '2021-03-31')
 );

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng
-- đặt phòng trong năm 2021
select distinct dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.`ten-loai_dich_vu`
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2020
and hd.ma_dich_vu not in (
select hd.ma_dich_vu
from hop_dong hd
where year(hd.ngay_lam_hop_dong) = 2021);


-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.

-- cach 1
select ho_va_ten
from khach_hang
group by ho_va_ten;

-- cach 2
select ho_va_ten
from khach_hang
union
select ho_va_ten
from khach_hang;

-- cách 3
select distinct ho_va_ten from khach_hang;

-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có
-- bao nhiêu khách hàng thực hiện đặt phòng.
select month(hd.ngay_lam_hop_dong) as moth , count(*)
from hop_dong hd
where year(hd.ngay_lam_hop_dong) = 2021
group by month(hd.ngay_lam_hop_dong)
order by month(hd.ngay_lam_hop_dong);

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả 
-- hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, ifnull(sum(hdct.so_luong),0) as so_luong_dich_vu_di_kem
from hop_dong hd
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
group by hd.ma_hop_dong;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach 
-- là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dvdk.*
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
where kh.dia_chi like '%Vinh' or kh.dia_chi like 'Quảng Ngãi'
and lk.ten_loai_khach = 'Diamond';

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng),
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc 
-- của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng
-- đặt vào 6 tháng đầu năm 2021.
select hd.ma_hop_dong, nv.ho_va_ten, kh.ho_va_ten, kh.so_dien_thoai, dv.ten_dich_vu,
 ifnull(sum(hdct.so_luong),0) as so_luong_dich_vu_di_kem, hd.tien_dat_coc
from hop_dong hd
left join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
where  hd.ngay_lam_hop_dong between '2020-10-01' and '2020-12-31'
and hd.ma_hop_dong not in (
select hd.ma_hop_dong
from hop_dong hd
where hd.ngay_lam_hop_dong between '2021-01-01' and '2021-05-31'
)
group by hd.ma_hop_dong;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi
-- các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem,ifnull(sum(hdct.so_luong),0) as so_luong_dich_vu_di_kem
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
group by dvdk.ma_dich_vu_di_kem
having sum(hdct.so_luong) = (
select ifnull(sum(hdct.so_luong),0)
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
group by dvdk.ma_dich_vu_di_kem
order by sum(hdct.so_luong) desc
limit 1
);

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung
-- (được tính dựa trên việc count các ma_dich_vu_di_kem).
select hd.ma_hop_dong,ldv.`ten-loai_dich_vu`,dvdk.ten_dich_vu_di_kem, count(hdct.ma_dich_vu_di_kem)
 from hop_dong hd
 join dich_vu dv
 on hd.ma_dich_vu=dv.ma_dich_vu
 join loai_dich_vu ldv
 on dv.ma_loai_dich_vu=ldv.ma_loai_dich_vu
 join hop_dong_chi_tiet hdct
 on hd.ma_hop_dong=hdct.ma_hop_dong
 join dich_vu_di_kem dvdk
 on hdct.ma_dich_vu_di_kem=dvdk.ma_dich_vu_di_kem
 where hdct.ma_dich_vu_di_kem not in (
select hop_dong_chi_tiet.ma_dich_vu_di_kem
from hop_dong_chi_tiet
group by hop_dong_chi_tiet.ma_dich_vu_di_kem
having count(hop_dong_chi_tiet.ma_dich_vu_di_kem)<>1
)
group by hdct.ma_hop_dong_chi_tiet
;


-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, 
-- so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select nv.ma_nhan_vien, nv.ho_va_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai,
nv.dia_chi
from nhan_vien nv
join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where year(hd.ngay_lam_hop_dong) in (2020,2021)
group by nv.ma_nhan_vien
having count(nv.ma_nhan_vien)<4;

select *
from nhan_vien 
where ma_nhan_vien in(
select ma_nhan_vien
from hop_dong
group by ma_nhan_vien
having count(ma_nhan_vien) <=3
);

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021

-- set sql_safe_updates = 0 ;
-- delete from nhan_vien
-- where ma_nhan_vien in (
-- select * from(
-- select nv.*
-- from nhan_vien nv
-- left join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
-- where nv.ma_nhan_vien not in (
-- select nv.ma_nhan_vien
-- from nhan_vien nv
-- join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
-- where hd.ngay_lam_hop_dong between '2019-01-01' and '2021-12-31'
-- )
-- ) as ab);

set sql_safe_updates = 0 ;
delete from nhan_vien
where ma_nhan_vien not in (
select * from (
select nv.ma_nhan_vien
from nhan_vien nv
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where hd.ngay_lam_hop_dong between '2019-01-01' and '2021-12-31'
)as ab)
;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

update khach_hang
set khach_hang.ma_loai_khach = 1
where khach_hang.ma_khach_hang in (
select*from(
select kh.ma_khach_hang,sum(dv.chi_phi_thue+ dvdk.gia*hdct.so_luong)
from khach_hang kh
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
where year(hd.ngay_lam_hop_dong)= 2021 and lk.ten_loai_khach = 'Platinium'
group by kh.ma_khach_hang
having sum(dv.chi_phi_thue+ dvdk.gia*hdct.so_luong) > 10000000
) as ab
);

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
set foreign_key_checks =0;
delete from khach_hang
where ma_khach_hang in(
select * from(
select kh.ma_khach_hang
from khach_hang kh
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
where year(hd.ngay_lam_hop_dong) <2021
) as ab
);
set foreign_key_checks =1;

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
update dich_vu_di_kem
set dich_vu_di_kem.gia = dich_vu_di_kem.gia*2
where ma_dich_vu_di_kem in(	
select * from (
select dvdk.ma_dich_vu_di_kem
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
where year(hd.ngay_lam_hop_dong) = 2020
group by dvdk.ma_dich_vu_di_kem
having sum(so_luong)>10
) as ab
);


-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai,
-- ngay_sinh, dia_chi.
select nv.ma_nhan_vien, nv.ho_va_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi
from nhan_vien nv
union all
select kh.ma_khach_hang, kh.ho_va_ten, kh.email, kh.so_dien_thoai, kh.ngay_sinh, kh.dia_chi
from khach_hang kh;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là
-- “Hải Châu” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
create view v_nhan_vien as
select nv.* ,hd.ngay_lam_hop_dong
from nhan_vien nv
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where nv.dia_chi like '%Đà Nẵng';

select * from v_nhan_vien;

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên 
-- được nhìn thấy bởi khung nhìn này.
update v_nhan_vien
set v_nhan_vien.dia_chi = 'Liên Chiểu';

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được
-- truyền vào như là 1 tham số của sp_xoa_khach_hang.

delimiter //
create procedure sp_xoa_khach_hang (id int )
begin
delete from khach_hang
where ma_khach_hang = id;
end;
//delimiter ;

set foreign_key_checks =0;
call sp_xoa_khach_hang(2);
set foreign_key_checks =1;

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải
-- thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham
-- chiếu đến các bảng liên quan.
delimiter //
create procedure sp_them_moi_hop_dong(
p_ma_hop_dong int,
p_ngay_lam_hop_dong datetime,
p_ngay_ket_thuc datetime,
p_tien_dat_coc double,
p_ma_nhan_vien int,
p_ma_khach_hang int,
p_ma_dich_vu int
)
begin
if exists (select 1 from hop_dong where ma_hop_dong = p_ma_hop_dong)
then
rollback;
signal sqlstate '45000' 
set message_text = 'Mã hợp đồng đã tồn tại.';
end if;
if not exists (select 1 from nhan_vien where ma_nhan_vien = p_ma_nhan_vien)
then
rollback;
signal sqlstate '45000' 
set message_text = 'Mã nhân viên không hợp lệ.';
end if;

if not exists (select 1 from khach_hang where ma_khach_hang = p_ma_khach_hang)
then
rollback;
signal sqlstate '45000' 
set message_text = 'Mã khách hàng không hợp lệ.';
end if;
    
if not exists (select 1 from dich_vu where ma_dich_vu = p_ma_dich_vu)
then
rollback;
signal sqlstate '45000' 
set message_text = 'Mã dịch vụ không hợp lệ.';
end if;

insert into hop_dong (ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
    values (p_ma_hop_dong, p_ngay_lam_hop_dong, p_ngay_ket_thuc, p_tien_dat_coc, p_ma_nhan_vien, p_ma_khach_hang, p_ma_dich_vu);
end //
delimiter ;
call sp_them_moi_hop_dong(16,20120130,20120131,25000, 1,1,1);

-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại có trong
-- bảng hop_dong ra giao diện console của database.
create table lich_su_tr_xoa_hop_dong (
so_hop_dong_con_lai int
);

delimiter //
 create trigger tr_xoa_hop_dong after delete on hop_dong
for each row
begin
    declare total_records int;

   set total_records = (select count(*) from hop_dong group by ma_hop_dong;

   insert into lich_su_tr_xoa_hop_dong (so_hop_dong_con_lai) values (total_records);
end //
delimiter ;

drop trigger tr_xoa_hop_dong;

delete from hop_dong
where ma_hop_dong = 16;

-- 	26.	Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có
-- phù hợp hay không, với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ
-- thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất
-- là 2 ngày” trên console của database.
delimiter //
create trigger tr_cap_nhat_hop_dong before update on hop_dong 
for each row 
begin
    if new.ngay_ket_thuc <= new.ngay_lam_hop_dong + interval 1 day 
    then
    rollback;
        insert into log_table (message) value ('Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày');
    end if;
end //
delimiter ;

-- 27 a) a.	Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ. 
DELIMITER //

create FUNCTION func_dem_dich_vu() RETURNS INT
BEGIN
    DECLARE count INT;
    
    SELECT COUNT(*) INTO count
    FROM dich_vu
    WHERE ma_dich_vu IN (
        SELECT ma_dich_vu
        FROM hop_dong
        WHERE tien_dat_coc > 2000000
    );
        RETURN count;
END //

DELIMITER ;

-- 27 b) b.	Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu
-- làm hợp đồng đến lúc kết thúc hợp đồng mà khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời
-- gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng). Mã của khách hàng được
-- truyền vào như là 1 tham số của function này.

DELIMITER //

CREATE FUNCTION func_tinh_thoi_gian_hop_dong(ma_khach_hang INT) RETURNS INT
BEGIN
    DECLARE max_duration INT;
    
    SELECT MAX(DATEDIFF(ngay_ket_thuc, ngay_lam_hop_dong)) INTO max_duration
    FROM hop_dong
    WHERE ma_khach_hang = ma_khach_hang;
    
    RETURN max_duration;
END //

DELIMITER ;
    
