create database roduct_management;

use roduct_management;

create table products(
id int primary key auto_increment,
product_code varchar(45),
product_name varchar(45),
product_price double,
product_amount int,
product_description varchar(200),
product_status bit
);

insert into products(product_code, product_name, product_price, product_amount, product_description, product_status)
values("1", "phone", 100.50, 1000, "good", 1),
("2", "lap", 1500.60, 2000, "good", 0),
("3", "tab", 200.50, 500, "good", 1);

-- c3
create unique index index_name on products(product_name); 
create unique index index_name_price_code on products(product_name, product_code);
explain select * from products
where product_name = "lap";

-- c4
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.	
create view product_info as
select product_code, product_name, product_price, product_status
from products;

-- Tiến hành sửa đổi view
set sql_safe_updates = 0;
update product_info
set product_price = 500
where product_code = "3";

select * from product_info;

-- Tiến hành xoá view
drop view get_product_info;

-- c5
--  Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure get_all ()
begin
select *
from products;
end //
delimiter ;

call get_all();

-- Tạo store procedure thêm một sản phẩm mới
delimiter //	
create procedure addNewProduct(p_code varchar(45), p_name varchar(45), p_price double, 
p_amount int, p_description varchar(200), p_status bit)
begin 
insert into products(product_code, product_name, product_price, product_amount, product_description, product_status)
values(p_code, p_name, p_price, p_amount, p_description, p_status);
end //
delimiter ;

call addNewProduct(4, "key", 20, 2, "good", 1);

call get_all();

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure edit_product(p_id int, p_new_description varchar(255))
begin 
update products
set product_description = p_new_description
where id = p_id;
end //
delimiter ; 

call edit_product(2, "aaaaa");

-- Tạo store procedure xoá sản phẩm theo id

delimiter //
create procedure delete_product(p_id int)
begin 
delete from products
where id = p_id;
end //
delimiter ;

call delete_product(1);
