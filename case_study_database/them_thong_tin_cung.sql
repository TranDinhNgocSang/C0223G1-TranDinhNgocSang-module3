-- them bang vi tri
INSERT INTO `furama_data`.`vi_tri` (`ma_vi_tri`, `ten_vi_tri`) 
VALUES ('1', 'Quản lý'),('2', 'Nhân viên');

 -- them bang trinh do
INSERT INTO `furama_data`.`trinh_do` (`ma_trinh_do`, `ten_trinh_do`) 
VALUES ('1', 'Trung Cấp'),('2', 'Cao Đẳng'), ('3', 'Đại Học'),('4', 'Sau Đại học');

 -- them bang bo phan
INSERT INTO `furama_data`.`bo_phan` (`ma_bo_phan`, `ten_bo_phan`) 
VALUES ('1', 'Sale-Marketing'),('2', 'Hành chính'),('3', 'Phục vụ'),('4', 'Quản lý');


-- them bang loai khach
INSERT INTO `furama_data`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) 
VALUES ('1', 'Diamond'),('2', 'Platinium'),('3', 'Gold'),('4', 'Silver'),('5', 'Member');


-- them bang kieu thue
INSERT INTO `furama_data`.`kieu_thue` (`ma_kieu_thue`, `ten_keu_thue`) 
VALUES ('1', 'Năm'),('2', 'Tháng'),('3', 'Ngày'),('4', 'Giờ');

-- them bang loai dch vu
INSERT INTO `furama_data`.`loai_dich_vu` (`ma_loai_dich_vu`, `ten-loai_dich_vu`) 
VALUES ('1', 'Villa'),('2', 'House'),('3', 'Room');

-- them dich vu
INSERT INTO `furama_data`.`dich_vu` (`ma_dich_vu`, `ten_dich_vu`, `dien_tich`, `chi_phi_thue`, `so_nguoi_toi_da`, `ma_kieu_thue`, `ma_loai_dich_vu`, `tieu_chuan_phong`, `mo_ta_tien_nghi_khac`, `dien_tich_ho_boi`, `so_tang`) 
VALUES ('1', 'Villa Beach Front', '25000', '10000000', '10', '3', '1', 'vip', 'Có hồ bơi', '500', '4'),
('2', 'House Princess 01', '14000', '5000000', '7', '2', '2', 'vip', 'Có thêm bếp nướng', null, '3'),
('3', 'Room Twin 01', '5000', '1000000', '2', '4', '3', 'normal', 'Có tivi', null , null),
('4', 'Villa No Beach Front', '22000', '9000000', '8', '3', '1', 'normal', 'Có hồ bơi', '300', '3'),
('5', 'House Princess 02', '10000', '4000000', '5', '3', '2', 'normal', 'Có thêm bếp nướng', null, '2'),
('6', 'Room Twin 02', '3000', '900000', '2', '4', '3', 'normal', 'Có tivi', null , null);

-- them bang dich vu di kem
INSERT INTO `furama_data`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`, `ten_dich_vu_di_kem`, `gia`, `don_vi`, `trang_thai`) 
VALUES ('1', 'Karaoke', '10000', 'giờ', 'tiện nghi, hiện tại'),
('2', 'Thuê xe máy', '10000', 'chiếc', 'hỏng 1 xe'),
('3', 'Thuê xe đạp', '20000', 'chiếc', 'tốt'),
('4', 'Buffet buổi sáng', '15000', 'suất', 'đầy đủ đồ ăn, tráng miệng'),
('5', 'Buffet buổi trưa', '90000', 'suất', 'đầy đủ đồ ăn, tráng miệng'),
('6', 'Buffet buổi tối', '16000', 'suất', 'đầy đủ đồ ăn, tráng miệng');
