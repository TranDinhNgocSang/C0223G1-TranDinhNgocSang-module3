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

