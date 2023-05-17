CREATE DATABASE furama_data
CHARACTER SET "utf8mb4"
COLLATE "utf8mb4_general_ci";

CREATE TABLE `furama_data`.`vi_tri` (
  `ma_vi_tri` INT NOT NULL,
  `ten_vi_tri` VARCHAR(45) NULL,
  PRIMARY KEY (`ma_vi_tri`)
  );
  
  CREATE TABLE `furama_data`.`trinh_do` (
  `ma_trinh_do` INT NOT NULL,
  `ten_trinh_do` VARCHAR(45) NULL,
  PRIMARY KEY (`ma_trinh_do`)
  );
  
  CREATE TABLE `furama_data`.`bo_phan` (
  `ma_bo_phan` INT NOT NULL,
  `ten_bo_phan` VARCHAR(45) NULL,
  PRIMARY KEY (`ma_bo_phan`)
  );
  
  CREATE TABLE `furama_data`.`dich_vu_di_kem` (
  `ma_dich_vu_di_kem` INT NOT NULL,
  `ten_dich_vu_di_kem` VARCHAR(45) NOT NULL,
  `gia` DOUBLE NOT NULL,
  `don_vi` VARCHAR(10) NOT NULL,
  `trang_thai` VARCHAR(45) NULL,
  PRIMARY KEY (`ma_dich_vu_di_kem`)
  );
  
  CREATE TABLE `furama_data`.`kieu_thue` (
  `ma_kieu_thue` INT NOT NULL,
  `ten_keu_thue` VARCHAR(45) NULL,
  PRIMARY KEY (`ma_kieu_thue`)
  );
  
  CREATE TABLE `furama_data`.`loai_khach` (
  `ma_loai_khach` INT NOT NULL,
  `ten_loai_khach` VARCHAR(45) NULL,
  PRIMARY KEY (`ma_loai_khach`)
  );
  
  CREATE TABLE `furama_data`.`loai_dich_vu` (
  `ma_loai_dich_vu` INT NOT NULL,
  `ten-loai_dich_vu` VARCHAR(45) NULL,
  PRIMARY KEY (`ma_loai_dich_vu`)
  );
  
  CREATE TABLE `furama_data`.`dich_vu` (
  `ma_dich_vu` INT NOT NULL,
  `ten_dich_vu` VARCHAR(45) NOT NULL,
  `dien_tich` INT NULL,
  `chi_phi_thue` DOUBLE NOT NULL,
  `so_nguoi_toi_da` INT NULL,
  `ma_kieu_thue` INT NOT NULL,
  `ma_loai_dich_vu` INT NOT NULL,
  `tieu_chuan_phong` VARCHAR(45) NULL,
  `mo_ta_tien_nghi_khac` VARCHAR(45) NULL,
  `dien_tich_ho_boi` DOUBLE NULL,
  `so_tang` INT NULL,
  PRIMARY KEY (`ma_dich_vu`),
  INDEX `ma_kieu_thue_idx` (`ma_kieu_thue` ASC) VISIBLE,
  INDEX `ma_loai_dich_vu_idx` (`ma_loai_dich_vu` ASC) VISIBLE,
  CONSTRAINT `ma_kieu_thue`
    FOREIGN KEY (`ma_kieu_thue`)
    REFERENCES `furama_data`.`kieu_thue` (`ma_kieu_thue`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ma_loai_dich_vu`
    FOREIGN KEY (`ma_loai_dich_vu`)
    REFERENCES `furama_data`.`loai_dich_vu` (`ma_loai_dich_vu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );
    
    CREATE TABLE `furama_data`.`khach_hang` (
  `ma_khach_hang` INT NOT NULL,
  `ma_loai_khach` INT NOT NULL,
  `ho_va_ten` VARCHAR(45) NOT NULL,
  `ngay_sinh` DATE NOT NULL,
  `gioi_tinh` BIT(1) NOT NULL,
  `so_cmnd` VARCHAR(45) NOT NULL,
  `so_dien_thoai` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `dia_chi` VARCHAR(45) NULL,
  PRIMARY KEY (`ma_khach_hang`),
  INDEX `ma_loai_khach_idx` (`ma_loai_khach` ASC) VISIBLE,
  CONSTRAINT `ma_loai_khach`
    FOREIGN KEY (`ma_loai_khach`)
    REFERENCES `furama_data`.`loai_khach` (`ma_loai_khach`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );
    
    CREATE TABLE `furama_data`.`nhan_vien` (
  `ma_nhan_vien` INT NOT NULL,
  `ho_va_ten` VARCHAR(45) NOT NULL,
  `ngay_sinh` DATE NOT NULL,
  `so_cmnd` VARCHAR(45) NOT NULL,
  `luong` DOUBLE NOT NULL,
  `so_dien_thoai` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `dia_chi` VARCHAR(45) NULL,
  `ma_vi_tri` INT NOT NULL,
  `ma_trinh_do` INT NOT NULL,
  `ma_bo_phan` INT NOT NULL,
  PRIMARY KEY (`ma_nhan_vien`),
  INDEX `ma_vi_tri_idx` (`ma_vi_tri` ASC) VISIBLE,
  INDEX `ma_trinh_do_idx` (`ma_trinh_do` ASC) VISIBLE,
  INDEX `ma_bo_phan_idx` (`ma_bo_phan` ASC) VISIBLE,
  CONSTRAINT `ma_vi_tri`
    FOREIGN KEY (`ma_vi_tri`)
    REFERENCES `furama_data`.`vi_tri` (`ma_vi_tri`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ma_trinh_do`
    FOREIGN KEY (`ma_trinh_do`)
    REFERENCES `furama_data`.`trinh_do` (`ma_trinh_do`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ma_bo_phan`
    FOREIGN KEY (`ma_bo_phan`)
    REFERENCES `furama_data`.`bo_phan` (`ma_bo_phan`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );
    
    CREATE TABLE `furama_data`.`hop_dong` (
  `ma_hop_dong` INT NOT NULL,
  `ngay_lam_hop_dong` DATETIME NOT NULL,
  `ngay_ket_thuc` DATETIME NOT NULL,
  `tien_dat_coc` DOUBLE NOT NULL,
  `ma_nhan_vien` INT NOT NULL,
  `ma_khach_hang` INT NOT NULL,
  `ma_dich_vu` INT NOT NULL,
  PRIMARY KEY (`ma_hop_dong`),
  INDEX `ma_nhan_vien_idx` (`ma_nhan_vien` ASC) VISIBLE,
  INDEX `ma_khach_hang_idx` (`ma_khach_hang` ASC) VISIBLE,
  INDEX `ma_dich_vu_idx` (`ma_dich_vu` ASC) VISIBLE,
  CONSTRAINT `ma_nhan_vien`
    FOREIGN KEY (`ma_nhan_vien`)
    REFERENCES `furama_data`.`nhan_vien` (`ma_nhan_vien`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ma_khach_hang`
    FOREIGN KEY (`ma_khach_hang`)
    REFERENCES `furama_data`.`khach_hang` (`ma_khach_hang`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ma_dich_vu`
    FOREIGN KEY (`ma_dich_vu`)
    REFERENCES `furama_data`.`dich_vu` (`ma_dich_vu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    );
    
    CREATE TABLE `furama_data`.`hop_dong_chi_tiet` (
  `ma_hop_dong_chi_tiet` INT NOT NULL,
  `ma_hop_dong` INT NOT NULL,
  `ma_dich_vu_di_kem` INT NOT NULL,
  `so_luong` INT NOT NULL,
  PRIMARY KEY (`ma_hop_dong_chi_tiet`),
  INDEX `ma_hop_dong_idx` (`ma_hop_dong` ASC) VISIBLE,
  INDEX `ma_dich_vu_di_kem_idx` (`ma_dich_vu_di_kem` ASC) VISIBLE,
  CONSTRAINT `ma_hop_dong`
    FOREIGN KEY (`ma_hop_dong`)
    REFERENCES `furama_data`.`hop_dong` (`ma_hop_dong`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ma_dich_vu_di_kem`
    FOREIGN KEY (`ma_dich_vu_di_kem`)
    REFERENCES `furama_data`.`dich_vu_di_kem` (`ma_dich_vu_di_kem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

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

-- them bang nhan vien
INSERT INTO `furama_data`.`nhan_vien` (`ma_nhan_vien`, `ho_va_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) 
VALUES ('1', 'Nguyễn Văn An', '1970-11-07', '456231786', '10000000', '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', '1', '3', '1'),
('2', 'Lê Văn Bình', '1997-04-09', '654231234', '7000000', '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', '1', '2', '2'),
('3', 'Hồ Thị Yến', '1995-12-12', '999231723', '14000000', '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', '1', '3', '2'),
('4', 'Võ Công Toản', '1980-04-04', '123231365', '17000000', '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', '1', '4', '4'),
('5', 'Nguyễn Bỉnh Phát', '1999-12-09', '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', '2', '1', '1'),
('6', 'Khúc Nguyễn An Nghi', '2000-11-08', '964542311', '7000000', '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', '2', '2', '3'),
('9', 'Nguyễn Hữu Hà', '1993-01-01', '534323231', '8000000', '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', '2', '3', '2'),
('7', 'Nguyễn Hà Đông', '1989-09-03', '234414123', '9000000', '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', '2', '4', '4'),
('8', 'Tòng Hoang', '1982-09-03', '256781231', '6000000', '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', '2', '4', '4'),
('10', 'Nguyễn Công Đạo', '1994-01-08', '755434343', '8000000', '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', '2', '3', '2');


-- them bang khach hang
INSERT INTO `furama_data`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_va_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) 
VALUES ('1', '5', 'Nguyễn Tâm Đắc', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com23 Nguyễn Hoàng, Đà Nẵng', '23 Nguyễn Hoàng, Đà Nẵng'),
('2', '3', 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị'),
('3', '1', 'Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh'),
('4', '1', 'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng'),
('5', '4', 'Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai'),
('6', '4', 'Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng'),
('7', '1', 'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh'),
('8', '3', 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum'),
('9', '1', 'Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi'),
('10', '2', 'Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng');

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

-- them bang hop dong
INSERT INTO `furama_data`.`hop_dong` (`ma_hop_dong`, `ngay_lam_hop_dong`, `ngay_ket_thuc`, `tien_dat_coc`, `ma_nhan_vien`, `ma_khach_hang`, `ma_dich_vu`) 
VALUES ('1', '2020-12-08', '2020-12-08', '0', '3', '1', '3'),
('2', '2020-07-14', '2020-07-21', '200000', '7', '3', '1'),
('3', '2021-03-15', '2021-03-17', '50000', '3', '4', '2'),
('4', '2021-01-14', '2021-01-18', '100000', '7', '5', '5'),
('5', '2021-07-14', '2021-07-15', '0', '7', '2', '6'),
('6', '2021-06-01', '2021-06-03', '0', '7', '7', '6'),
('7', '2021-09-02', '2021-09-05', '100000', '7', '4', '4'),
('8', '2021-06-17', '2021-06-18', '150000', '3', '4', '1'),
('9', '2020-11-19', '2020-11-19', '0', '3', '4', '3'),
('10', '2021-04-12', '2021-04-14', '0', '10', '3', '5'),
('11', '2021-04-25', '2021-04-25', '0', '2', '2', '1'),
('12', '2021-05-25', '2021-05-27', '0', '7', '10', '1');

-- them bang hop dong chi tiet
INSERT INTO `furama_data`.`hop_dong_chi_tiet` (`ma_hop_dong_chi_tiet`, `ma_hop_dong`, `ma_dich_vu_di_kem`, `so_luong`) 
VALUES ('1', '2', '4', '5'),
('2', '2', '5', '8'),
('3', '2', '6', '15'),
('4', '3', '1', '1'),
('5', '3', '2', '11'),
('6', '1', '3', '1'),
('7', '1', '2', '2'),
('8', '12', '2', '2');
