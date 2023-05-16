create database quan_ly_vat_tu;
use quan_ly_vat_tu;

create table nha_cung_cap(
ma_nha_cung_cap int primary key auto_increment,
ten_nha_cung_cap varchar(45) not null,
dia_chi varchar(100) not null
);

create table so_dien_thoai_nha_cung_cap(
so_dien_thoai varchar(25) primary key,
ma_nha_cung_cap int not null,
foreign key (ma_nha_cung_cap) references nha_cung_cap (ma_nha_cung_cap)
);

create table don_dat_hang(
so_dat_hang int primary key auto_increment,
ngay_dat_hang date not null,
ma_nha_cung_cap int not null,
foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table vay_tu(
ma_vat_tu int primary key auto_increment,
ten_vat_tu varchar(100)
);

create table chi_tiet_don_hang(
so_dat_hang int not null,
ma_vat_tu int not null,
primary key (so_dat_hang,ma_vat_tu),
foreign key(so_dat_hang) references don_dat_hang(so_dat_hang),
foreign key(ma_vat_tu) references vay_tu(ma_vat_tu)
);

create table phieu_xuat(
so_phieu_xuat int primary key auto_increment,
ngay_xuat date not null
);

create table chi_tiet_phieu_xuat(
so_phieu_xuat int not null,
ma_vat_tu int not null,
don_gia_xuat double not null,
so_luong_xuat double not null,
primary key (so_phieu_xuat,ma_vat_tu),
foreign key (so_phieu_xuat) references phieu_xuat(so_phieu_xuat),
foreign key (ma_vat_tu) references vay_tu(ma_vat_tu)
);

create table phieu_nhap(
so_phieu_nhap int primary key auto_increment,
ngay_nhap date not null
);

create table chi_tiet_phieu_nhap(
so_phieu_nhap int not null,
ma_vat_tu int not null,
don_gia_nhap double not null,
so_luong_nhap double not null,
primary key (so_phieu_nhap,ma_vat_tu),
foreign key (so_phieu_nhap) references phieu_nhap(so_phieu_nhap),
foreign key (ma_vat_tu) references vay_tu(ma_vat_tu)
);