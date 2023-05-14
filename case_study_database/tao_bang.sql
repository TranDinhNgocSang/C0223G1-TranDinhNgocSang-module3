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

