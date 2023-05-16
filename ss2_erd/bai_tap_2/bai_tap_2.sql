create database ss2_bai_tap_quan_ly_ban_hang;
use ss2_bai_tap_quan_ly_ban_hang;

create table customer(
id_customer int primary key auto_increment,
name_customer varchar(100) not null,
age_customer int not null
);

create table oder(
id_oder int primary key auto_increment,
id_customer int not null,
date_customer date not null,
total_price_customer int,
foreign key(id_customer) references customer(id_customer)
);

create table product(
id_product int primary key auto_increment,
name_product varchar(100) not null,
price_product int
);

create table oder_detail(
id_oder int not null,
id_product int not null,
oder_qty int not null,
primary key (id_oder,id_product),
foreign key(id_oder) references oder(id_oder),
foreign key(id_product) references product(id_product)
);